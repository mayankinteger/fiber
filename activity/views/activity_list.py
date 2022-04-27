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
from ..filters import ActivityFilter
#html email required stuff
from django.core.mail import EmailMultiAlternatives
from django.template.loader import render_to_string
from django.utils.html import strip_tags

@login_required(login_url="/login")
def activity_list(request):
    act_list = Activity.objects.order_by('-id')
    myFilter = ActivityFilter(request.GET, queryset=act_list)
    act_list = myFilter.qs   

    return render(request, 'activity_list.html', {'act_list':act_list,'myFilter':myFilter})
    

@login_required(login_url="/login")
def delete_activity(request):
    if request.method == "POST":
        get_id = request.POST.get("act_id")
        media_del = Activity_media.objects.filter(activity_id=get_id)
        if media_del:
            for delete_allmedia in media_del:
                print(delete_allmedia)
                delete_allmedia.delete()
        deleted = Activity.objects.filter(id=get_id).delete()
        payload = {'response': 'ok'}
        if deleted:
            return JsonResponse(payload)
