from __future__ import unicode_literals


from django.conf import settings
from django.db import models
from django.db.models.signals import pre_save
from django.core.urlresolvers import reverse
from django.utils.text import slugify

# Create your models here.


def upload_image_location(instance, filename):
    return '%s/%s' % (instance.id, filename)
    print filename, ' LOCATION'


class WhatWeDo(models.Model):
    # This line below will tell the browser who create the page
    user = models.ForeignKey(settings.AUTH_USER_MODEL, blank=True, null=True)
    title = models.CharField(max_length=120)
    slug = models.SlugField(unique=True)
    content = models.TextField()
    image = models.ImageField(upload_to=upload_image_location, null=True,
                              blank=True, height_field="height_field", width_field="width_field")
    height_field = models.IntegerField(default=0)
    width_field = models.IntegerField(default=0)
    create_date = models.DateTimeField(auto_now=True, auto_now_add=False)
    updated = models.DateTimeField(auto_now=False, auto_now_add=True)

    def __unicode__(self):
        return self.title

    def get_absolute_url(self):
        # return 'about/%s/'%(self.id)
        # return reverse('about:whatwedo', kwargs={'id': self.id})
        return reverse('about:what_we_do', kwargs={'slug': self.slug})


    class Meta:
        ordering = ['-create_date', '-updated']


class Volunterring(models.Model):
    # This line below will tell the browser who create the page
    user = models.ForeignKey(settings.AUTH_USER_MODEL, blank=True, null=True)
    title = models.CharField(max_length=120)
    slug = models.SlugField(unique=True)
    content = models.TextField()
    image = models.ImageField(upload_to=upload_image_location, null=True,
                              blank=True, height_field="height_field", width_field="width_field")
    height_field = models.IntegerField(default=0)
    width_field = models.IntegerField(default=0)
    create_date = models.DateTimeField(auto_now=True, auto_now_add=False)
    updated = models.DateTimeField(auto_now=False, auto_now_add=True)

    def __unicode__(self):
        return self.title

    class Meta:
        ordering = ['-create_date', '-updated']


class OurTeam(models.Model):
    # This line below will tell the browser who create the page
    user = models.ForeignKey(settings.AUTH_USER_MODEL, blank=True, null=True)
    title = models.CharField(max_length=120)
    slug = models.SlugField(unique=True)
    content = models.TextField()
    image = models.ImageField(upload_to=upload_image_location, null=True,
                              blank=True, height_field="height_field", width_field="width_field")
    height_field = models.IntegerField(default=0)
    width_field = models.IntegerField(default=0)
    create_date = models.DateTimeField(auto_now=True, auto_now_add=False)
    updated = models.DateTimeField(auto_now=False, auto_now_add=True)

    def __unicode__(self):
        return self.title


class OurBoard(models.Model):
    # This line below will tell the browser who create the page
    user = models.ForeignKey(settings.AUTH_USER_MODEL, blank=True, null=True)
    title = models.CharField(max_length=120)
    slug = models.SlugField(unique=True)
    content = models.TextField()
    image = models.ImageField(upload_to=upload_image_location, null=True,
                              blank=True, height_field="height_field", width_field="width_field")
    height_field = models.IntegerField(default=0)
    width_field = models.IntegerField(default=0)
    create_date = models.DateTimeField(auto_now=True, auto_now_add=False)
    updated = models.DateTimeField(auto_now=False, auto_now_add=True)

    def __unicode__(self):
        return self.title



def create_slug(instance, new_slug=None):
    slug = slugify(instance.title)
    if new_slug is not None:
        slug = new_slug
    query_set = WhatWeDo.objects.filter(slug=slug).order_by('-id')
    exists = query_set.exists()
    if exists:
        new_slug = '%s-%s' % (slug, query_set.first().id)
        return create_slug(instance, new_slug=new_slug)
    return slug


def pre_save_post_receiver(sender, instance, *args, **kwargs):
    if not instance.slug:
        instance.slug = create_slug(instance)

# pre_save.connect(pre_save_post_receiver, sender=WhatWeDo)
