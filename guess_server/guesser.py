#!/usr/bin/env python
# CNN and cached image holder answering guesses

import os
import cv2
from PIL import Image
import keras
os.environ['CUDA_VISIBLE_DEVICES'] = '1' # Run only on GPU 0 to speed up init time
#import tensorflow.compat.v1 as tf
import tensorflow as tf
#tf.disable_v2_behavior()
#tf.disable_eager_execution()
import numpy as np
# from tf_experiments.experiments.config import pretrained_weights_path, full_syn, dc_data_dir
# from tf_experiments.model_depo import vgg16
# from utils import ImageCache
# from synset import get_synset

from skimage import data, io
from matplotlib import pyplot as plt

import argparse

parser = argparse.ArgumentParser(description='Run the Guess Server for model predictions.')
parser.add_argument('--backend', type=str, required=False, default="gpu")

args = parser.parse_args()

data_dir = '../images/' 
model_dir = '../models/clickdraw_mobilenet.h5'

class_names = ['microwave', 'golf club', 'house plant', 'tooth', 'cat head', 'truck', 'fireplace', 't-shirt', 'carrot', 'pizza slice', 'snorkel', 'megaphone', 'boomerang', 'cactus', 'shorts', 'triangle', 'suitcase', 'pear', 'skateboard', 'saw', 'dolphin', 'map', 'door', 'knife', 'flashlight']

# CANVAS_SIZE = (224, 224)
CANVAS_SIZE = (256, 256)

# TPU Code
if args.backend == "tpu":
    resolver = tf.distribute.cluster_resolver.TPUClusterResolver(tpu='local')
    tf.config.experimental_connect_to_cluster(resolver)
    tf.tpu.experimental.initialize_tpu_system(resolver)
    strategy = tf.distribute.experimental.TPUStrategy(resolver)


# def preprocess_harmonized(image, final_size=(224, 224)):
def preprocess_harmonized(image, final_size=(256, 256)):
    ## image is (X, Y, 3).
    _mean_imagenet = tf.constant([0.485, 0.456, 0.406], shape=[1, 1, 3], dtype=tf.float32)
    _std_imagenet =  tf.constant([0.229, 0.224, 0.225], shape=[1, 1, 3], dtype=tf.float32)
    image  = np.array(image / 255.0, dtype=np.float32)
    image  = np.array(image - _mean_imagenet, dtype=np.float32)
    image  = np.array(image / _std_imagenet, dtype=np.float32)
    image = tf.image.resize_with_crop_or_pad(image, final_size[0], final_size[1])
    image   = tf.cast(image, tf.float32)

    return image


def load_im(im_name, data_dir=data_dir, final_size=CANVAS_SIZE):
    fpath = data_dir + im_name
    im = Image.open(fpath)
    im = np.array(im, dtype=np.float32)
    if len(im.shape) == 2:
      im = im[..., None].repeat(3, -1)
    im = tf.image.resize_with_crop_or_pad(im, final_size[0], final_size[1]) # Crop/pad instead of resize
    im = np.array(im , dtype=np.float32)
    return im

def init_session():
    config = tf.ConfigProto(
    device_count={'GPU': 1},
    intra_op_parallelism_threads=1,
    allow_soft_placement=True
    )

    config.gpu_options.allow_growth = True
    config.gpu_options.per_process_gpu_memory_fraction = 0.6

    session = tf.Session(config=config)
    tf.keras.backend.set_session(session)
    return session
    #return tf.Session(config=tf.ConfigProto(gpu_options=(tf.GPUOptions(per_process_gpu_memory_fraction=0.95))))

'''
def load_model_vgg16():
    # Load a default vgg16
    ##image_shape = (224, 224, 3)
    #weight_path = os.path.join(pretrained_weights_path, 'vgg16.npy')
    #vgg = tf.keras.models.load_model('/home/jgopal/jgopal/models/saliency_volcanic_monkey.h5', compile = True)
    vgg = tf.keras.models.load_model('/home/jgopal/jgopal/models/saliency_volcanic_monkey.h5')
    
    #vgg = vgg16.Vgg16(vgg16_npy_path=weight_path)
    #import pdb;pdb.set_trace()
    ##input = tf.keras.Input(shape= image_shape, batch_size = batch_size,  dtype= tf.float32)  #tf.placeholder("float", (batch_size,) + image_shape)
    ##vgg._build_input_shape = input.shape
    #with tf.name_scope("content_vgg"):
    #    vgg.build(input)
    # Return model and input tensor
    return vgg
'''

def load_guesser():
    if args.backend == "tpu":
        with strategy.scope():
            return tf.keras.models.load_model(model_dir)
    return tf.keras.models.load_model(model_dir)
    
def get_image_prediction(guesser, image_name, clicks, click_size=21): # TODO: Using a larger click size for debugging
    # Return prediction index
    # Load image into batch
    #import pdb;pdb.set_trace()
    # print("Image Name:", image_name)
    #image = guesser.image_cache.load_image(image_name)
    # cv2.imwrite(image_name, image)
    # Transfer as clicks onto empty image
    input_shape = (1, guesser.input.shape[1], guesser.input.shape[2], guesser.input.shape[3])
    #print(input_shape)
    im = load_im(image_name)
    im = preprocess_harmonized(im, final_size=(input_shape[1], input_shape[2]))
    input_batch = np.zeros(input_shape)
    #guesser.input_batch[0, ...] = np.clip(image + np.random.normal(scale=0.4, size=image.shape) - 0.5, 0.0, 1.0)
    crop_offset = [(i - c) / 2 for (i, c) in zip(CANVAS_SIZE, input_shape[1:3])]
    #crop_offset = guesser.image_cache.crop_margin
    for click in clicks:
        # print("#Clicks:", click)
        y = int(round(click[1] - crop_offset[0]))
        x = int(round(click[0] - crop_offset[1]))
        y0 = max(y - click_size // 2, 0)
        y1 = min(y + (click_size+1) // 2, input_shape[1])
        x0 = max(x - click_size // 2, 0)
        x1 = min(x + (click_size+1) // 2, input_shape[2])
        input_batch[0, y0:y1, x0:x1, :] = im[y0:y1, x0:x1, :]

    if args.backend == "tpu":
        with strategy.scope():
            prob = guesser.predict(input_batch)
    else:
        prob = guesser.predict(input_batch)
    #print("Probability:", prob)
    #prob = guesser.session.run(guesser.predict, feed_dict=guesser.feed_dict)[0].squeeze()
    # Get class index
    class_index = np.argmax(prob)
    # Resolve class to name
    prediction_name = class_names[class_index]
    #import pdb;pdb.set_trace()
    # print("Model Confidence:", prob[0][class_index])
    return prediction_name
