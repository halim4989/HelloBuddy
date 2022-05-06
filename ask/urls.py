# ask/urls.py
from django.urls import path

from . import views

app_name = 'ask'

urlpatterns = [
    path('', views.index, name='index'),
    path('<str:ChatUsername>/', views.room, name='chat'),

]

