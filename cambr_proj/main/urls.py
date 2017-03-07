from django.conf import settings
from django.conf.urls import url
from django.conf.urls.static import static


from main import views
from .views import (
    index_page_view,
    create_index_view,
    detail_index_view,
    update_index_view,
)


urlpatterns = [
    url(r'^$', views.index_page_view, name='index'),
    url(r'^home/create/$', views.create_index_view, name='create'),
    url(r'^home/detail/(?P<slug>[\w-]+)/$',
        views.detail_index_view, name='detail'),
    url(r'home/(?P<slug>[\w-]+)/edit/$',
        views.update_index_view, name='update'),
]
