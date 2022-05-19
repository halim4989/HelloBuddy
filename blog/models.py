# blog/models.py
from django.db import models

# from django.contrib.auth.models import User
from django.contrib.auth import get_user_model
from django.utils import timezone


def get_deleted_user():
    return get_user_model().objects.get_or_create(username='deleted')[0]


User = get_user_model()

class Blogs(models.Model):
    author = models.ForeignKey(User, related_name='blogs', on_delete = models.SET(get_deleted_user)) # if user is deleted blog post will not be deleted, and show created by [deleted_user]
    title = models.CharField(max_length = 100) # enforced at the database level
    content = models.TextField() # max_length attribute for HTML Textarea widget of the auto-generated form field, don't have max lenght
    likes = models.PositiveIntegerField(default = 0)
    created_at = models.DateTimeField(auto_now_add=True) 
    modified_at = models.DateTimeField(auto_now=True) # updates every time it's modified

    class Meta:
        ordering = ['-created_at']

    def __str__(self):
        return self.title[:15]



class Comments(models.Model):
    blog = models.ForeignKey(Blogs, related_name='comments', on_delete=models.CASCADE) # if blog post is deleted. all the comments will also be deleted
    author = models.ForeignKey(User, related_name='blog_comments', on_delete = models.SET(get_deleted_user)) # if user is deleted comments will not be deleted
    content = models.TextField() # max_length attribute for HTML Textarea widget of the auto-generated form field, don't have max lenght
    likes = models.PositiveIntegerField(default = 0)
    created = models.DateTimeField(default=timezone.now)

    class Meta:
        ordering = ['-created']

    def __str__(self):
        return self.content[:15]