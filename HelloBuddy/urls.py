"""HelloBuddy URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf.urls import include
from django.views.generic import TemplateView
from django.shortcuts import redirect
from django.contrib import admin
from django.urls import path
import chat.views as chatV

app_name = 'base'

urlpatterns = [
    path('admin/', admin.site.urls),
    path('accounts/', include('django.contrib.auth.urls')),
    path('accounts/register/', include('main.urls')),

    path('NewChatWithVolunteer/', chatV.NewChatWithVolunteer, name='NewChatWithVolunteer'),
    path('UserStatus/NotAvailable/', chatV.UserStatusNotAvailable, name='NotAvailable'),
    path('UserStatus/Available/', chatV.UserStatusAvailable, name='Available'),
    path('getchatid/', chatV.GetChatID, name='chatId'),

    path("", lambda req: redirect('/home/')),
    path('home/', TemplateView.as_view(template_name="webpages/home.html")),
    path('about/', TemplateView.as_view(template_name="webpages/about.html")),
    path('experts/', TemplateView.as_view(template_name="webpages/experts.html")),
    path('chat/', include('chat.urls', namespace='chat')),
    path('blog/', include('blog.urls', namespace='blog')),
    path('ask/', include('ask.urls', namespace='ask')),
]
