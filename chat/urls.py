# chat/urls.py
from django.urls import path

from . import views

app_name = 'chat'

urlpatterns = [
    path('', views.index, name='index'),
    path('<str:ChatUsername>/', views.room, name='chat'),
    path('old/<str:ChatUsername>/', views.roomOld, name='oldchat'),

]

