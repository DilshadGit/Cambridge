from django.conf.urls import include, patterns, url
from django.contrib import admin

from . import views
from .views import (
    list_post,
    create_post,
    post_details,
    update_post,
    delete_post,
)

urlpatterns = (
    url(r'^$', list_post, name='list_post'),
    url(r'^create/$', views.create_post, name='create_post'),
    url(r'^detail/(?P<slug>[\w-]+)/$', views.post_details, name='detail'),
    url(r'(?P<slug>[\w-]+)/edit/$', views.update_post, name='update_page'),
    url(r'^(?P<slug>[\w-]+)/delete/$',
        views.delete_post, name='delete_post'),

)
