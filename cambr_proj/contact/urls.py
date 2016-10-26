from django.conf import settings
from django.conf.urls import patterns, include, url
from django.conf.urls.static import static
# from django.contrib import admin

from contact import views as contact_views

urlpatterns = [
    url(r'^thanks/(?P<name>[\w-]+)$', contact_views.contact_thanks, name='contact_thanks_email'),
    url(r'^$', contact_views.contact, name='contact_us'),
]
