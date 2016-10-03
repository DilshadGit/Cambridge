from __future__ import unicode_literals

from django.db import models
from django.db.models.signals import pre_save
from django.core.urlresolvers import reverse
from django.utils.text import slugify

# Create your models here.


def upload_image_location(instance, filename):
	return '%s/%s' % (instance.id, filename)


class Post(models.Model):
	title = models.CharField(max_length=120)
	slug = models.SlugField(unique=True)
	image = models.ImageField(upload_to=upload_image_location, null=True,
			blank=True, height_field="height_field", width_field="width_field")
	height_field = models.IntegerField(default=0)
	width_field = models.IntegerField(default=0)
	content = models.TextField()
	create_date = models.DateTimeField(auto_now=True, auto_now_add=False)
	updated = models.DateTimeField(auto_now=False, auto_now_add=True)

	def __unicode__(self):
		return self.title

    # def get_absolute_url(self):
    # 	return '/posts/detail/%s/' %(self.id)

	def get_absolute_url(self):
		return reverse('post:details', kwargs={'slug': self.slug})
        # return reverse('posts:details', kwargs={'id': self.id})

	class Meta:
		ordering = ['-create_date', '-updated']


def create_slug(instance, new_slug=None):
    slug = slugify(instance.title)
    if new_slug is not None:
        slug = new_slug
    query_set = Post.objects.filter(slug=slug).order_by('-id')
    exists = query_set.exists()
    if exists:
        new_slug = '%s-%s' % (slug, query_set.first().id)
        return create_slug(instance, new_slug=new_slug)
    return slug


def pre_save_post_receiver(sender, instance, *args, **kwargs):
    if not instance.slug:
        instance.slug = create_slug(instance)

    # slug = slugify(instance.title)
    # exists = Post.objects.filter(slug=slug).exists
    # if exists:
    # 	slug = '%s-%s'%(slug, instance.id)
    # instance.slug = slug


pre_save.connect(pre_save_post_receiver, sender=Post)
