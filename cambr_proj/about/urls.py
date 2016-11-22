from django.conf import settings
from django.conf.urls import url
from django.conf.urls.static import static


from .views import (
	list_page,
    create_page,
    team_page,
    detail_page,
    update_page,
    delete_page
)
from about import views

urlpatterns = [
    url(r'^$', views.index_page, name='index'),
    url(r'^pages/', views.list_page, name='pages'),
    url(r'^teams/', views.team_page, name='our_team'),
    url(r'^board/', views.board_page, name='our_board'),
    url(r'^create/', views.create_page, name='create_page'),
    url(r'^about/detail/(?P<slug>[\w-]+)/$', views.detail_page, name='page_detail'),
    url(r'^about/update/(?P<slug>[\w-]+)/$', views.update_page, name='page_update'),
    url(r'^about/delete/(?P<slug>[\w-]+)/$', views.delete_page, name='page_delete'),
]

