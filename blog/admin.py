from django.contrib import admin

from .models import blogs, comments

admin.site.register(blogs)
admin.site.register(comments)