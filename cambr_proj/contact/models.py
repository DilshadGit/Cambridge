from __future__ import unicode_literals

from django.db import models

# Create your models here.


class Contact(models.Model):
    full_name = models.CharField(max_length=64)
    subject = models.CharField(max_length=64)
    email = models.EmailField()
    message = models.TextField()
    time_send = models.DateTimeField(auto_now_add=True, auto_now=False)

    def __unicode__(self):
        return (self.full_name)
