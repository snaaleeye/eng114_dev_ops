sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927
echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list


sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install mongodb-org=3.2.20 -y
sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20

sudo systemctl start mongod
sudo systemctl enable mongod

# To check if installation has been successful

mongo --eval 'db.runCommand({ connectionStatus: 1 })'

sudo systemctl status mongod

sudo echo "export DB_HOST=mongodb://192.168.56.15:27017/posts" >> ~/.bashrc

source ~/.bashrc

cd /etc mongod.config

sudo systemctl restart mongod

