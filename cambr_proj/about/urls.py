from django.conf import settings
from django.conf.urls import patterns, include, url
from django.conf.urls.static import static


from .views import (
    what_we_do,
    volunter_page,
    team_page,
    board_page
)
from about import views

urlpatterns = [
    url(r'^$', views.index_page, name='index'),
    # url(r'^about/', views.index_page, name='about'),
    url(r'^whatwedo/', views.what_we_do, name='whatwedo'),
    url(r'^volunter/$', views.volunter_page, name='volunter'),
    url(r'^our_team/$', views.team_page, name='our_team'),
    url(r'^our_board/$', views.board_page, name='our_board'),
]
