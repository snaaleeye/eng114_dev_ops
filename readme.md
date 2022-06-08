# DevOps

![devops_diagram](https://user-images.githubusercontent.com/105854053/171031722-5e02759d-6969-44f5-91be-094ac07fd612.png)

What is DevOps/Role of DevOps?

DevOps is the combination of development and operations with a focus of working together, sharing responsibilities, using infrastructure as code to lead to greater efficiency. They use the automation of the deployment pipeline as well as shorter product cycle times using continuous integration, delivery and deployment.

Why is DevOps in high demand?

- DevOps eliminates the blame culture 
- Stops teams from working in silos
- Developed an environment to suit all parties. 

- Ease of use
- Flexibility 
- Robustness
- Cost effective

![DevOps Diagram ](https://user-images.githubusercontent.com/105854053/171032718-15a6c0cc-ab54-48d5-bbc9-e7574039db9e.jpeg)

What is Development Environment  

A development environment is the collection of processes and tools that are used to develop the source code for a program or software product. 

This involves the entire environment that supports the process end to end, including development, staging and production servers. 

The development environment automates or facilitates the routines involved in creating, testing, debugging, patching, updating, and maintaining software, including long-term maintenance.

![development environment ](https://user-images.githubusercontent.com/105854053/171032835-26b542d0-f234-4a6d-a05c-cd57d5099272.png)


- What are the four pillars of DevOps

- Continuous Planning.
- Continuous Integration.
- Continuous Delivery.
- Continuous Operations.

# Steps to set up vagrant/virtual box

sh - secure shell
.sh used for shell. 

1. `Vagrant up` - create virtual machine
2. `Vagrant ssh` - connect to virtual machine from bash.
3. `sudo apt-get update` - sends back to local host to use internet. If correct will connect to linux foundation. If internet is not shared, this will hang. Gets updates
4. `sudo apt-get upgrade` - any remaining updates. 
5. `sudo apt-get install nginx -y`
6. `systemctl status nginx` - nginx status
7. `Control c` to get shell back
8. `Exit` - to leave virtual machine

![virtual_box_diagram](https://user-images.githubusercontent.com/105854053/171032011-24f3be0e-e84c-47a6-b707-328b962fc03d.png)


# Linux Commands 
- `vagrant destroy` - destroy virtual machine
- `vagrant reload` - reload virtual machine

check nginx status `systemctl status nginx` or `stop` or `start` or `restart`


# Most used commands

- who am I `uname` or `uname-a`
- where am I `pwd`
- how to create a folder in linux `mkdir-name`
- how to check folder/file `ls` or `ls -a`
- change dir `cd name-dir`
- come out/back of/from the current location `cd`
- how to create a file `touch filename` `nano file` 
- `move test.txt` from current location to devops folder 
- cut paste 'mv foldername destination e.g. `mv test.txt devops`
- copy paste cp foldername destination e.g. `cp text.txt devops`
- `history` - shows you what you have done so far

#### File Permissions
- READ `r` WRITE `w` Execute `x` 
- How to check file permissions `ll` 
- change permission `chod permission file-name` adding `+x` makes it executable. 
Can also add numbers such as 400 meaning read only. 
chmod

Uses octal numbers:
4 - read
2 - write
1 - execute

- Add the sum of the numbers of the permissions you want to grant e.g 7 (4 + 2 + 1)
- Read, write, execute is 6 (4 + 2 + 1)
- Complete permissions are given as a three digit number
- Each digit corresponds to a context (owner, group, other)
e.g chmod 764 file1 (user = rwx, group = rw and others = read on file1)
- chmod 700 file1 (user = rwx)
- chmod 640 file1 (user = rw, group = r)
https://linuxhandbook.com/chmod-calculator/

### Bash Scripting 
- create a file called `provision.sh`
- change permission of this file `chmod +x provision.sh`
- first line `MUST BE` strting with `#!/bin/bash`
- update & upgrade 
- installed nginx 
- start nginx
- `enable nginx` - why this? to make sure it always runs
- stopped then started  
- To run our script `sudo ./provision.sh`

Vagrant Task
1. Create a file.sh on your localhost in the same location as vagrantfile
`sudo nano file.sh`

2. Create a new directory called environment to save your provision.sh locally.
mkdir environment 
cp provision.sh

3. Add these commands to your vagrantfile below your existing files. 
`config.vm.synced_folder ".", "/home/vagrant/"`
`config.vm.provision "shell", path: "environment/provision.sh"`


# App

What key questions should we be asking the Development team before we accept it to deploy it
- Where does it need to be deployed
- nodejs - which version of it?
- How many users can it handle
- Does it need to be automated
- What is the time frame
- What type of request
- Folder structure
- What are the dependencies required?
- Which language does it support?

`Seeds` are related to database - `if` 
`package.json` this is where all the dependencies are.
Tells us what versions are `suitable.jd`

Follow these steps to download all the necessary tests needed to run the app:

Run these locally: 
1. `gem install bundler`
2. `bundler`
3. `rake spec` - this checks tests - repeat after ever install. 

You will get errors as not all packages are installed.

These steps are inside the virtual machine:
`sudo apt-get install nodejs -y` - As the test needs version 6 we need to download that.

Install nodejs version 6:
1. `curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -`
2. `sudo apt-get install nodejs -y`

If this does not work try this first then redo steps from above: Also Add sudo as this could be an issue too. 
1. `sudo npm install pm2 -g`

2. `sudo apt-get install python-software-properties`

Final steps:
1. `rake spec` should now show all tests have passed. 

Inside app folder inside the virtual machine run these:
1. `npm install`
2. `npm start`

The app should now be running when ip address is entered
`192.168.56.10:3000` and `192.168.56.10:3000/fibonacci/8`

# Automation Task

To automate this, you can input the above commands into your provision.sh file.

`Vagrant reload` does not seem to work for me and I used `vagrant up` whenever I edited the provision.sh file. 

provision.sh file is very sensitive. I used the below commands and this worked for me.

### nginx status/install

`sudo systemctl status nginx`

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

`sudo apt-get install -y nodejs` 

### install npm pm2  
`sudo npm install pm2 -g`

### install python software properties
`sudo apt-get install python-software-properties -y`

### install npm and start npm

`cd app/app - need to move to this folder in order to run in the right place. 
`sudo npm install `
`sudo npm start -d` - -d = detatched mode and runs in background. 

### Creating variables in linux

1. $MY_NAME=Sharmake - This creates the variable
2. export MY_NAME=Sharmake
3. `env` - To check where in the environment the new variable is. 
4. Use printenv MY_NAME to only print variable. 

192.168.10.10
va
mongoDB port is DB_Host = IP:27017/POSTS

When an environment variable is set from the shell using the export command, its existence ends when the user’s sessions ends. This is problematic when we need the variable to persist across sessions.

### How to make environment variables persistant?

1. To set permanent environment variables for a single user, edit the .bashrc file:

`sudo nano ~/.bashrc`

2. Write a line for each variable you wish to add using the following syntax:

`export [VARIABLE_NAME]=[variable_value]`

3. Save and exit the file. The changes are applied after you restart the shell. If you want to apply the changes during the current session, use the source command:

`source ~/.bashrc` - This reads the file again and picks it up again.

4. To set permanent environment variables for all users, create an .sh file in the /etc/profile.d folder:

`sudo nano /etc/profile.d/[filename].sh`

5. The syntax to add variables to the file is the same as with `.bashrc`:

Use nginx as reverse proxy

### Setting up Nginx as a reverse proxy server
1. `sudo nano /etc/nginx/sites-available/default`
Ensure localhost matches port
sudo vim /etc/nginx/sites-available/default
`restart` (reboots) and `enable` (automatically boots nginx)

    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}

2. `sudo nginx -t` - to check there are no errors. 
3. `sudo systemctl restart nginx`
4. `sudo systemctl enable nginx`
4. cd app/app/app `npm start`

hybrid - half locally and half on cloud

Difference is security of the app belongs to the machine. If someone can hack my machine they can hack the app. When migrating to cloud we create a security code. Build our own firewall and create our own rules. We need a system that can monitor the health our app and alert us with a message/email. We will use cloudwatch to alert us. Simple if block on python if status code = 200, as soon as it is not 200 informs the team. What to do if its late at night, highly scalable and scaleout another instance. We will need a load balancer. Our job is to make sure the app is up and running 24/7. If the app goes down and customer user finds out first, it could be catastrophic for business. Reason for cloud is to avoid single point of failure destroying app. Monolith, two-tier, microservices. Containerisation = Kubernetes + Docker

A traditional `forward proxy` server allows multiple clients to route traffic to an external network. For instance, a business may have a proxy that routes and filters employee traffic to the public Internet.

A `reverse proxy`, on the other hand, routes traffic on behalf of multiple servers.

### Vagrant troubleshooting:
1. `ls -a`
2. `.vagrant` - delete this folder if there are issues. reloads corrupted machine

or

1. Open virtual box 
2. close 
3. power off 
4. remove 
5. delete all files 

###
- How to check process running in linux `top` or `ps aux` 
- How to kill a process? `sudo kill process-id`
- How to use piping | to sort out or short list process
- How to use `head` and `tail`

### Multi VM Task

- Create another VM for our db, mongodb
- Ubuntu 16.04 we'll use the same box as app
- Configure/install mongodb with correct version
- Allow the required access, allow ip of our app machine to connect to our db
- In our app machine by creating an ENV called DB_HOST
- cd/etc
- sudo nano mongod.conf - by default it allows access to 127.0.0.1 with port 27017
- edit mongod.conf to allow app ip or for the ease of use allow all - not best practice for production env - 0.0.0.0 (means allow any)
- restart and enable mongodb

### Common errors: 
- DB_HOST not found as it was created inside db. 
- Could we allow users to connect to DB? No as it is internal 


### How to install MongoDB
1. sudo apt-key adv 
echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

2. sudo apt-get update -y
3. sudo apt-get upgrade -y

# sudo apt-get install mongodb-org=3.2.20 -y
4. sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20

5. sudo systemctl start mongod
6. sudo systemctl enable mongod

To check if installation has been successful
7. mongo --eval 'db.runCommand({ connectionStatus: 1 })'
8. sudo systemctl status mongod



### Creating Mongodb as persistant environment variable

Inside DB environment 
1. sudo echo "export DB_HOST=mongodb://192.168.56.15:27017/posts" >> ~/.bashrc
2. source ~/.bashrc
3. cd /etc mongod.config
4. Change to 0.0.0.0 
4. restart mongodb
Return to app environment 
5. Create persistant environment variable DB_HOST
6. sudo echo "export DB_HOST=mongodb://192.168.56.15:27017/posts" >> ~/.bashrc
7. source ~/.bashrc

cd app
8. npm start
9. node seeds/seed.js - do this if page loads with missing info
10. npm start

Follow the above steps but keep checking through 3000/posts or /posts if it is working. 


### What is Cloud Comuting

Cloud computing is when you use a network of remote servers hosted on the internet to store, manage, and process date, rather than a local server or a personal computer. 

# Benefits
- Security 
- Reliability
- Scalability
- Collaboration
- Efficiency and cost effectiveness
- Flexibility
- Loss prevention
- Disaster recovery
- Automatic Software updates
- Competitive Edge
- Sustainability 

https://www.salesforce.com/products/platform/best-practices/benefits-of-cloud-computing/

# How does it fit into DevOps?

3 million hours 
Security - information security team Biometric 
Air conditioning - heat for optimisation
Multiple ways of destroying

Pay as you go 
Built on premises 
Helps us release software faster
Able to adapt quickly
Not beneficial for small scale/offices/labs

The Monolith
- Simple but has limitations and complexity 
- Heavy apps can slow down the start up time
- Each update results into redeploying the full stack app
- Challenging to scale up on demand
- Fruitful for simple and lightweight apps

<img width="99" alt="Screenshot 2022-06-08 at 14 18 20" src="https://user-images.githubusercontent.com/105854053/172626664-155221fa-f7f1-46cb-8c31-e6a109b1aa86.png">

- AWS Service

- EC2 - security group/s

- Data migration to cloud 

### What is Amazon Web Services (AWS)

AWS (Amazon Web Services) is a comprehensive, evolving cloud computing platform provided by Amazon that includes a mixture of infrastructure as a service (IaaS), platform as a service (PaaS) and packaged software as a service (SaaS) offerings.

Availability zones are important in case one data centre goes down to avoid having a single point of failure. 
Where there is a issue with zone, you would be diverted 

- Most functionality 
- Largest community of customers and partners 
- Most secure
- Fastest pace of innovation 
- Most proven operational expertise

AWS has the most extensive global cloud infrastructure. No other cloud provider offers as many Regions with multiple Availability Zones connected by low latency, high throughput, and highly redundant networking. AWS has 84 Availability Zones within 26 geographic regions around the world, and has announced plans for 24 more Availability Zones and 8 more AWS Regions in Australia, Canada, India, Israel, New Zealand, Spain, Switzerland, and United Arab Emirates (UAE). The AWS Region and Availability Zone model has been recognized by Gartner as the recommended approach for running enterprise applications that require high availability.

<img width="810" alt="Screenshot 2022-06-08 at 14 06 38" src="https://user-images.githubusercontent.com/105854053/172626761-20fdcac1-1800-4368-9140-8caf4a40f02a.png">


https://aws.amazon.com/what-is-aws/

### AWS best practices - naming convention

- Maximum number of tags per resource – 10
- Maximum key length – 127 Unicode characters 
- Maximum value length – 255 Unicode characters
- Tag keys and values are case sensitive 
- Tag keys must be unique per resource  
- Do not use the “aws:” prefix in your tag name or values because it is reserved for AWS use

### What is laaS 
Infrastructure as a service (IaaS) is a type of cloud computing service that offers essential compute, storage, and networking resources on demand, on a pay-as-you-go basis. IaaS is one of the four types of cloud services, along with software as a service (SaaS), platform as a service (PaaS), and serverless.

### What is Platform as a service (PaaS)
Platform as a service (PaaS) is a complete development and deployment environment in the cloud, with resources that enable you to deliver everything from simple cloud-based apps to sophisticated, cloud-enabled enterprise applications. You purchase the resources you need from a cloud service provider on a pay-as-you-go basis and access them over a secure Internet connection.

### What is SaaS

Software as a service (SaaS) allows users to connect to and use cloud-based apps over the Internet. Common examples are email, calendaring, and office tools (such as Microsoft Office 365).

SaaS provides a complete software solution that you purchase on a pay-as-you-go basis from a cloud service provider. You rent the use of an app for your organisation, and your users connect to it over the Internet, usually with a web browser. All of the underlying infrastructure, middleware, app software, and app data are located in the service provider’s data centre. The service provider manages the hardware and software, and with the appropriate service agreement, will ensure the availability and the security of the app and your data as well. SaaS allows your organisation to get quickly up and running with an app at minimal upfront cost.
