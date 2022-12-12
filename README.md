Setting up the webapp
#0. Install the following libraries:
	https://github.com/drewlinsley/clickmap_prediction
	
	https://github.com/drewlinsley/tf_experiments
	
	https://github.com/drewlinsley/dc_webapp
	
	They are set up under the assumption that (c) lives on a VM, while (a,b) live on a workstation with a GPU that is accessible via SSH.
	
	sudo apt-get install npm nodejs
	
	npm install
	
        (if using anaconda, you may need to use the following commands:
        conda install nomkl numpy scipy scikit-learn numexpr
        conda remove mkl mkl-service
        )


#1. Prepare postgresql databse
	sudo apt-get install postgresql libpq-dev postgresql-client postgresql-client-common #Install posetgresql with online installer
	
	sudo -i -u postgres #goes into postgres default user
	
	psql postgres #enter the postgres interface
	
	create role mircs WITH LOGIN superuser password 'XXX'; #create the admin for this webapp. make sure this password is also reflected in db.js/db_pw
	
	alter role mircs superuser; #ensure we are sudo
	
	create database mircs with owner mircs; #create the webapp's database
	
	\q #quit
	
	psql mircs -h 127.0.0.1 -d mircs < node_modules/connect-pg-simple/table.sql #prepare the database for connect-pg-simple middlware
	
	psql mircs -h 127.0.0.1 -d mircs #log into the database with the admin credentials
	create table images (_id bigserial primary key, image_path varchar, syn_name varchar, click_path json, answers json, generations bigint); #create a table that will point to all the images in the webapp
	
	create table image_count (_id bigserial primary key,num_images bigint, current_generation bigint, iteration_generation bigint, generations_per_epoch bigint); #create a table that holds the number of images we are working with (for random selection later on)
	
	create table cnn (_id bigserial primary key, sixteen_baseline_accuracy float, nineteen_baseline_accuracy float, sixteen_attention_accuracy float, nineteen_attention_accuracy float, epochs bigint, date varchar); #create a table that will track some fun stuff for the website, like consecutive clicks
	
	create table clicks (_id bigserial primary key, high_score float, date timestamp with time zone); #create a table that will track some fun stuff for the website, like consecutive clicks
	
	create table users (_id bigserial primary key, cookie varchar unique, name varchar, score float, email varchar, last_click_time timestamp with time zone); #user table
	
	\q # Exit sql
	
	exit # Exit sql user

#2. Initialize images into the database

	python prepare_ims.py

=======
#3. Run the CNN guess server (preferrably in a screen):

	cd guess_server
	
	python guess_server.py
