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
            #print(exist_check)
            #print('bye')
        except:
            exist_check = ''
    else:
        return redirect('activity_list')
        
    if act_type == '1':
        subtask_name = 1
    elif act_type == '2':
        subtask_name = 5
    else:
        subtask_name = 9
    subtaskdata = Subtasks.objects.get(pk=subtask_name)
    if request.method == 'POST':
        form = TaskForm(request.POST)
        if form.is_valid():
            #exist_check = Activity_tasks.objects.filter(activity_id=activity_id, type=act_type).order_by('-id')
            #print('hello')
            #print(exist_check[0].status)
            status_data = form.cleaned_data.get("status")
            if status_data == '0':
                messages.error(request, "Status Field is required")
                return redirect('/task_details?step='+act_type+'&id='+activity_id)
            if exist_check:
                if exist_check.status == 3:
                    added_by_id = form.cleaned_data.get("added_by_id")
                    form.save()
                    print('add after status check 3')
                    task_id = Activity_tasks.objects.latest('id').id
                    Activity_tasks.objects.filter(id=task_id).update(activity_id=activity_id, added_by=added_by_id)
                    messages.success(request, "Your task has been added successfully")
                    return redirect('/task_details?step='+act_type+'&id='+activity_id)
                else:
                    print(exist_check.subtask)
                    if exist_check.subtask is None:
                        subtask_info = ''
                    else:
                        subtask_info = exist_check.subtask
                    added_by_id = form.cleaned_data.get("added_by_id")
                    update_form = TaskForm(request.POST, instance=exist_check)
                    update_form.save()
                    print('update')
                    print(exist_check.subtask)
                    Activity_tasks.objects.filter(id=exist_check.id).update(activity_id=activity_id, added_by=added_by_id, subtask=subtask_info)
                    messages.success(request, "Your task has been updated successfully")
                    return redirect('/task_details?step='+act_type+'&id='+activity_id)
            else:
                added_by_id = form.cleaned_data.get("added_by_id")
                form.save()
                print('first add')
                task_id = Activity_tasks.objects.latest('id').id
                Activity_tasks.objects.filter(id=task_id).update(activity_id=activity_id, added_by=added_by_id, subtask=subtask_name)
                messages.success(request, "Your task has been added successfully")
                return redirect('/task_details?step='+act_type+'&id='+activity_id)
        else:
            print(form.errors)
            messages.error(request, form.errors)
    if exist_check:
        old_start_date = exist_check.start_date
        old_complete_date = exist_check.complete_date
        old_status = exist_check.status
    else:
        old_start_date = ''
        old_complete_date = ''
        old_status = ''
    form = TaskForm(initial={'activity_id_id':activity_id, 'type':act_type,'added_by_id':request.user.id, 'start_date':old_start_date, 'complete_date':old_complete_date, 'status':old_status})
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
    
    params = {"form": form, "mediaform":mediaform, "remarkform":remarkform, "activitydata":activitydata, "step":step, "act_type":act_type, 'exist_data':old_start_date}
    return render(request, 'task_details.html', params)

def task_comments(request):
    print("sdsd")
