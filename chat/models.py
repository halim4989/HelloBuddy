# chat/models.py
from django.db import models

from django.contrib.auth.models import User
from django.utils import timezone

from django.contrib.auth.models import AbstractUser


class User(AbstractUser):
    is_available = models.BooleanField(default=False)


class VolunteerMessages(models.Model):
    author = models.CharField(max_length = 100) # enforced at the database level
    content = models.TextField()
    timestamp = models.DateTimeField(default=timezone.now)

    # class Meta:
    #     ordering = ['timestamp']

    def __str__(self):
        # return self.author.username
        return self.content[:15]


class VolunteerChats(models.Model):
    owner = models.ForeignKey(User, related_name='volunteerchats', on_delete=models.CASCADE)
    messages = models.ManyToManyField(VolunteerMessages, blank=True)


    def __str__(self):
        return self.owner.username







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

