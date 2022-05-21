# chat/consumers.py
import json
from django.utils import timezone
from channels.generic.websocket import AsyncWebsocketConsumer


from channels.db import database_sync_to_async
# from django.contrib.auth.models import User
from django.contrib.auth import get_user_model
from .models import Message, Chat

User = get_user_model()

class ChatConsumer(AsyncWebsocketConsumer):
    async def connect(self):
        self.chatID = self.scope['url_route']['kwargs']['room_name']
        self.chat_group_name = 'chat_%s' % self.chatID

        # print("************************************")
        # print("************************************")
        # print(self.chatID)
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
        # print(msgs)
        for msg in reversed(msgs):
            # Sending all messages into WebSocket
            await self.send(text_data=json.dumps(msg))


    # using decorator to access db in ASGI
    @database_sync_to_async
    def load_msgs_from_db(self):
        # print(self.scope['user'])
        # print(self.scope['user'].id)

        # msgs = Message.objects.all().order_by('-timestamp') # Last 10 messages
        # self.chats = Chat.objects.filter(participants__username = self.scope['user']).filter(participants__username = self.chatID)
        msgs = Chat.objects.get(id = self.chatID).messages.all().order_by('-timestamp')


        # making List with Generator
        msgsList = [{
        'sender': msg.author.username,
        'message': msg.content,
        'date' : str(msg.timestamp),
        } for msg in msgs]
        # print(msgsList)

        # sending a list of JSON
        return msgsList 

    @database_sync_to_async
    def save_msg_to_db(self, sender, txt):
        user = User.objects.filter(username=sender)     # username count should be 1
        if user.count() == 1:
            # print("RUNNING RUNNING RUNNING ")
            msg = Message.objects.create(author = user[0], content = txt)

            current_chat = Chat.objects.get(id = self.chatID)
            # adding msg
            current_chat.messages.add(msg)
        else:
            print('**Sent by AnonymousUser**')




    
    async def disconnect(self, close_code):
        # Leave room group
        await self.channel_layer.group_discard(
            self.chat_group_name,
            self.channel_name
        )
        # print(close_code)
        # print(self.chatID)


    # after sending massage -->> WebSocket
    # Receive message from WebSocket
    async def receive(self, text_data):
        text_data_json = json.loads(text_data)  # string to JSON
        print("***receive data***")
        print(text_data_json)
        sender = text_data_json['sender']
        message = text_data_json['message']

        # saving massage into db
        # await self.save_msg_to_db(sender, message)

        # Send message to Channel
        await self.channel_layer.group_send(
            self.chat_group_name,
            {
                'type': 'chat_message',
                'message': message,
                'sender': sender,
                'date' : str(timezone.now())
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

