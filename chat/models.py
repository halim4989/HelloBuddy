from django.db import models

from django.contrib.auth.models import User
from django.utils import timezone


# class isAvailable(models.Model):
#     user = models.OneToOneField(User, on_delete=models.CASCADE, related_name= 'isAvailable')
#     is_available = models.BooleanField(default=False)


#     def __str__(self):
#         # return self.author.username
#         return self.user.username


class Message(models.Model):
    author = models.ForeignKey(User, related_name='author_messages', on_delete=models.CASCADE)
    content = models.TextField()
    timestamp = models.DateTimeField(default=timezone.now)

    # class Meta:
    #     ordering = ['timestamp']

    def __str__(self):
        # return self.author.username
        return self.content[:15]


class Chat(models.Model):
    # participants = models.ManyToManyField(Message, related_name='chats', blank=True)
    participants = models.ManyToManyField(User, related_name='chats')
    messages = models.ManyToManyField(Message, blank=True)

    # class Meta:
    #     ordering = ['participants']

    def __str__(self):
        # return str(self.pk)
        # return str(self.participants)
        # return str(self.participants.all())
        # namesList = [n.username for n in self.participants.all()]
        idList = [n.id for n in self.participants.all()]
        # nameList = [n.username for n in self.participants.all()]
        # return str(idList) + " <<=====>>" + str(nameList)
        # return str(idList)
        return f"{idList} {self.id}"

