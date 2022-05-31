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
Add the sum of the numbers of the permissions you want to grant e.g 7 (4 + 2 + 1)
Read, write, execute is 6 (4 + 2 + 1)
Complete permissions are given as a three digit number
Each digit corresponds to a context (owner, group, other)
e.g chmod 764 file1 (user = rwx, group = rw and others = read on file1)
chmod 700 file1 (user = rwx)
chmod 640 file1 (user = rw, group = r)
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