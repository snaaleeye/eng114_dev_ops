#!/bin/bash

# update
sudo apt-get update -y

# upgrade
sudo apt-get upgrade -y

# install nginx
sudo apt-get install nginx -y

# start nginx
sudo systemctl start nginx 

# enable nginx
sudo systemctl enable nginx

# test status

sudo systemctl status nginx 

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

sudo apt-get install -y nodejs 

# install npm pm2  
sudo npm install pm2 -g

# install python software properties
sudo apt-get install python-software-properties -y

# install npm and start npm

cd app/app/app
sudo npm install -y
sudo npm start -d

