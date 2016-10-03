from django.conf.urls import include, patterns, url
from django.contrib import admin

from .views import (
    list_post,
    create_post,
    post_details,
    update_post,
    delete_post,
    # backend_posts,
)

urlpatterns = (
    url(r'^$', list_post, name='list_post'),
    url(r'^create/$', 'post.views.create_post', name='create_post'),
    url(r'^(?P<slug>[\w-]+)/$', 'post.views.post_details', name='details'),
    url(r'(?P<slug>[\w-]+)/edit/$', 'post.views.update_post', name='update'),
    url(r'^(?P<slug>[\w-]+)/delete/$',
        'post.views.delete_post', name='delete_post'),

    # url(r'^dashboard/$', backend_post, name='backend_posts'),
    # url(r'^dashboard/create/$', 'posts.views.create_post', name='create_post'),
    # url(r'^dashboard/(?P<slug>[\w-]+)/$',
    #     'posts.views.post_details', name='details'),
    # url(r'^dashboard/(?P<slug>[\w-]+)/edit/$',
    #     'posts.views.update_post', name='update'),
    # url(r'^dashboard/(?P<slug>[\w-]+)/delete/$',
    #     'posts.views.delete_post', name='delete_post'),
)
