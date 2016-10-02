from __future__ import unicode_literals

from django.db import models

# Create your models here.


class AboutUs(models.Model):
    title = models.CharField(max_length=120)
    content = models.TextField()
    # image = models.

    def __unicode__(self):
        return self.title
