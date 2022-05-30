# DevOps

What is DevOps/Role of DevOps?

DevOps is the combination of development and operations with a focus of working together, sharing responsibilities, using infrastructure as code to lead to greater efficiency. They use the automation of the deployment pipeline as well as shorter product cycle times using continuous integration, delivery and deployment.

- Why is DevOps in high demand?

DevOps eliminates the blame culture and stops working in silos
Developed an environment to suit all parties. 

- What is Development Environment  

A development environment is the collection of processes and tools that are used to develop the source code for a program or software product. This involves the entire environment that supports the process end to end, including development, staging and production servers. The development environment automates or facilitates the routines involved in creating, testing, debugging, patching, updating, and maintaining software, including long-term maintenance.

- What are the four pillars of DevOps

- Planning
- Sourcing
- Developing
- Distributing

Sofware Development lifecycle

- Ease of use
- Flexibility 
- Robustness
- Cost effective

sh - secure shell
.sh used for shell. 

Steps to set up vagrant/virtual box

1. `Vagrant up` - create virtual machine
2. `Vagrant ssh` - connect to virtual machine from bash.
3. `sudo apt-get update` - sends back to local host to use internet. If correct will connect to linux foundation. If internet is not shared, this will hang. Gets updates
4. `sudo apt-get upgrade` - any remaining updates. 
5. `sudo apt-get install nginx -y`
6. `systemctl status nginx` - nginx status
7. `Control c` to get shell back
8. `Exit` - to leave virtual machine

## Linux Commands 
- `vagrant destroy` - destroy virtual machine
- `vagrant reload` - reload virtual machine

check nginx status `systemctl status nginx` or `stop` or `start` or `restart`



## Most used commands

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
