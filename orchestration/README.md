Read Me for running of Vagrant to create VM's for AlfaAesar
================


Author Nicholas Herriot
Created 25th Jan 2017

You should have ansible and vagrant and VirtualBox installed. If not you can install
with:

/> sudo  pip  install  ansible
/> sudo apt-get install vagrant

Read this for VirtualBox: https://www.virtualbox.org/wiki/Downloads

This exists outside your virtual environment. In other words you want to be
able to run this within your local machine to spawn your own machines.

Note:   All VM's are not secure at the time of writing this. They use the default 'vagrant'
		user. They should only be used for testing on your own local machine.


## Directory Structure

This gives a brief description of what each directory has and used for.
The root folder has ansible 'playbooks' which are used to carry out actions on the server.

### Globals

The globals directory contains config parameters and machine names used by the ansible scripts.
It also contains files that should be copied to your host (development) machine to allow it to
correctly identify machines it needs to communicate with while deploying builds to machines.


### vars

The vars directory has configuration files that are used to deploy to a machine. e.g if you are
creating a server from scratch then you will need to know what config to give apache, what ports
you wish to open, what database parameters and so on.


### backups

This contains a backup of a live database that is pulled from a machine. Ansible can also remove
a database from a machine to make orchestration 'safe'.








