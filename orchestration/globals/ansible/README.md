Read Me for the setup of Ansible to Connect to a Digital Ocean Machine
================


Author Nicholas Herriot
Created 10th Sep 2016

The scripts within this directory should be copied to your ansible directory.
Hence you should do the following:


## Install Ansible

Install the latest version of ansible to your machine:

/>  sudo pip install ansible )


## Copy To Directory

Copy the hosts and ansible.cfg file to /etc/ansible on your machine.

/> sudo cp ansible.cfg /etc/ansible
/> sudo cp hosts /etc/ansible

The droplet already created is:
* Droplet created 17/01/2016
* OS Linux Ubuntu 14.04 LTR (5 years support)
* 1/2 Gig Ram
* 20 Gig SSD
* Deployed London.


## Creating SSH Path For Ansible To Cambridge Home Help

Ansible will do all the heavy lifting to setup your machine but it needs
to be able to connect to the server. For that we need to use SSH keys. In
other words a public/private key exchange between machines. So the steps
will be:
1) Ansible connects with root.
2) Ansible creates new users.
3) Ansible gives users sudo access.
4) Ansible installs pub/pirv keys for users.
5) Ansible stops root access via SSH and restarts SSH.

Further connections should be secure. We also need some helper packages to help provision our machines.
For this use sshpass which allows us to securly send passwords over a network interface and install into
a machine

/> sudo apt-get install sshpass


### 1) Ansible Connect With Root

We will connect ansible to our machine in this instance it will be 'ubuntuCambridgeHomeStart' on digital
oceans with the IP address of: 104.236.14.123. The machine name that ansible will lookup for this IP address
is 'chh-dev' which is defined in the hosts file.
Ansible will try and connect as 'root'. However we will not use a 'root' password, we will allow the machines
to swap pub/private key exchange via ssh. This is the only manual step you will have to do. First manually add
your SSH public key to the remote machine (You should have already created your pub/private key on your local
machine).

/> ssh-copy-id root@104.236.14.123

You will be prompted for the root password. See your admin guy to get the root password and allow you to add
your public key to the remote machine.

Next place your id_rsa.pub file inside the 'vars' directory. Your file is inside ~/.ssh directory.


### 2) 3) 4) 5) Ansible Does Heavy Lifint

Next you need to run the script. If you followed the instructions all should go well. So from your orchestration
directory run the setup file by doing:

/>  ansible-playbook setup.yml


## Fully Setup Software And Deploy Django

All you need to do now to complete


/> ansible-playbook playbook.yml


## Frequently Asked Questions

1) The setup file has already been run - do I need to run it again for my machine?

No you don't. Setup will add the users chh_admin and chh_cms with appropriate passwords. It will then remove 
the ability for root to ssh onto the machine. But don't worry, you can still access the machine with the
non root user accounts and 'su root' once on the machine if you have to.
You will need to add your public keys to the machine for chh_admin and chh_cms so that you can run other 
playbook files. To do this:

* run the playbook addMyPubKey.yml with:  /> ansible-playbook addMyPublicKey.yml --ask-pass

You will be prompted for the chh_admin password. The script will then setup your public key for that machine
on the remote machine. To test it, you can ssh as user chh_admin. You should not need a password.

2) When I run the setup.yml script it fails to connect! I thought Ansible was idempotent? 

It is but this script does everything as 'root'. It then blocks the ability of 'root' to ssh to that machine 
for securit purposes. This script is a one time run script. You can add the ability of root to ssh on the 
machine via the /etc/ssh/sshd_config file. 

"PermitRootLogin yes"

Then restart SSH with:

/>   sudo  service ssh restart








