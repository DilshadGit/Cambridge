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


class Home(models.Model):
    title = models.CharField(max_length=100)
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
        # return reverse('about:page_detail', kwargs={'id': self.id})
        return reverse('main:detail', kwargs={'slug': self.slug})


def create_index_slug(instance, new_slug=None):
    slug = slugify(instance.title)
    # change the title from 'what we do -> 'what-we-do'
    if new_slug is not None:
        slug = new_slug
    query_set = Home.objects.filter(slug=slug).order_by('-id')
    exists = query_set.exists()
    if exists:
        new_slug = '%s-%s' % (slug, query_set.first().id)
        return create_index_slug(instance, new_slug=new_slug)
    return slug


def pre_save_index_receiver(sender, instance, *args, **kwargs):
    if not instance.slug:
        instance.slug = create_index_slug(instance)

pre_save.connect(pre_save_index_receiver, sender=Home)
