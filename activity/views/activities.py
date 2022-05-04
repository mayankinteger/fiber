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

@login_required(login_url="/login")
def activities(request):
    activity_id = request.GET.get("id")
    act_type = request.GET.get("step")
    task_subtask = Activity_tasks.objects.filter(activity_id=activity_id, type=act_type)
    subtask_data = Subtasks.objects.filter(status=0, task_id=act_type)
    activitydata = Activity.objects.get(pk=activity_id)
    print(task_subtask)
    if act_type == '1':
        step = 'Fielding'
    elif act_type == '2':
        step = 'Planning(design)'
    elif act_type == '3':
        step = 'Drafting'
    elif act_type == '10':
        step = 'Invoicing'
    param = {'activitydata':activitydata, 'step':step, 'act_type':act_type, 'task_subtask':task_subtask, 'subtask_data':subtask_data}
    return render(request, 'activities.html', param)

