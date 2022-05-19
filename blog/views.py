# blog/views.py
from django.http import HttpResponse
from django.shortcuts import redirect, render   

from django.contrib.auth import get_user_model
from .models import Blogs, Comments


User = get_user_model()




def index(request):

    blogs = Blogs.objects.all()[:10]



    return render(request, 'blog/blog.html', {
        'blogs' : blogs,
    })


# AJEX
def view_comments(request, blog_id):

    comments = Comments.objects.filter(blog__pk = blog_id)[:10]

    return HttpResponse("All Volunteers are currently busy! Please wait a moment. And try again later")
