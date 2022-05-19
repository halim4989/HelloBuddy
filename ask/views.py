# ask/views.py
from django.http import HttpResponse
from django.shortcuts import redirect, render   

from django.contrib.auth import get_user_model
from .models import Questions, Answers


User = get_user_model()




def index(request):

    questions = Questions.objects.all()

    data = []
    for q in questions:
        ques_ans = {
            'question' : q.question_title,
             'answers' : q.answers.all(),
        } 
        data.append(ques_ans)

    # print(data)


    return render(request, 'ask/ask.html', {
        'data' : data,
        # 'questions' : questions,
        # 'answers': answers,
    })
  