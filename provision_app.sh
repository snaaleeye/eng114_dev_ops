cd app/app/app

sudo echo "export DB_HOST=mongodb://192.168.56.15:27017/posts" >> ~/.bashrc

sudo npm start

node seeds/seed.js # do this if page loads with missing info

sudo npm start -d
