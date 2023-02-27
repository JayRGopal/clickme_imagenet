#!/bin/bash

Blue=$'\e[0;34m'
Color_Off=$'\e[0m'

echo "${Blue}starting up...${Color_Off}"
echo y | sudo apt-get update
echo y | sudo apt-get install npm nodejs
cd clickme_imagenet/
echo y | npm install

echo "${Blue}initializing postgres database...${Color_Off}"
echo y | sudo apt-get install postgresql libpq-dev postgresql-client postgresql-client-common
echo "create role mircs WITH LOGIN superuser password 'serrelab';" | sudo -u postgres psql
echo "create database mircs with owner mircs;" | sudo -u postgres psql
echo "${Blue}For the following password prompts type in 'serrelab'${Color_Off}"
sudo -u postgres psql mircs -h 127.0.0.1 -d mircs < node_modules/connect-pg-simple/table.sql
echo "create table images (_id bigserial primary key, image_path varchar, syn_name varchar, click_path json, answers json, generations bigint);" | sudo -u postgres psql mircs -h 127.0.0.1 -d mircs
echo "create table image_count (_id bigserial primary key,num_images bigint, current_generation bigint, iteration_generation bigint, generations_per_epoch bigint);" | sudo -u postgres psql mircs -h 127.0.0.1 -d mircs
echo "create table cnn (_id bigserial primary key, sixteen_baseline_accuracy float, nineteen_baseline_accuracy float, sixteen_attention_accuracy float, nineteen_attention_accuracy float, epochs bigint, date varchar);" | sudo -u postgres psql mircs -h 127.0.0.1 -d mircs
echo "create table clicks (_id bigserial primary key, high_score float, date timestamp with time zone);" | sudo -u postgres psql mircs -h 127.0.0.1 -d mircs
echo "create table users (_id bigserial primary key, cookie varchar unique, name varchar, score float, email varchar, last_click_time timestamp with time zone);" | sudo -u postgres psql mircs -h 127.0.0.1 -d mircs

echo "${Blue}additional installs...${Color_Off}"
npm install express pg express-server connect-pg-simple request yargs
pip3 install psycopg2 opencv-python

echo "${Blue}adding images to database...${Color_Off}"
python3 prepare_ims.py

echo "${Blue}setting up for backend server..."
cd guess_server
echo y | pip3 install flask opencv-python scikit-image matplotlib

echo "${Blue}running the backend server...${Color_Off}"
python3 guess_server.py