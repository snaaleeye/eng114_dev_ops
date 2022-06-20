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
sudo cp default /etc/nginx/sites-available/
sudo nginx -t
sudo systemctl restart nginx
sudo systemctl enable nginx


sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927
echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list


#update and upgrade
sudo apt-get update -y
sudo apt-get upgrade -y


##install mongodb-org=3.2.20 -y
sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20

sudo systemctl start mongod
sudo systemctl enable mongod

#copy/run mongodb config 
sudo cp mongod.conf /etc/mongod.conf

sudo systemctl restart mongod
sudo systemctl enable mongod

sudo echo "export DB_HOST=mongodb://192.168.56.15:27017/posts" >> ~/.bashrc
sudo source ~/.bashrc

#navigate to app folder, instal npm and run the app
cd app/app/app
sudo npm install 
node seeds/seed.js
sudo npm start -d
