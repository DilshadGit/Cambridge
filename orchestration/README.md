Read Me for running of Vagrant to create VM's for AlfaAesar
================


Author Nicholas Herriot
Created 14th Sep 2016

You should have ansible and vagrant and VirtualBox installed. If not you can install
with:

/> sudo  pip  install  ansible
/> sudo apt-get install vagrant

Read this for VirtualBox: https://www.virtualbox.org/wiki/Downloads

This exists outside your virtual environment. In other words you want to be
able to run this within your local machine to spawn your own machines.

Note:   All VM's are not secure at the time of writing this. They use the default 'vagrant'
		user. They should only be used for testing on your own local machine.


## Prerequisite Before Launching Vagrant

Go to the golbals/alfacms directory within this directory and follow the README.md file

## Start Vagrant Machine

To start vagrant which will run the vagrantfile within this direcotry do:

/>  vagrant  up

## Reload an Ansible Script

This will try and install all the software required to run your VM's and show you
results of each task as it goes:

/>  vagrant provision


## Stop Your VM

This will stop your machine - keeping all the saved state of that machine.

/> vagrant halt


## Quickly Access Your VM

You can quickly access your VM from the command prompt that you used to bring up
your machines. So in the console that you used  to type 'vagrant up' do:

/> vagrant ssh

This will ssh you onto that machine as the 'vagrant' user.



