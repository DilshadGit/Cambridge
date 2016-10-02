from django.conf import settings
from django.conf.urls import patterns, include, url
from django.conf.urls.static import static
# from django.contrib import admin

from about import views as about_views

urlpatterns = [
    url(r'^$', about_views.index_page, name='index'),
    url(r'^about/$', about_views.index_page, name='about'),
    url(r'^what_we_do/$', about_views.index_page, name='what_we_do'),
    url(r'^volunter/$', about_views.index_page, name='volunter'),
    url(r'^our_team/$', about_views.index_page, name='our_team'),
    url(r'^our_board/$', about_views.index_page, name='our_board'),
]
