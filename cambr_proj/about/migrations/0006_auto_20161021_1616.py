# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2016-10-21 16:16
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('about', '0005_auto_20161012_2355'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='OurBoard',
            new_name='Page',
        ),
        migrations.RemoveField(
            model_name='ourteam',
            name='user',
        ),
        migrations.RemoveField(
            model_name='volunterring',
            name='user',
        ),
        migrations.RemoveField(
            model_name='whatwedo',
            name='user',
        ),
        migrations.AlterModelOptions(
            name='page',
            options={'ordering': ['-create_date', '-updated']},
        ),
        migrations.DeleteModel(
            name='OurTeam',
        ),
        migrations.DeleteModel(
            name='Volunterring',
        ),
        migrations.DeleteModel(
            name='WhatWeDo',
        ),
    ]