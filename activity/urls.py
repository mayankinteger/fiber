from django.urls import path, include
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('login', views.handleLogin, name='handleLogin'),
    path('logout', views.handleLogout, name="handleLogout"),
    path('reset_password', views.reset_password, name="reset_password"),
    path('create_activity', views.create_activity, name='create_activity'),
    path('activity_list', views.activity_list, name='activity_list'),
    path('activity_calendar', views.activity_calendar, name='activity_calendar'),
    path('view_activity', views.view_activity, name='view_activity'),
    path('media_list', views.media_list, name='media_list'),
    path('media_save', views.media_save, name='media_save'),
    path('activities', views.activities, name='activities'),
    path('task_details', views.task_details, name='task_details'),
    path('activities_subtask', views.activities_subtask, name='activities_subtask'),
    path('subtask_remark', views.subtask_remark, name='subtask_remark'),
    path('subtask_media', views.subtask_media, name='subtask_media'),
    path('ajax', views.ajax, name='ajax'),
    path('dashboard', views.dashboard, name='dashboard'),
    path('dashboard1', views.dashboard1, name='dashboard1'),
    path('fe_users', views.fe_users,name='fe_users'),
    path('csv_activity_list', views.csv_activity_list,name='csv_activity_list'),
]