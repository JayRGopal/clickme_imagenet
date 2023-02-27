#!/bin/bash

echo 'starting up...'
sudo apt-get update
sudo apt-get install npm nodejs
cd clickme_imagenet/
npm install


echo 'initializing postgres database...'
sudo apt-get install postgresql libpq-dev postgresql-client postgresql-client-common
sudo -u postgres psql
psql -U postgres -c "create role mircs WITH LOGIN superuser password 'serrelab';"

# alter role mircs superuser;
# create database mircs with owner mircs; 
# \q
# sudo -u postgres psql mircs -h 127.0.0.1 -d mircs < node_modules/connect-pg-simple/table.sql
# sudo -u postgres psql mircs -h 127.0.0.1 -d mircs
# create table images (_id bigserial primary key, image_path varchar, syn_name varchar, click_path json, answers json, generations bigint);
# create table image_count (_id bigserial primary key,num_images bigint, current_generation bigint, iteration_generation bigint, generations_per_epoch bigint);
# create table cnn (_id bigserial primary key, sixteen_baseline_accuracy float, nineteen_baseline_accuracy float, sixteen_attention_accuracy float, nineteen_attention_accuracy float, epochs bigint, date varchar);
# create table clicks (_id bigserial primary key, high_score float, date timestamp with time zone);
# create table users (_id bigserial primary key, cookie varchar unique, name varchar, score float, email varchar, last_click_time timestamp with time zone);
# \q

# echo 'adding images to database...'
# python3 prepare_ims.py

# echo 'starting backend guess server...'
# cd guess_server
# pip3 install flask
# python3 guess_server.py