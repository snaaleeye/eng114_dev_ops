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

- nginx status/install

`sudo systemctl status nginx`

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

`sudo apt-get install -y nodejs` 

- install npm pm2  
`sudo npm install pm2 -g`

- install python software properties
`sudo apt-get install python-software-properties -y`

- install npm and start npm

`cd app/app/app` - need to move to this folder in order to run in the right place. 
`sudo npm install -y`
`sudo npm start -d`
