from django.contrib import admin

from .models import Message, Chat

from django.contrib.auth.admin import UserAdmin
from .models import User

admin.site.register(User, UserAdmin)



# decorator instade of admin.site.register
@admin.register(Message)
class AuthorAdmin(admin.ModelAdmin):
    # empty_value_display = '-empty-'
    list_display = ('content', 'author', 'timestamp')

    # fields  = ['content', 'timestamp']
    # exclude = ['content', 'timestamp', 'author']

    # pass
# admin.site.register(Message, AuthorAdmin)



# @admin.register(Chat)
# class AuthorAdmin(admin.ModelAdmin):
#     # empty_value_display = '-empty-'
#     list_display = ('id', 'Chat')
admin.site.register(Chat)
# admin.site.register(isAvailable)