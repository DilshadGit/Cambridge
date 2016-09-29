from django.conf import settings
from django.conf.urls import patterns, include, url
from django.conf.urls.static import static

from about import views

urlpatterns = [
    url(r'^$', views.index_page, name='index'),
]