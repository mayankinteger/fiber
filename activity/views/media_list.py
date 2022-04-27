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
def media_list(request):
    if request.method == "GET":
        get_id = request.GET.get("activity_id", "off")
        if get_id != 'off':
            activity_data = Activity.objects.filter(id=get_id)[0]
            f1_files = Activity_media.objects.filter(activity_id=get_id, file_type='f1').order_by('-id')
            f2_files = Activity_media.objects.filter(activity_id=get_id, file_type='f2').order_by('-id')
            #print(f1_files)
            params = {'activity_data': activity_data, 'f1_files': f1_files, 'f2_files': f2_files}
            return render(request, 'media_list.html', params)
        else:
            return redirect('activity_list')

@login_required(login_url="/login")
def media_save(request):
    if request.method == "POST":
        act_id = request.POST.get("activity_id", "off")
        activity_id = Activity.objects.get(id=act_id)
        type = request.POST.get("type", "off")
        caption = request.POST.get("caption", "off")
        da = request.POST.get("da", "off")
        file = request.FILES.getlist("file", "off")
        added_by = request.POST.get("added_by", "off")
        added_user = Bay_users.objects.get(id=added_by)
        for file_list in file:
            if activity_id != 'off' and type != 'off' and da != 'off':
                activity_media = Activity_media(activity_id=activity_id, file_name=file_list, file_type=type, media_name=caption, caption=caption, added_by=added_user)
                activity_media.save()
        if activity_media.pk:
            messages.success(request, " Your activity media has been added successfully")
            return redirect('/media_list?activity_id='+act_id)
        else:
            messages.error(request, " Something went wrong")
            return redirect('/media_list?activity_id='+act_id)

#@csrf_exempt
@login_required(login_url="/login")
def media_delete(request):
    if request.method == "POST":
        id = request.POST.get("id")
        #file_name = request.POST.get("file")
        media_del = Activity_media.objects.get(pk=id)
        media_del.delete()
        return JsonResponse({'status':'ok'})
    else:
        return JsonResponse({'status':0})