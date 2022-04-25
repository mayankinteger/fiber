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

#html email required stuff
from django.core.mail import EmailMultiAlternatives
from django.template.loader import render_to_string
from django.utils.html import strip_tags

def index(request):
    return redirect('handleLogin')


def handleLogin(request):
    if request.method=="POST":
        # Get the post parameters
        email=request.POST['email']
        password=request.POST['password']
        user=authenticate(email= email, password= password)
        if user is not None:
            login(request, user)
            messages.success(request, "Successfully Logged In")
            if request.POST.get("redir_page") != '':
                return redirect(request.POST.get("redir_page"))
            else:
                return redirect("activity_list")
        else:
            messages.error(request, "Invalid credentials! Please try again")
            return redirect("handleLogin")
    elif request.user.is_authenticated:
        return redirect("activity_list")
    else:
        #return render(request, 'login.html')
        params = {'redirect_page': request.GET.get("next", "off")}
        return render(request, "login.html")
