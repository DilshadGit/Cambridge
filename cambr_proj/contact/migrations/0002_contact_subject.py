# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2016-10-21 16:16
from __future__ import unicode_literals

import datetime
from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('contact', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='contact',
            name='subject',
            field=models.CharField(default=datetime.datetime(2016, 10, 21, 16, 16, 10, 708700, tzinfo=utc), max_length=64),
            preserve_default=False,
        ),
    ]