from django.urls import path, include
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('login', views.handleLogin, name='handleLogin'),
    path('logout', views.handleLogout, name="handleLogout"),
    path('reset_password', views.reset_password, name="reset_password"),
    path('activity_list', views.activity_list, name='activity_list'),
    path('create_activity', views.create_activity, name='create_activity'),
    path('view_activity', views.view_activity, name='view_activity'),
    path('delete_activity', views.delete_activity, name='delete_activity'),
    path('media_list', views.media_list, name='media_list'),
    path('media_save', views.media_save, name='media_save'),
    path('media_delete', views.media_delete, name='media_delete'),
]