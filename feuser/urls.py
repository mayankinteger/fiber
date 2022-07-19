from django.urls import path, include

from . import views
from .views import *
urlpatterns = [
    path('', views.feindex, name='feindex'),
    path('login',views.login_mobile,name='login_mobile'),
    path('logout', views.logout_mobile, name="logout_mobile"),
    path('my_activity',views.mobile,name="my_activity"),
    path('activity_media', views.mobile_media,name='activity_media'),
    path('activity_view', views.mobile_view,name='activity_view'),
    # path('pdf_view', views.pdf_report_create,name='pdf_report_create'),
]