from email.message import EmailMessage
from django.http import JsonResponse
from django.shortcuts import render, HttpResponse, redirect
from django.contrib.auth  import authenticate,  login, logout
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from .models import *
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

def random_with_N_digits(n):
    range_start = 10**(n-1)
    range_end = (10**n)-1
    return randint(range_start, range_end)

def index(request):
    return redirect('handleLogin')

def reset_password(request):
    
    return render(request, "reset_password.html")

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

def handleLogout(request):
    logout(request)
    #messages.success(request, "Successfully logged out")
    return redirect('handleLogin')

rec=0
def autoIncrement(digit,st_f):
    global rec
    pStart = st_f+1 #adjust start value, if req'd 
    pInterval = 1 #adjust interval value, if req'd
    if (rec == 0): 
        rec = pStart 
    else: 
        rec = rec + pInterval 
    return str(rec).zfill(digit)


def send_eng_mail(mydata):
    mail_setting = Mail_settings.objects.get(priority=2)
    html_content = render_to_string("email/activity_mail.html", mydata)
    text_content = strip_tags(html_content)
    email = EmailMultiAlternatives(
        # subject
        'New ticket assigned',
        # msg
        text_content,
        # from email
        mail_setting,
        # recipient list
        [mydata['email']]
    )
    email.attach_alternative(html_content,"text/html")
    email.send()


@login_required(login_url="/login")
def activity_list(request):
    act_list = Activity.objects.order_by('-id')
    # data = {
    #     'name':'Mayank',
    #     'email':'mayank.sandlus@gmail.com',
    #     'subject':'Testing mail',
    #     'message':'My mail testing message'
    # }
    # message = '''
    # New message: {}
    # From: {}
    # '''.format(data['message'], data['email'])
    # send_mail(data['subject'], 'My mail testing message', 'subodh.kumar@integertel.com', ['mayank.kumar@integertel.com'], fail_silently=False)
    # print(data)
    #params = {'title':'test email', 'email':'mayank.kumar@integertel.com'}
    #send_eng_mail(params)
    return render(request, 'activity_list.html', {'act_list':act_list})
    

@login_required(login_url="/login")
def create_activity(request):
    
    activities_list = Activities.objects.all()
    clients_list = Clients.objects.all()
    feusers_list = Fe_users.objects.all()
    bayusers_list = Bay_users.objects.all()
    params = {"activities_list": activities_list, "clients_list": clients_list, "feusers_list": feusers_list, "bayusers_list": bayusers_list,"added_by":request.user.pk}
    if request.method == "POST":
        activity_data = Activity.objects.first()
        if activity_data:
            act_id = Activity.objects.latest('id').id
        else:
            act_id = 0
        str1 = autoIncrement(4,act_id)
        today = date.today()
        todate = today.strftime("%d%m%Y")
        ticket_no = todate+"-"+str1
        formedit = request.POST.get("form_edit_id")
        rec_date = request.POST.get("rec_date")
        rec_date = datetime.datetime.strptime(rec_date, '%m/%d/%Y').strftime('%Y-%m-%d')
        ecd = request.POST.get("ecd")
        if ecd !='':
            ecd = datetime.datetime.strptime(ecd, '%m/%d/%Y').strftime('%Y-%m-%d')
        client_id = request.POST.get("client")
        client = Clients.objects.get(id=client_id)
        market = request.POST.get("market")
        ewo = request.POST.get("ewo")
        da = request.POST.get("da")
        lus = request.POST.get("lus")
        wire_center = request.POST.get("wire_center")
        pfp = request.POST.get("pfp")
        latitude = request.POST.get("latitude")
        longitude = request.POST.get("longitude")
        job_type = request.POST.get("job_type")
        job_no = request.POST.get("job_no")
        f1cfas = request.POST.get("f1cfas")
        f1job_no = request.POST.get("f1job_no")
        f1_sow = request.POST.get("f1_sow")
        f2cfas = request.POST.get("f2cfas")
        f2job_no = request.POST.get("f2job_no")
        f2_sow = request.POST.get("f2_sow")
        notes = request.POST.get("notes")
        activitylist = request.POST.getlist("activity")
        #print(activitylist)
        assign_fielder = request.POST.get("assign_fielder")
        try:
            assign_fielder = Fe_users.objects.get(id=assign_fielder)
        except Fe_users.DoesNotExist:
            assign_fielder = None        
        assign_int_eng = request.POST.get("assign_int_eng")
        try:
            assign_int_eng = Bay_users.objects.get(id=assign_int_eng)
        except Bay_users.DoesNotExist:
            assign_int_eng = None 
        
        int_eng2 = request.POST.get("int_eng2")
        try:
            int_eng2 = Bay_users.objects.get(id=int_eng2)
        except Bay_users.DoesNotExist:
            int_eng2 = None
       
        lead_eng = request.POST.get("lead_eng")
        try:
            lead_eng = Bay_users.objects.get(id=lead_eng)
            #print(lead_eng)
        except Bay_users.DoesNotExist:
            lead_eng = None
        
        work_print = request.POST.get("work_print")
        footage = request.POST.get("footage")
        appr_footage = request.POST.get("appr_footage")
        terminal = request.POST.get("terminal")
        added_by = request.POST.get("added_by")
        added_by = Bay_users.objects.get(id=added_by)
        added_date = request.POST.get("added_date")
        #file_name = request.FILES.get("build_package1")
        if rec_date != '':

            activity_data = Activity(ticket=ticket_no,rec_date=rec_date, ecd=ecd, client_id=client, market=market, ewo=ewo, da=da, lus=lus, wire_center=wire_center, pfp=pfp, latitude=latitude, longitude=longitude, job_type=job_type, job_no=job_no, f1cfas=f1cfas, f1job_no=f1job_no, f1_sow=f1_sow, f2cfas=f2cfas, f2job_no=f2job_no, f2_sow=f2_sow, notes=notes, assign_fielder=assign_fielder, assign_int_eng=assign_int_eng, int_eng2=int_eng2, lead_eng=lead_eng, work_print=work_print, footage=footage, appr_footage=appr_footage, terminal=terminal, added_by=added_by, added_date=added_date)
            if formedit != '':
                #Activity.objects.filter(id=formedit).update(rec_date=rec_date, ecd=ecd, client_id=client_id, market=market, ewo=ewo, da=da, lus=lus, wire_center=wire_center, pfp=pfp, latitude=latitude, longitude=longitude, job_type=job_type, job_no=job_no, f1cfas=f1cfas, f1job_no=f1job_no, f1_sow=f1_sow, f2cfas=f2cfas, f2job_no=f2job_no, f2_sow=f2_sow, notes=notes, activity=activity, assign_fielder=assign_fielder, assign_int_eng=assign_int_eng, int_eng2=int_eng2, lead_eng=lead_eng, work_print=work_print, footage=footage, appr_footage=appr_footage, terminal=terminal, added_by=added_by, added_date=added_date)
                #messages.success(request, " Your activity has been updated successfully")
                return redirect('create_activity')
            else:
                activity_data.save()
                
                client_data = Clients.objects.get(pk=client_id)
                if assign_fielder is not None:
                    params = {'ticket_number':ticket_no, 'da_value':da, 'job_type':job_type, 'job_no':job_no, 'lus':lus, 'email':assign_fielder.email, 'client':client_data.name}
                    send_eng_mail(params)

                if assign_int_eng is not None:
                    params = {'ticket_number':ticket_no, 'da_value':da, 'job_type':job_type, 'job_no':job_no, 'lus':lus, 'email':assign_int_eng.email, 'client':client_data.name}
                    send_eng_mail(params)
                
                if int_eng2 is not None:
                    params = {'ticket_number':ticket_no, 'da_value':da, 'job_type':job_type, 'job_no':job_no, 'lus':lus, 'email':int_eng2.email, 'client':client_data.name}
                    send_eng_mail(params)

                #Activity.objects.filter(id=act_id).update(ticket=ticket_no)
                for x in activitylist:
                    activity_data.activity.add(Activities.objects.get(id=x))
                #Activity_media(activity_id=act_id,file_name=file_name,added_by=added_by).save()
                
                messages.success(request, " Your activity has been added successfully")
                return redirect('activity_list')
        else:
            messages.error(request, " Please fill all the required fields")
            return redirect('create_activity')
    return render(request, 'create_activity.html', params)
    
@login_required(login_url="/login")
def view_activity(request):
    if request.method == "GET":
        get_id = request.GET.get("id", "off")
        if get_id != 'off':
            viewdata = Activity.objects.filter(id=get_id)[0]
            params = {'viewdata': viewdata}
            return render(request, 'view_activity.html', params)
        else:
            return redirect('activity_list')

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
        

@login_required(login_url="/login")
def billview(request):
    act_list = Activity.objects.order_by('-id')
    params = {'act_list':act_list}
    return render(request, 'billview.html', params)

