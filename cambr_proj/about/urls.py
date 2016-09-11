from django.conf import settings
from django.conf.urls import patterns, include, url
from django.conf.urls.static import static
# from django.contrib import admin

from about import views as about_views

urlpatterns = [
    url(r'^$', about_views.index_page, name='index'),
]