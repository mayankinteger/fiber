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
    if activity_id and act_type:
        activitydata = Activity.objects.get(pk=activity_id)
        try:
            exist_check = Activity_tasks.objects.filter(activity_id=activity_id, type=act_type).latest('id')
        except:
            exist_check = ''
        try:
            exist_media = Task_media.objects.filter(task_id=exist_check.id)
        except:
            exist_media = ''
        try:
            exist_comment = Task_remark.objects.filter(task_id=exist_check.id)
        except:
            exist_comment = ''
    else:
        return redirect('activity_list')
        
    if act_type == '1':
        subtask_name = 1
    elif act_type == '2':
        subtask_name = 5
    else:
        subtask_name = 9
    if request.method == 'POST':
        form = TaskForm(request.POST)
        media_form = TaskmediaForm(request.POST, request.FILES)
        #media_form = TaskmediaForm(request.POST)
        remark_form = TaskcommentForm(request.POST)
        if form.is_valid():
            status_data = form.cleaned_data.get("status")
            if status_data == '0':
                messages.error(request, "Status Field is required")
                return redirect('/task_details?step='+act_type+'&id='+activity_id)
            if exist_check:
                if exist_check.subtask is None:
                    subtask_info = ''
                else:
                    subtask_info = exist_check.subtask
                added_by_id = form.cleaned_data.get("added_by_id")
                update_form = TaskForm(request.POST, instance=exist_check)
                update_form.save()
                Activity_tasks.objects.filter(id=exist_check.id).update(activity_id=activity_id, added_by=added_by_id, subtask=subtask_info)
                messages.success(request, "Your task has been updated successfully")
                return redirect('/task_details?step='+act_type+'&id='+activity_id)
            else:
                added_by_id = form.cleaned_data.get("added_by_id")
                form.save()
                task_id = Activity_tasks.objects.latest('id').id
                Activity_tasks.objects.filter(id=task_id).update(activity_id=activity_id, added_by=added_by_id, subtask=subtask_name)
                messages.success(request, "Your task has been added successfully")
                return redirect('/task_details?step='+act_type+'&id='+activity_id)
        elif media_form.is_valid():
            media_form.save()
            media_id = Task_media.objects.latest('id').id
            Task_media.objects.filter(id=media_id).update(task_id=exist_check.id, added_by=request.user.id)
            messages.success(request, "Your task media has been added successfully")
            return redirect('/task_details?step='+act_type+'&id='+activity_id)
        elif remark_form.is_valid():
            remark_form.save()
            remark_id = Task_remark.objects.latest('id').id
            Task_remark.objects.filter(id=remark_id).update(task_id=exist_check.id, added_by=request.user.id)
            messages.success(request, "Your task comment has been added successfully")
            return redirect('/task_details?step='+act_type+'&id='+activity_id)
        else:
            messages.error(request, "Please fill mandatory fields")
            return redirect('/task_details?step='+act_type+'&id='+activity_id)
    if exist_check:
        old_start_date = exist_check.start_date
        old_complete_date = exist_check.complete_date
        old_status = exist_check.status
    else:
        old_start_date = ''
        old_complete_date = ''
        old_status = ''
    form = TaskForm(initial={'activity_id_id':activity_id, 'type':act_type,'added_by_id':request.user.id, 'start_date':old_start_date, 'complete_date':old_complete_date, 'status':old_status})
    mediaform = TaskmediaForm()
    remarkform = TaskcommentForm()
    if act_type == '1':
        step = 'Fielding'
    elif act_type == '2':
        step = 'Planning(design)'
    elif act_type == '3':
        step = 'Drafting'
    elif act_type == '10':
        step = 'Invoicing'
    
    params = {"form":form, "mediaform":mediaform, "remarkform":remarkform, "activitydata":activitydata, "step":step, "act_type":act_type, 'exist_data':old_start_date, 'exist_comment':exist_comment, 'exist_media':exist_media}
    return render(request, 'task_details.html', params)