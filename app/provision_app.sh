#!/bin/bash

#update and upgrade
sudo apt-get update -y
sudo apt-get upgrade -y

#install nginx
sudo apt-get install nginx -y

#start nginx and make sure it runs from boot
sudo systemctl start nginx
sudo systemctl enable nginx

#Install Node.js 6.x repositorynpm 

sudo systemctl status nginx 

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

#Install Node.js and npm
sudo apt-get install -y nodejs
sudo npm install pm2 -g

# install python software properties
sudo apt-get install python-software-properties -y

#copy over new default and run it
sudo cp default /etc/nginx/sites-available
sudo nginx -t
sudo systemctl restart nginx
sudo systemctl enable nginx

#navigate to app folder, instal npm and run the app
cd app/app/app
sudo npm install 
node seeds/seed.js
sudo npm start -d
