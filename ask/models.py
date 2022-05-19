# ask/models.py
from django.db import models

# Create your models here.
# from django.contrib.auth.models import User
from django.contrib.auth import get_user_model
from django.utils import timezone


def get_deleted_user():
    return get_user_model().objects.get_or_create(username='deleted')[0]



User = get_user_model()


class Questions(models.Model):
    author = models.ForeignKey(User, related_name='questions', on_delete = models.SET(get_deleted_user)) # if user is deleted blog post will not be deleted, and show created by [deleted_user]
    question_title = models.CharField(max_length = 100) # enforced at the database level
    full_question = models.TextField() # max_length attribute for HTML Textarea widget of the auto-generated form field, don't have max lenght
    created = models.DateTimeField(default=timezone.now)

    class Meta:
        ordering = ['-created']

    def __str__(self):
        return self.question_title[:15]



class Answers(models.Model):
    questions = models.ForeignKey(Questions, related_name='answers', on_delete=models.CASCADE) # if Question is deleted Answear will also be deleted
    author = models.ForeignKey(User, related_name='question_answers', on_delete = models.SET(get_deleted_user)) # if user is deleted blog post will not be deleted, and show created by [deleted_user]
    answer = models.TextField() # max_length attribute for HTML Textarea widget of the auto-generated form field, don't have max lenght
    likes = models.PositiveIntegerField(default = 0)
    created_at = models.DateTimeField(auto_now_add=True) 
    modified_at = models.DateTimeField(auto_now=True) # updates every time it's modified

    class Meta:
        ordering = ['-created_at']

    def __str__(self):
        return self.answer[:15]

