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

**For detailed instructions in setting up ansible please read the README.md file in the ./globals/ansible
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



## Scripts To Run

This section describes what scripts should be run and what order. It also give you details of what each
script does. Each script has a text header telling you what it does and what the order should be. Please
read this for details. Each command that is run is also displayed on the screen. Please read this to
get details of what the script is doing as it runs. The script will display text in yellow if it
performs a task. Green if it does not need to run a task, and Red if it can't run a task.

### Script Order

The is describes the order that scripts have to be run in and what you need access to.

1) setup.yml
2) playbook-install.yml
3) playbook-hard-build.yml playbook-soft-build.yml playbook-database-pull.yml playbook-database-push.yml
4) removeCMSandAdminAccountsWithRootUser.yml testAddKeys.yml addMyPublicKey.yml


### Setup
This sets up users on the machine and adds your public key for the admin and cms users.
You need to place your public key in ./vars directory of this folder.
When running you need root password to the machine you connect to. The machine name is declared in the
hosts variable.


### playbook-install
This installs and sets up the web server, django, DB and configuration files. At this point you don't
need to add your password to run the script

### playbook-hard-build
This downloads from git production builds and restarts all services.

### playbook-soft-build
This downloads form git production builds. It does not restart services.

### playbook-database-pull
This pulls the postges DB from the server and places onto your local machine.

### playbook-database-push
This pushes a DB from your backup folder and loads onto the server.

### removeCMSandAdminAccountsWithRootUser
This removes CMS and Admin users with the root account. You need root access to the machine.

### testAddKeys addMyPublicKey
This can be run after 1 but it's used for testing and is used to re-add your public key. The testaddkey
is just used for testing purpose.







