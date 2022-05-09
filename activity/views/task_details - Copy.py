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
    activity_id = request.GET.get("id")
    act_type = request.GET.get("step")
    if activity_id:
        activitydata = Activity.objects.get(pk=activity_id)
    if request.method == 'POST':
        form = TaskForm(request.POST or None)
        
        start_date = request.POST.get('start_date')
        complete_date = request.POST.get('complete_date')
        status = request.POST.get('status')
        subtask = request.POST.get('subtask')
        activity = request.POST.get('activity_id')
        activityrow = Activity.objects.get(id=activity)
        subtaskrow = Subtasks.objects.get(id=subtask)
        task = Activity_tasks(start_date=start_date, complete_date=complete_date,status=status,type=subtask)
        task.activity_id = activityrow
        task.subtask = subtaskrow
        task.save() 
            
    else:
        form = TaskForm(initial={'activity_id':activity_id, 'added_by_id':request.user.id})
    mediaform = TaskmediaForm(request.POST or None)
    remarkform = TaskcommentForm(request.POST or None)
    if act_type == '1':
        step = 'Fielding'
    elif act_type == '2':
        step = 'Planning(design)'
    elif act_type == '3':
        step = 'Drafting'
    elif act_type == '10':
        step = 'Invoicing'
    
    params = {"form": form, "mediaform":mediaform, "remarkform":remarkform,"activitydata":activitydata,"step":step, "act_type":act_type}
    return render(request, 'task_details.html', params)

