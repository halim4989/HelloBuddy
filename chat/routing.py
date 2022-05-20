# chat/routing.py
from django.urls import re_path, path

from . import consumers, livechatconsumers
websocket_urlpatterns = [
    # re_path(r'ws/chat/(?P<room_name>\w+)/$', consumers.ChatConsumer.as_asgi()),
    path('ws/chat/<str:room_name>/', consumers.ChatConsumer.as_asgi()),
    path('ws/livechat/<str:room_name>/', livechatconsumers.LiveChatConsumer.as_asgi()),

]