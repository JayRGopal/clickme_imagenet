![Screenshot of the webapp](https://github.com/serre-lab/click_draw/blob/main/clickdraw.png)
*Screenshot of the Webapp*

# Setting up the webapp

```
sudo apt-get install npm nodejs
npm install
```
	
If using anaconda, you may need to use the following commands:

```
conda install nomkl numpy scipy scikit-learn numexpr
conda remove mkl mkl-service
```

## Step 1: Prepare postgresql database

Install posetgresql with online installer
```
sudo apt-get install postgresql libpq-dev postgresql-client postgresql-client-common 
```

Goes into postgres default user
```
sudo -i -u postgres
```

Enter the postgres interface
```
psql postgres 
```

Create the admin for this webapp. make sure this password is also reflected in `db.js/db_pw`
```
create role mircs WITH LOGIN superuser password 'XXX';
```

Ensure we are sudo
```
alter role mircs superuser; 
```

Create the webapp's database
```
create database mircs with owner mircs; 
```

Quit PSQL
```
\q
```

## Step 2: Add the required tables

Prepare the database for connect-pg-simple middlware
```
psql mircs -h 127.0.0.1 -d mircs < node_modules/connect-pg-simple/table.sql 
```

Log into the database with the admin credentials
```
psql mircs -h 127.0.0.1 -d mircs 
```

Create a table that will point to all the images in the webapp
```
create table images (_id bigserial primary key, image_path varchar, syn_name varchar, click_path json, answers json, generations bigint); 
```

Create a table that holds the number of images we are working with (for random selection later on)
```
create table image_count (_id bigserial primary key,num_images bigint, current_generation bigint, iteration_generation bigint, generations_per_epoch bigint);
```

Create a table that will track some fun stuff for the website, like consecutive clicks
```	
create table cnn (_id bigserial primary key, sixteen_baseline_accuracy float, nineteen_baseline_accuracy float, sixteen_attention_accuracy float, nineteen_attention_accuracy float, epochs bigint, date varchar);
```

Create a table that will track some fun stuff for the website, like consecutive clicks
```
create table clicks (_id bigserial primary key, high_score float, date timestamp with time zone); 
```

Create the User table
```
create table users (_id bigserial primary key, cookie varchar unique, name varchar, score float, email varchar, last_click_time timestamp with time zone);
```
	
## 2. Initialize images into the database

```
python prepare_ims.py
```

## 3. Run the model guess server (preferrably in a screen):
```
cd guess_server	
python guess_server.py
```
