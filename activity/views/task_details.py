from email.message import EmailMessage
from django.dispatch import receiver
from django.http import JsonResponse
from django.shortcuts import render, HttpResponse, redirect
from django.contrib.auth  import authenticate,  login, logout
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from activity.models import *
import datetime
from datetime import date
from django.views.decorators.csrf import csrf_exempt
from django.core.mail import send_mail
from django.conf import settings
from random import randint
from ..forms import TaskForm, TaskmediaForm, TaskcommentForm

#html email required stuff
from django.core.mail import EmailMultiAlternatives
from django.template.loader import render_to_string
from django.utils.html import strip_tags

@login_required(login_url="/login")
def task_details(request):
    form = TaskForm(request.POST or None)
    mediaform = TaskmediaForm(request.POST or None)
    remarkform = TaskcommentForm(request.POST or None)
    params = {"form": form, "mediaform":mediaform, "remarkform":remarkform}
    return render(request, 'task_details.html', params)

