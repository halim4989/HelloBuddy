# chat/urls.py
from django.urls import path

from . import views

app_name = 'chat'

urlpatterns = [
    path('', views.index, name='index'),
    # path('', views.room, name='index'),
    path('<str:ChatUsername>/', views.room, name='chat'),
    # path('<str:room_name>/old/', views.room2, name='room2'),

]

