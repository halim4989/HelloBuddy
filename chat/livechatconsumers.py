# chat/livechatconsumers.py
import json
from pprint import pprint
from django.utils import timezone
from channels.generic.websocket import AsyncWebsocketConsumer


from channels.db import database_sync_to_async
# from django.contrib.auth.models import User
from django.contrib.auth import get_user_model
from .models import VolunteerMessages, VolunteerChats, Message, Chat

User = get_user_model()


class LiveChatConsumer(AsyncWebsocketConsumer):
    async def connect(self):
        await self.CreateChat()

        self.chatUser = self.scope['url_route']['kwargs']['room_name']
        self.chat_group_name = 'chat_%s' % self.chatUser

        # print("************************************")
        # print("************************************")
        # print(self.chatUser)
        # print(self.chat_group_name)
        # print("************************************")
        # print(self.scope)
        # print(self.scope['user'])
        # print(self.scope['user'].id)
        # print(self.scope['url_route'])
        # print(self.scope['url_route']['kwargs'])
        # print("************************************")
        # print("************************************")

        # Create Channel
        await self.channel_layer.group_add(
            self.chat_group_name,
            self.channel_name
        )
        # print(self.chat_group_name)
        # print(self.channel_name)

        await self.accept()

        # Loading previous messages
        msgs = await self.load_msgs_from_db()   # reciving list of JSON
        for msg in msgs:
            # Sending all messages into WebSocket
            await self.send(text_data=json.dumps(msg))

    async def disconnect(self, close_code):
        # disconnect room after Websocket Disconnect
        await self.channel_layer.group_discard(
            self.chat_group_name,
            self.channel_name
        )

    # using decorator to access db in ASGI
    @database_sync_to_async
    def CreateChat(self):
        chat = VolunteerChats.objects.filter(owner = self.scope['user']).count()
        
        if chat:
            pass
        else:
            m = VolunteerMessages.objects.get(id = 6)
            obj = VolunteerChats.objects.create(owner = self.scope['user'])
            obj.messages.add(m)
            obj.save()


    # using decorator to access db in ASGI
    @database_sync_to_async
    def load_msgs_from_db(self):
        msgs = VolunteerChats.objects.get(owner__id = self.scope['user'].id).messages.all().order_by('timestamp')

        # making List with Generator
        msgsList = [{
            'sender': msg.author,
            'message': msg.content,
            'date': str(msg.timestamp),
        } for msg in msgs]
        # print(msgsList)

        # sending a list of JSON
        return msgsList


    @database_sync_to_async
    def save_msg_to_db(self, sender, txt):

        
        user = User.objects.get(username=self.chatUser)
        # print("RUNNING RUNNING RUNNING ")
        msg = VolunteerMessages.objects.create(author = sender, content = txt)

        current_chat = VolunteerChats.objects.get(owner__id = user.id)
        # adding msg
        current_chat.messages.add(msg)




    # after sending massage from UI -->> WebSocket
    # Receive message from WebSocket
    async def receive(self, text_data):
        text_data_json = json.loads(text_data)  # string to JSON
        # print("***receive data***")
        # print(text_data_json)
        sender = text_data_json['sender']
        message = text_data_json['message']

        # saving massage into db
        await self.save_msg_to_db(sender, message)
        # print('\n\n*** *** ***')
        # print(f"{sender}, {message}")


        # Send message to Channel
        await self.channel_layer.group_send(
            self.chat_group_name,
            {
                'type': 'chat_message',
                'message': message,
                'sender': sender,
                'date': str(timezone.now())
            }
        )

    # Receive message from Channel

    async def chat_message(self, event):
        # print("***event***")
        # print(event)
        sender = event['sender']
        message = event['message']
        date = event['date']

        # Send message to WebSocket
        await self.send(text_data=json.dumps({
            'sender': sender,
            'message': message,
            'date': date,
        }))
