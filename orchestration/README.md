Read Me for running of Vagrant to create VM's for AlfaAesar
================


Author Nicholas Herriot
Created 25th Jan 2017

You should have ansible and vagrant and VirtualBox installed. If not you can install
with:

/> sudo  pip  install  ansible
/> sudo apt-get install vagrant

Read this for VirtualBox: https://www.virtualbox.org/wiki/Downloads

VirtualBox exists outside your virtual environment. In other words you want to be
able to run this within your local machine to spawn your own machines.

Note:   All VM's are not secure at the time of writing this. They use the default 'vagrant'
		user. They should only be used for testing on your own local machine.

**For detailed instructions in setting up ansible please read the README.md file in the /ansible
directory.**

## Directory Structure

This gives a brief description of what each directory has and used for.
The root folder has ansible 'playbooks' which are used to carry out actions on the server.



### Globals Directory

The globals directory contains config parameters and machine names used by the ansible scripts.
It also contains files that should be copied to your host (development) machine to allow it to
correctly identify machines it needs to communicate with while deploying builds to machines.
Within the Globals Directory there is a sub directory called 'ansible' - this is described below.

#### Ansible Directory

This directory contains an ansible.cfg file, a hosts file and a README.md file.
1) The ansible.cfg file contains name value pairs to configure your ansible service that are global to
the whole service. Currently it allows your ansible to allow any user to read temp files, this is a
security risk, but minimal since we are deleting our temp files after use.
2) Makes host key checking false for now. This stops your system prompting you for adding the key from the
server to your local machine. This prompt will get in the way of ansible working.

The hosts file contains a list of host machines and groups that allow your ansible to know what machines
it can control. It maps a name to an ip address. It also maps names into groups so that you could configure
your ansible to set values accross a number of machines using the group name.

The README.md file within this directory gives you details about how to setup your machine. Please copy
the hosts file and the ansible.cfg to your /etc/ansible directory.

### vars Directory

The vars directory has configuration files that are used to deploy to a machine. e.g if you are
creating a server from scratch then you will need to know what config to give apache, what ports
you wish to open, what database parameters and so on.


### backups Directory

This contains a backup of a live database that is pulled from a machine. Ansible can also remove
a database from a machine to make orchestration 'safe'.








