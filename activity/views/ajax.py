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
def ajax(request):
    if request.method == "POST":
        page = request.POST.get("page")
        if page == 'attachment_fetch':
            task_id = request.POST.get("task_id")
            all_media = Task_media.objects.filter(task_id=task_id)
            media = {'page':'media', 'data':all_media}
            html_content = render_to_string("ajax.html", media)
            return HttpResponse(html_content)
        elif page == 'remark_fetch':
            task_id = request.POST.get("task_id")
            all_remark = Task_remark.objects.filter(task_id=task_id)
            remark = {'page':'remark', 'data':all_remark}
            html_content = render_to_string("ajax.html", remark)
            return HttpResponse(html_content)
        elif page == 'task_media_delete':
            id = request.POST.get("id")
            #file_name = request.POST.get("file")
            media_del = Task_media.objects.get(pk=id)
            media_del.delete()
            return JsonResponse({'status':'ok'})
        elif page == 'activity_delete':
            get_id = request.POST.get("act_id")
            media_del = Activity_media.objects.filter(activity_id=get_id)
            if media_del:
                for delete_allmedia in media_del:
                    print(delete_allmedia)
                    delete_allmedia.delete()
            task_media_del = Task_media.objects.filter(task_id__activity_id=get_id)
            if task_media_del:
                for delete_taskmedia in task_media_del:
                    print(delete_taskmedia)
                    delete_taskmedia.delete()
            deleted = Activity.objects.filter(id=get_id).delete()
            #payload = {'response': 'ok'}
            if deleted:
                return JsonResponse({'response': 'ok'})
        elif page == 'media_delete':
            id = request.POST.get("id")
            #file_name = request.POST.get("file")
            media_del = Activity_media.objects.get(pk=id)
            media_del.delete()
            return JsonResponse({'status':'ok'})
        elif page == 'subtask_update':
            task_id = request.POST.get("task_id")
            status = request.POST.get("status")
            start_date = request.POST.get("start_date")
            if start_date:
                start_date = datetime.datetime.strptime(start_date, '%m-%d-%Y').strftime('%Y-%m-%d')
            else:
                start_date = None
            complete_date = request.POST.get("complete_date")
            if complete_date:
                complete_date = datetime.datetime.strptime(complete_date, '%m-%d-%Y').strftime('%Y-%m-%d')
            else:
                complete_date = None

            Activity_tasks.objects.filter(id=task_id).update(status=status, start_date=start_date, complete_date=complete_date)
            messages.success(request, " Your task has been updated successfully")
            return HttpResponse('done')