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

def send_mail(mydata, page, subject):
    mail_setting = Mail_settings.objects.get(priority=2)
    html_content = render_to_string("email/"+page, mydata)
    text_content = strip_tags(html_content)
    if page == 'reset_password.html':
        receiver = [mydata['email']]
    else:
        receiver = [mydata['email'], 'amit@integertel.com']
    email = EmailMultiAlternatives(
        # subject
        subject,
        # msg
        text_content,
        # from email
        mail_setting,
        # recipient list
        receiver
    )
    email.attach_alternative(html_content,"text/html")
    email.send()

def random_with_N_digits(n):
    range_start = 10**(n-1)
    range_end = (10**n)-1
    return randint(range_start, range_end)

def reset_password(request):
    if request.method=="POST":
        email = request.POST.get("email")
        user_data = Bay_users.objects.get(email=email)
        form_edit_id = request.POST.get("form_edit_id")
        print(form_edit_id)
        # Get the get parameters
        if request.POST.get("form_edit_id") and request.POST.get("form_edit_otp") and user_data:
            password = request.POST.get("password")
            confirm_password = request.POST.get("confirm_password")
            if password!=confirm_password:
                messages.error(request, "Password not matching !")
                return redirect('/reset_password?email='+email+'&&id='+str(user_data.id)+'&&otp=yes')
            user_data.set_password(password)
            user_data.save()
            user=authenticate(email= email, password= password)
            if user is not None:
                login(request, user)
                messages.success(request, "Successfully reset your password and Logged In")
                return redirect("activity_list")
            else:
                messages.error(request, "Invalid credentials Supplied!")
                return redirect('/reset_password?email='+email+'&&id='+str(user_data.id)+'&&otp=yes')

        elif request.POST.get("form_edit_id") and user_data:
            otp_check = request.POST.get("otp")
            if otp_check!=user_data.otp or user_data.email=='':
                messages.error(request, "Invalid OTP Supplied!")
                return redirect('/reset_password?email='+email+'&&id='+str(user_data.id))
            else:
                messages.success(request, "Enter your new Password.")
                return redirect('/reset_password?email='+email+'&&id='+str(user_data.id)+'&&otp=yes')
        
        else:
            otp = random_with_N_digits(6)
            if user_data:
                Bay_users.objects.filter(id=user_data.id).update(otp=otp)
                '''send_mail_reset'''
                params = {'otp':otp, 'email':email}
                send_mail(params, 'reset_password.html', 'Reset Password')
                messages.success(request, "Your OTP has been sent to your email id.")	
                return redirect('/reset_password?email='+email+'&&id='+str(user_data.id))
            messages.error(request, "Invalid credentials Supplied!")
            return redirect('/reset_password')

    return render(request, "reset_password.html")
