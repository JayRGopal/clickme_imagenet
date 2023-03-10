# ClickMe Full ImageNet Version

## 1 - Discoveries

Looked into skipping images. Appears like the label in guess_server.py does not update. If you look at the backend log, when it skips, it says PREDICTED CORRECTLY multiple times.


Looked into prepare_ims. Once the column iteration_generations in the table image_count goes from 0 to 1, the website seems to stop pulling new images. We looked in db.js and couldn't find any code where it was filtering by this condition. Note that removing all filters ("WHERE ...") from db.js makes it so that re-running prepare_ims.py does NOT fix the "image run out" issue




## TO DO

Needs: 


Connect to Google Cloud 

Once all users (together) annotate the entire dataset, prepare_ims.py needs to be reset. Temporary fix: re-run prepare_ims.py 

Need to move the db_dump to google cloud

Once you get image right, it flips through many imgs before getting to next image. Flips through at different speeds

Passwords



Wants:

Convert data_proc_config to yaml




# Quick Setup for TPU-VM's


## 1. Get on a TPU-VM

Once you have created the TPU-VM you will use to host ClickMe, open a tmux/screen window and run:

	gcloud alpha compute tpus tpu-vm ssh <TPU_NAME> --zone=<ZONE_NAME>
	git clone https://github.com/JayRGopal/clickme_imagenet.git

## 2. Setup the guess server backend

	chmod u+x clickme_imagenet/quick_setup_backend.sh
	./clickme_imagenet/quick_setup_backend.sh

## 3. Setup the frontend

Detach from the screen/tmux window you are on, open a new one, reconnect to the TPU and run the frontend

	gcloud alpha compute tpus tpu-vm ssh <TPU_NAME> --zone=<ZONE_NAME>
	node clickme_imagenet/main.js

# Manual Setup

To run ClickMe, clone this repository onto whatever will act as the server publicly hosting the website. The recommended method is using a Google TPU virtual machine and hosting it there (if doing this, make a TPU-VM, SSH into it, and clone the repository there). The host server needs to have either a GPU or TPU availabe. After cloning the repository, do the following steps (the rest of the instructions will assume being on a TPU-VM).

## 0. SSH into the TPU-VM

It is recommended that you do this in either a screen or tmux window so that the SSH connection doesn't die

	gcloud alpha compute tpus tpu-vm ssh <TPU_NAME> --zone=<ZONE_NAME>

## 1. Initial installs:
	
	sudo apt-get update
	sudo apt-get install npm nodejs
	cd clickme_imagenet/
	npm install

Note: if using anaconda, you may need to use the following commands:
* ```conda install nomkl numpy scipy scikit-learn numexpr```
* ```conda remove mkl mkl-service```

## 2. Prepare postgresql databse

Install posetgresql with online installer

	sudo apt-get install postgresql libpq-dev postgresql-client postgresql-client-common
	sudo -u postgres psql

You will now be in the postgres interface

	create role mircs WITH LOGIN superuser password 'serrelab';
	alter role mircs superuser;
	create database mircs with owner mircs; 
	\q

Enter the next commands using the password created above ('serrelab')

	sudo -u postgres psql mircs -h 127.0.0.1 -d mircs < node_modules/connect-pg-simple/table.sql
	sudo -u postgres psql mircs -h 127.0.0.1 -d mircs
	create table images (_id bigserial primary key, image_path varchar, syn_name varchar, click_path json, answers json, generations bigint);
	create table image_count (_id bigserial primary key,num_images bigint, current_generation bigint, iteration_generation bigint, generations_per_epoch bigint);
	create table cnn (_id bigserial primary key, sixteen_baseline_accuracy float, nineteen_baseline_accuracy float, sixteen_attention_accuracy float, nineteen_attention_accuracy float, epochs bigint, date varchar);
	create table clicks (_id bigserial primary key, high_score float, date timestamp with time zone);
	create table users (_id bigserial primary key, cookie varchar unique, name varchar, score float, email varchar, last_click_time timestamp with time zone);
	\q

Some final installs

	npm install express pg express-server connect-pg-simple request yargs
	pip3 install psycopg2 opencv-python

## 3. Initialize images into the database

	python3 prepare_ims.py

## 4. Run the CNN guess server

This is the backend that runs the harmonized CNN and sends the prediction to the frontend

	cd guess_server
	pip3 install flask
	python3 guess_server.py

## 5. Run the frontend

Detach from the screen/tmux window you are on, open a new one, and reconnect to the TPU

	gcloud alpha compute tpus tpu-vm ssh <TPU_NAME> --zone=<ZONE_NAME>

Run the frontend

	cd clickme_imagenet/
	node main.js
