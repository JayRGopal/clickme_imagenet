import os, sys, re, shutil, psycopg2, credentials
import numpy as np
from glob import glob
from scipy import misc
from synset import get_synset
from data_proc_config import project_settings


def process_images(images, category_ims, mi, target_dir):
    #import pdb;pdb.set_trace()
    im_name = re.split(os.path.sep, images[category_ims[mi]])[-1]
    try:
        image_id = labels[int(re.split('_',im_name)[0])] #FIX THIS... WORDS ARE GETTING TRUNCATED
        #image_id = int(re.split('_',im_name)[0]) #FIX THIS... WORDS ARE GETTING TRUNCATED
    except:
        print("Failed to extract label from im_name using int(re.split('_',im_name)[0])")
        import pdb
        pdb.set_trace()
    target_path = os.path.join(target_dir, im_name)
    # shutil.copyfile(
    #     images[category_ims[mi]],
    #     target_path)
    return target_path,image_id 


def mirc_syns():
    syn = {};
    # syn['7'] = 'n01614925'  # bald eagle
    # syn['1'] = 'n02389026'  # sorrel
    # syn['4'] = 'n02690373'#airliner n02106166
    # syn['0'] = 'n04285008'#sportscar n02106166
    # syn['2'] = 'n03792782'#bike n02106166
    # syn['3'] = 'n02687172'#warship n02106166
    # syn['8'] = 'n02190166'#bug n02106166
    # syn['5'] = 'n04356056'#glasses n02106166
    # syn['6'] = 'n04350905'#suit n02106166
    syn['0'] = 'n03761084' #microwave
    syn['1'] = 'n03446268' #golfclub
    syn['2'] = 'n13083023' #houseplant
    syn['3'] = 'n04452848' #tooth
    syn['4'] = 'n02121620' #cathead
    syn['5'] = 'n04490091' #truck
    syn['6'] = 'n03346455' #fireplace
    syn['7'] = 'n03978966' # t-shirt
    syn['8'] = 'n07730207' # carrot
    syn['9'] = 'n07873807' # pizza slice
    syn['10'] = 'n04250850' # snorkel
    syn['11'] = 'n03743279' # megaphone
    syn['12'] = 'n02871963' # boomerang
    syn['13'] = 'n11843441' # cactus
    syn['14'] = 'n02831595' # shorts
    syn['15'] = 'n04480853' # triangle
    syn['16'] = 'n02900705' # suitcase
    syn['17'] = 'n07767847' # pear
    syn['18'] = 'n04225987' # skateboard
    syn['19'] = 'n03488188' # saw
    syn['20'] = 'n02068974' # dolphin
    syn['21'] = 'n03720163' # map
    syn['22'] = 'n03221720' # door
    syn['23'] = 'n03623556' # knife
    syn['24'] = 'n03359137' # flashlight

    skeys = syn.keys()
    return syn, skeys


def get_mirc_syns(files):
    syns = mirc_syns()[0]
    fnames = [re.split('\.',re.split('mircs',x)[-1])[0] for x in files]
    return [syns[x] for x in fnames]  


def add_to_db(files,syns,image_count):
    for im, syn in enumerate(zip(files,syns)):
        cur.execute("INSERT INTO images (image_path, syn_name, generations) VALUES (%s,%s,%s)",(im,syn,0))
    image_count += len(files)
    return image_count


# Load project config — insert yaml coded here
config = project_settings()

# Fixed directories
nsf_dir =  config.nsf_image_path  # ~1000 nsf images
mirc_dir = config.mirc_image_path  # 10 mirc images

# Random sampling directories
im_dir = config.imagenet_train_path
target_dir = config.imagenet_train_path
validation_dir = config.imagenet_train_path  #only used if create_validation_set = True (vestige)

try:
    original_umask = os.umask(0)
    
    if not os.path.exists(target_dir):
        os.makedirs(target_dir)
    if not os.path.exists('db_dump'):
        os.makedirs('db_dump')

finally:
    os.umask(original_umask)
    
# Get synsets or other labels
_, labels = get_synset()

# Connect to database
connection_string = credentials.python_postgresql()
conn = psycopg2.connect(connection_string)
cur = conn.cursor()

# Grab an equal number of images from each category
num_per_category = 100
num_categories = 25
generations_per_epoch = 1
clear_previous = False #True  # Reset images table when you run this
create_validation_set = False

# Pull all images with config.im_ext extension from im_dir
images = glob(os.path.join(im_dir, '*{}'.format(config.im_ext)))
#import pdb;pdb.set_trace()
# Get names of each file to compare to synset labels
im_names = np.asarray(
    [re.split('_',re.split(os.path.sep,x)[-1])[0] for x in images])
#import pdb;pdb.set_trace()
im_categories = np.unique(im_names)
print("All categories:",im_categories)
selected_categories = np.copy(im_categories)
np.random.shuffle(selected_categories)
selected_categories = selected_categories[:num_categories]
print("Selected categories:", selected_categories)

# Clear previous images -- no reason to do this unless debugging
# if clear_previous:
#     cur.execute("TRUNCATE TABLE images")
#     for emptydir in [target_dir, validation_dir]:
#         for fn in glob(os.path.join(emptydir, '*.JPEG')):#return 
#             os.remove(fn)

# First add in our randomly sampled images
image_count = 0

#pdb.set_trace()
for cn in range(num_categories):
    #import pdb;pdb.set_trace()
    print("What1",selected_categories[cn])
    category_ims = np.where(im_names == selected_categories[cn])[0]
    # print("Category Images:", category_ims)
    np.random.shuffle(category_ims)
    for mi in range(num_per_category):
        target_path,image_id = process_images(
            images,
            category_ims,
            mi,
            target_dir)
        image_count += 1 #to ensure we are getting an accuracte count of images
        #import pdb;pdb.set_trace()
        cur.execute(
            "INSERT INTO images (image_path, syn_name, generations) VALUES (%s,%s,%s)",
                (target_path, image_id, 0)
            )
    if create_validation_set:
        # Now copy the rest of the images into the validation folder
        for mi in range(num_per_category,len(category_ims)):
            process_images(
                images,
                category_ims,
                mi,
                validation_dir)
print("Final Image Count:", image_count)

# #Now add in our fixed images
# nsf_images = glob(os.path.join(nsf_dir,'*.JPEG'))
# nsf_syns = [re.split('_',re.split('/',x)[-1])[0] for x in nsf_images]
# image_count = add_to_db(nsf_images,nsf_syns,image_count)

# mirc_images = glob(os.path.join(mirc_dir,'*.JPEG'))
# mirc_syns = get_mirc_syns(mirc_images)
# image_count = add_to_db(mirc_images,mirc_syns,image_count)

####                
cur.execute("INSERT INTO image_count (num_images,current_generation,iteration_generation,generations_per_epoch) VALUES (%s,%s,%s,%s)",(image_count,0,0,generations_per_epoch))
cur.execute("INSERT INTO clicks (high_score) VALUES (%s)",(0,))
#cur.execute("INSERT INTO cnn (_id) VALUES (%s)",(0,))

#Finalize and close connections
conn.commit()
cur.close()
conn.close()

# #Initialize CNN accuracies
# print('DB is initialized. Now running CNNs.')

# ##If you have local GPUs
# import run_cnns
# run_cnns.main()
