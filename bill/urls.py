from django.urls import path, include
from . import views

urlpatterns = [
    path('create_bill', views.create_bill, name='create_bill'),
]