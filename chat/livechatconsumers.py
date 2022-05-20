# chat/livechatconsumers.py
import json
from django.utils import timezone
from channels.generic.websocket import AsyncWebsocketConsumer


from channels.db import database_sync_to_async
# from django.contrib.auth.models import User
from django.contrib.auth import get_user_model
from .models import Message, Chat

User = get_user_model()

class LiveChatConsumer(AsyncWebsocketConsumer):
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
    def load_msgs_from_db(self):
       
        chat = Chat.objects.filter(participants__id = self.scope['user'].id)     
        if chat:
            self.chatID = chat[0].id
            msgs = chat[0].messages.all().order_by('timestamp')

            # # checks if user already talking with someone
            # participants = chat[0].participants.all().count()
            # if participants == 1:
            #     isTalking = "no"
            # else:
            #     isTalking = "yes"

            # making List with Generator
            msgsList = [{
            'sender': msg.author.username,
            'message': msg.content,
            'date' : str(msg.timestamp),
            } for msg in msgs]
            # print(msgsList)

            # sending a list of JSON
            return msgsList

        else:
            return []





    # after sending massage from UI -->> WebSocket
    # Receive message from WebSocket
    async def receive(self, text_data):
        text_data_json = json.loads(text_data)  # string to JSON
        # print("***receive data***")
        # print(text_data_json)
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

