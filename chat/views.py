# chat/views.py
from django.http import HttpResponse
from django.shortcuts import redirect, render   
# from django.contrib.auth.models import User
from django.contrib.auth import get_user_model
from .models import Message, Chat

from django.core.cache import cache 


from django.contrib.auth.decorators import login_required
# from django.views.decorators.clickjacking import xframe_options_deny
# from django.views.decorators.clickjacking import xframe_options_sameorigin
# from django.views.decorators.clickjacking import xframe_options_exempt


User = get_user_model()

# @xframe_options_deny
# @xframe_options_exempt
@login_required
def index(request):

    # return render(request, 'chat/index.html', {})
    chat = request.user.chats.all()
    if chat.count()>=1:
        user = chat[0].participants.exclude(pk = request.user.pk)[0].username
        return redirect(user + '/', permanent=True)
    else:
        return redirect("user" + '/', permanent=True)





# @xframe_options_exempt
@login_required
def room(request, ChatUsername):
    # print("************************************")
    
    # print(type(request.user))
    # print(type(request.user.id))
    # print(type(request.user.first_name))

    # print(request.user)
    # print(request.user.id)
    # print(request.user.first_name)
    # print(request.GET)
    # print(request.POST)
    # print("************************************")


    # fetching all chats of current user and participants of each chats excluding current user.
    currentChat = Chat.objects.filter(participants__id = request.user.id).filter(participants__username = ChatUsername)

    if currentChat.count() >= 1:
        chatID = currentChat[0].id
    else:
        chatID = None

    allchats = []
    for chat in request.user.chats.all():
        user = chat.participants.exclude(pk = request.user.pk)[0]
        # fetching only the llast message
        lastMessage = chat.messages.order_by('-timestamp')[0] 
        data = {
            'name':   user.first_name + ' ' + user.last_name,
            'userName':   user.username, # for link
            # fetching only the llast message
            'lastMessage': lastMessage.content,
            'sentBy': lastMessage.author.username,
            'date': str(lastMessage.timestamp),
        }
        allchats.append(data)
    
    return render(request, 'chat/room.html', {
        'ChatUsername': ChatUsername,
        'ChatID': chatID,
        'allChats' : allchats,
    })







def UserStatusAvailable(request):
    if request.user.is_authenticated:
        # cache.set(f"{request.user.username}_is_Available", "yes", 7200) # marking user is Available for 2H
        # .objects.filter(username = 'halim').update(is_available = True)

        request.user.is_available = True
        request.user.save()
        return HttpResponse("Your online status is changed to 'Available' \n Now You will be Available to be Contracted by Users")
    else:
        return HttpResponse("Login First")

def UserStatusNotAvailable(request):
    if request.user.is_authenticated:
        # cache.set(f"{request.user.username}_is_Available", True, 7200) # marking user is Available for 2H
        # cache.delete(f"{request.user.username}_is_Available")

        request.user.is_available = False
        request.user.save()
        return HttpResponse("Your online status is changed to 'Not Available'")
    else:
        return HttpResponse("Login First")


def NewChatWithVolunteer(request):
    AvailavleVolunteers = User.objects.filter(is_superuser = 0).filter(is_staff = 1).filter(is_available = 1)

    OnlineVolunteers = [v for v in AvailavleVolunteers if cache.get(v.username) is not None]
    print(OnlineVolunteers)

    if OnlineVolunteers:
        return HttpResponse(OnlineVolunteers)
    else:
        return HttpResponse("All Volunteers are currently busy! Please wait a moment. And try again later")


def GetChatID(request):
    chat = Chat.objects.filter(participants__id = request.user.id)

    if chat:
        return HttpResponse(chat[0].id)
    else:
        return HttpResponse("NoReturn")


