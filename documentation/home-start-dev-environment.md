# This text document explains the setup of the Cambridge Home Start Charity

* Author: Nicholas Herriot
* Date: 19/10/2016
* Version: 1


## Install virtualenv & virtualenvwrapper

Detailed instructions are here: http://virtualenvwrapper.readthedocs.org/en/latest/install.html

    `/> sudo pip install virtualenvwrapper`


## Setup a Virtual Environment

* In this case we are using the project name 'home_start'
* Hence from your home directory do:

```
/> mkvirtualenv home_start
/> workon home_start
(home_start)nherriot@kieran ~/virtualenv/home_start
```


## Clone your Repository

Using git clone the repo

	`/> git clone https://github.com/DilshadGit/Cambridge.git`



## Check Python Path and Install Required Django packages

* If you have several virtual environments you may have your python path setup in the postactivate
* script within your virtualenvironment. Check within ~/virtualenv/postactivate. If you see a line
like:  export DJANGO_SETTINGS_MODULE=home_start.settings
* then you need to move this into the specific postacitvate script for that project e.g.

```
	/> cd ~/virtualenv/home_start/bin
	/> nano postactivate
```

* Add the line:

```
export DJANGO_SETTINGS_MODULE=home_start.settings

/> cd ~/virtualenv/home_start/Cambridge/cambr_proj
/> pip install -r requirements.txt
```

## Check The Django Application Works

Within the python directory use the runserver to check it works

```
/> cd ~/virtualenv/ffwines/FreeFlowWines/wine_project
/> python manage.py runserver
System check identified no issues (0 silenced).
March 22, 2016 - 22:27:14
Django version 1.9.2, using settings 'wine_apps.settings'
Starting development server at http://127.0.0.1:8000/
Quit the server with CONTROL-C.
Not Found: /favicon.ico
[22/Mar/2016 22:27:21] "GET /favicon.ico HTTP/1.1" 404 6893
```

Check this work on your local browser by going to the URL:

	`localhost:8000`


## Change Database To Postgres

If you don't have 'postgres' installed on your machine you can do:

```
	/> sudo apt-get install postgresql-contrib
	/> sudo apt-get install postgresql-server-dev-9.3
	/> sudo apt-get install postgresql-client
	/> sudo apt-get install pgadmin3
```

Make sure you have the python library that lets you interface to 'Postgres'. For more information on
this you can read: https://docs.djangoproject.com/en/1.9/ref/settings/#databases
First install the package with:

	`/> sudo apt-get install python-psycopg2`

Update your postgres database to contain a user called _chh_user_, and a database called _chh_. This will require
you to switch to the _postgres_ user on your terminal window, get on to the posgres admin interface and add
the DB and user.

```
/> sudo -i -u postgres		# login as postgres super user
/> psql						# use the postgres cli interface
	psql (9.3.10)
	Type "help" for help.
/> postgres=#  CREATE DATABASE chh;		# Create a database on the psql command prompt
    CREATE DATABASE

/> postgres=# CREATE USER chh_user WITH PASSWORD 'chh_user';		# create the user and passwprd
    CREATE ROLE

/> postgres=# GRANT ALL PRIVILEGES ON DATABASE chh to chh_user;		# grant privillages to the user
GRANT
postgres=#

/> postgres=# \l				# View your databases to make sure it is on your system

                                    List of databases
     Name      |  Owner   | Encoding |   Collate   |    Ctype    |   Access privileges
---------------+----------+----------+-------------+-------------+-----------------------
 alfa          | postgres | UTF8     | en_GB.UTF-8 | en_GB.UTF-8 | =Tc/postgres         +
               |          |          |             |             | postgres=CTc/postgres+
               |          |          |             |             | alfa=CTc/postgres
 alfa_26102015 | postgres | UTF8     | en_GB.UTF-8 | en_GB.UTF-8 | =Tc/postgres         +
               |          |          |             |             | postgres=CTc/postgres+
               |          |          |             |             | alfa=CTc/postgres
 alfa_30092015 | alfa     | UTF8     | en_GB.UTF-8 | en_GB.UTF-8 |
 ffw           | postgres | UTF8     | en_GB.UTF-8 | en_GB.UTF-8 | =Tc/postgres         +
               |          |          |             |             | postgres=CTc/postgres+
               |          |          |             |             | ffw_user=CTc/postgres
 postgres      | postgres | UTF8     | en_GB.UTF-8 | en_GB.UTF-8 |
 template0     | postgres | UTF8     | en_GB.UTF-8 | en_GB.UTF-8 | =c/postgres          +
               |          |          |             |             | postgres=CTc/postgres
 template1     | postgres | UTF8     | en_GB.UTF-8 | en_GB.UTF-8 | =c/postgres          +
               |          |          |             |             | postgres=CTc/postgres
(7 rows)

```

Note for development you may want to rebuild database and run test cases. This will require your user the
ability to create, destroy databases. As well as become owner of the database they work on. There are 2
commands for this.
1) To allow a user to create and destory databases - which will be needed if that user wants to create test
databases during testing you can use:

`postgres=# ALTER USER chh_user CREATEDB;`

2) To have your user 'own' a database allowing them to reset and drop all tables which you may want to do
for resetting migrations you can use:

```
postgres=# ALTER USER chh_user CREATEDB;ALTER DATABASE chh OWNER TO chh_user;
`/> postgres=# \q					# Quit the psql interface and exit as this user
$ exit
```

Update your settings file to talk to your postgres DB. This should be unique to your local database.
In this instance, you need to make it unique to the database on your local machine for your DEV environment
and not your production environment. See the current settings.py file for details on how this is done.


DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'chh',
        'USER': 'chh_user',
        'PASSWORD': 'chh_user',
        'HOST': '127.0.0.1',
        'PORT': '5432',
    }
}

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'xxxxxxxxxx',					    # This is our database name
        'USER': 'xxxxxxxxxx',						# This is the user of our database
        'PASSWORD': 'xxxxxxxxxx',					# This is the password of the database user
        'HOST': 'localhost',
        'PORT': '',
    }
}


`(home_start)/> pip install psycopg2`

Make sure you update the requiremetns.txt file if it's not changed already.
You can check out the access to the database like this:

```
(ffwines)/> python manage.py shell
***** WARNING! This is a non-production build *****
Python 2.7.6 (default, Jun 22 2015, 17:58:13)
[GCC 4.8.2] on linux2
Type "help", "copyright", "credits" or "license" for more information.
(InteractiveConsole)
>>>from django.db import connection
>>> from django.db import connection
>>> cursor = connection.cursor()
>>> quit()
```

If nothing happens then your server is working properly with the database.
Next we need to migrate the new database and check the migration worked.

```
(ffwines)/> python manage.py migrate			# Migrate the database.
(ffwines)/> python manage.py showmigrations		# Check it worked.

accounts
 [X] 0001_initial
admin
 [X] 0001_initial
 [X] 0002_logentry_remove_auto_add
auth
 [X] 0001_initial
 [X] 0002_alter_permission_name_max_length
 [X] 0003_alter_user_email_max_length
 [X] 0004_alter_user_username_opts
 [X] 0005_alter_user_last_login_null
 [X] 0006_require_contenttypes_0002
 [X] 0007_alter_validators_add_error_messages
cms
 [X] 0001_initial
 [X] 0002_news_user
 [X] 0003_news_draft
 [X] 0004_auto_20160306_1254
contenttypes
 [X] 0001_initial
 [X] 0002_remove_content_type_name
profiles
 [X] 0001_initial
registration
 [X] 0001_initial
 [X] 0002_registrationprofile_activated
 [X] 0003_migrate_activatedstatus
sessions
 [X] 0001_initial
sites
 [X] 0001_initial
 [X] 0002_alter_domain_unique
```

## Check Your Server Works

Update your virtual env python file to contain the postgres adapter

(home_start)/> python manage.py createsuperuser
(home_start)/> python manage.py runserver


