from activity.views.import_data import *
from activity.views.page_permission import *


def send_taskmail(mydata, page, subject):
    mail_setting = Mail_settings.objects.get(priority=2)
    html_content = render_to_string("email/"+page, mydata)
    text_content = strip_tags(html_content)
    receiver = ['mayank.kumar@integertel.com']
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

@login_required(login_url="/login")
def task_details(request):
    current_url = resolve(request.path_info).url_name
    user_id = request.user.id
    page_check = permision_check(current_url,user_id)
    if page_check == False:
        return render(request,'404.html')
    activity_id = request.GET.get("id")
    act_type = request.GET.get("step")
    try:
        task_details = Task_detail.objects.filter(activity=activity_id, task_id=act_type).latest('id')
    except:
        task_details = None

    if request.method == 'POST':
        form = TaskForm(request.POST)
        if form.is_valid():
            qa_eng = request.POST.get("qa_eng")
            try:
                qa_eng = Bay_users.objects.get(pk=qa_eng)
            except:
                qa_eng = None
            qa_eng_old = request.POST.get("qa_eng_old")
            try:
                qa_eng_old = Bay_users.objects.get(pk=qa_eng_old)
            except:
                qa_eng_old = None
            qp_eng = request.POST.get("qp_eng")
            try:
                qp_eng = Bay_users.objects.get(pk=qp_eng)
            except:
                qp_eng = None
            qp_eng_old = request.POST.get("qp_eng_old")
            try:
                qp_eng_old = Bay_users.objects.get(pk=qp_eng_old)
            except:
                qp_eng_old = None
            doer = request.POST.get("doer")
            try:
                doer = Bay_users.objects.get(pk=doer)
            except:
                doer = None
            doer_old = request.POST.get("doer_old")
            try:
                doer_old = Bay_users.objects.get(pk=doer_old)
            except:
                doer_old = None
            qc_eng_1 = request.POST.get("qc_eng_1")
            try:
                qc_eng_1 = Bay_users.objects.get(pk=qc_eng_1)
            except:
                qc_eng_1 = None
            qc_eng_1_old = request.POST.get("qc_eng_1_old")
            try:
                qc_eng_1_old = Bay_users.objects.get(pk=qc_eng_1_old)
            except:
                qc_eng_1_old = None
            qc_eng_2 = request.POST.get("qc_eng_2")
            try:
                qc_eng_2 = Bay_users.objects.get(pk=qc_eng_2)
            except:
                qc_eng_2 = None
            qc_eng_2_old = request.POST.get("qc_eng_2_old")
            try:
                qc_eng_2_old = Bay_users.objects.get(pk=qc_eng_2_old)
            except:
                qc_eng_2_old = None
            status = request.POST.get("status")
            try:
                status = Task_status.objects.get(pk=status)
            except:
                status = None
            ticket_no = request.POST.get("ticket_no")
            da = request.POST.get("da")
            ewo = request.POST.get("ewo")
            job_type = request.POST.get("job_type")
            job_no = request.POST.get("job_no")
            lus = request.POST.get("lus")
            client_id = request.POST.get("client_id")
            if task_details:
                start_date = form.cleaned_data.get("start_date")
                complete_date = form.cleaned_data.get("complete_date")
                internal_qc_rating = form.cleaned_data.get("internal_qc_rating")
                external_qc_rating = form.cleaned_data.get("external_qc_rating")
                qa_rating = form.cleaned_data.get("qa_rating")
                att_qc_rating = form.cleaned_data.get("att_qc_rating")
                Task_detail.objects.filter(id=task_details.id).update(task_id=act_type, activity=activity_id, start_date=start_date, complete_date=complete_date, qa_eng=qa_eng, qp_eng=qp_eng, qa_rating=qa_rating, internal_qc_rating=internal_qc_rating, external_qc_rating=external_qc_rating, att_qc_rating=att_qc_rating, doer=doer, qc_eng_1=qc_eng_1,qc_eng_2=qc_eng_2, status=status)
                messages.success(request, "Your task details has been updated successfully")
                if qa_eng!=qa_eng_old and qa_eng!=0:
                    params = {'ticket_number':ticket_no, 'da_value':da, 'ewo_value':ewo,'job_type':job_type, 'job_no':job_no, 'lus':lus, 'email':qa_eng.email, 'client':client_id}
                    send_taskmail(params, 'activity_mail.html', 'New ticket assigned')
                if qp_eng!=qp_eng_old and qp_eng!=0:
                    params = {'ticket_number':ticket_no, 'da_value':da, 'ewo_value':ewo,'job_type':job_type, 'job_no':job_no, 'lus':lus, 'email':qp_eng.email, 'client':client_id}
                    send_taskmail(params, 'activity_mail.html', 'New ticket assigned')
                if doer!=doer_old and doer!=0:
                    params = {'ticket_number':ticket_no, 'da_value':da, 'ewo_value':ewo,'job_type':job_type, 'job_no':job_no, 'lus':lus, 'email':doer.email, 'client':client_id}
                    send_taskmail(params, 'activity_mail.html', 'New ticket assigned')
                if qc_eng_1!=qc_eng_1_old and qc_eng_1!=0:
                    params = {'ticket_number':ticket_no, 'da_value':da, 'ewo_value':ewo,'job_type':job_type, 'job_no':job_no, 'lus':lus, 'email':qc_eng_1.email, 'client':client_id}
                    send_taskmail(params, 'activity_mail.html', 'New ticket assigned')
                if qc_eng_2!=qc_eng_2_old and qc_eng_2!=0:
                    params = {'ticket_number':ticket_no, 'da_value':da, 'ewo_value':ewo,'job_type':job_type, 'job_no':job_no, 'lus':lus, 'email':qc_eng_2.email, 'client':client_id}
                    send_taskmail(params, 'activity_mail.html', 'New ticket assigned')
                return redirect('/task_details?step='+act_type+'&id='+activity_id)
            else:
                form.save()
                task_id = Task_detail.objects.latest('id').id
                Task_detail.objects.filter(id=task_id).update(activity=activity_id, qa_eng=qa_eng, qp_eng=qp_eng, doer=doer, qc_eng_1=qc_eng_1,qc_eng_2=qc_eng_2, status=status)
                if qa_eng!=qa_eng_old and qa_eng!=0:
                    params = {'ticket_number':ticket_no, 'da_value':da, 'ewo_value':ewo,'job_type':job_type, 'job_no':job_no, 'lus':lus, 'email':qa_eng.email, 'client':client_id}
                    send_taskmail(params, 'activity_mail.html', 'New ticket assigned')
                if qp_eng!=qp_eng_old and qp_eng!=0:
                    params = {'ticket_number':ticket_no, 'da_value':da, 'ewo_value':ewo,'job_type':job_type, 'job_no':job_no, 'lus':lus, 'email':qp_eng.email, 'client':client_id}
                    send_taskmail(params, 'activity_mail.html', 'New ticket assigned')
                if doer!=doer_old and doer!=0:
                    params = {'ticket_number':ticket_no, 'da_value':da, 'ewo_value':ewo,'job_type':job_type, 'job_no':job_no, 'lus':lus, 'email':doer.email, 'client':client_id}
                    send_taskmail(params, 'activity_mail.html', 'New ticket assigned')
                if qc_eng_1!=qc_eng_1_old and qc_eng_1!=0:
                    params = {'ticket_number':ticket_no, 'da_value':da, 'ewo_value':ewo,'job_type':job_type, 'job_no':job_no, 'lus':lus, 'email':qc_eng_1.email, 'client':client_id}
                    send_taskmail(params, 'activity_mail.html', 'New ticket assigned')
                if qc_eng_2!=qc_eng_2_old and qc_eng_2!=0:
                    params = {'ticket_number':ticket_no, 'da_value':da, 'ewo_value':ewo,'job_type':job_type, 'job_no':job_no, 'lus':lus, 'email':qc_eng_2.email, 'client':client_id}
                    send_taskmail(params, 'activity_mail.html', 'New ticket assigned')
                messages.success(request, "Your task details has been added successfully")
                return redirect('/task_details?step='+act_type+'&id='+activity_id)


    if activity_id and act_type:
        activitydata = Activity.objects.get(pk=activity_id)
        status_data = 0
        qa_eng = 0
        qp_eng = 0
        qa_rating = 0
        doer = 0
        qc_eng_1 = 0
        qc_eng_2 = 0
        internal_qc_rating = 0
        external_qc_rating = 0
        att_qc_rating = 0
        start_date = None
        complete_date = None
        if task_details:
            if task_details.qa_eng:
                qa_eng = task_details.qa_eng.id
            if task_details.qp_eng:
                qp_eng = task_details.qp_eng.id
            qa_rating = task_details.qa_rating
            if task_details.status:
                status_data = task_details.status.id
            if task_details.doer:
                doer = task_details.doer.id
            if task_details.qc_eng_1:
                qc_eng_1 = task_details.qc_eng_1.id
            if task_details.qc_eng_2:
                qc_eng_2 = task_details.qc_eng_2.id
            internal_qc_rating = task_details.internal_qc_rating
            external_qc_rating = task_details.external_qc_rating
            att_qc_rating = task_details.att_qc_rating
            '''if task_details.start_date:
                start_date = task_details.start_date
            if task_details.complete_date:
                complete_date = task_details.complete_date'''

        activity_task_data = Activity_tasks.objects.filter(activity_id=activity_id, task=act_type).order_by('id')
        counter = 1
        data_list = []
        for i in activity_task_data:
            if counter == 1 and (i.subtask.id == 1 or i.subtask.id == 7 or i.subtask.id == 13 or i.subtask.id == 19 or i.subtask.id == 23 or i.subtask.id == 25):
                data_list.insert(0,i)
                counter+=1
            elif counter > 1 and (i.subtask.id == 4 or i.subtask.id == 10 or i.subtask.id == 16 or i.subtask.id == 22 or i.subtask.id == 24 or i.subtask.id == 25):
                data_list.insert(1,i)
                counter+=1
        if len(data_list)>0:
            if data_list[0].start_date:
                start_date = data_list[0].start_date
            if act_type == '6':
                complete_date = data_list[0].complete_date

        if len(data_list)>1:
            if data_list[1].complete_date:
                complete_date = data_list[1].complete_date

        try:
            exist_media = Task_media.objects.filter(task_id__activity_id=activity_id, task_id__task=act_type).order_by('id')
        except:
            exist_media = ''
        try:
            exist_comment = Task_remark.objects.filter(task_id__activity_id=activity_id, task_id__task=act_type).order_by('id')
        except:
            exist_comment = ''
    else:
        return redirect('activity_list')

    form = TaskForm(initial={'activity_id_id':activity_id, 'task_id':act_type, 'added_by_id':request.user.id, 'start_date':start_date, 'complete_date':complete_date, 'qa_eng':qa_eng, 'qa_eng_old':qa_eng, 'qp_eng':qp_eng, 'qp_eng_old':qp_eng, 'qa_rating':qa_rating, 'status':status_data, 'doer':doer, 'doer_old':doer, 'qc_eng_1':qc_eng_1, 'qc_eng_1_old':qc_eng_1, 'qc_eng_2':qc_eng_2, 'qc_eng_2_old':qc_eng_2, 'internal_qc_rating':internal_qc_rating, 'external_qc_rating':external_qc_rating, 'att_qc_rating':att_qc_rating})
    mediaform = TaskmediaForm()
    remarkform = TaskcommentForm()

    if act_type == '1':
        step = 'Fielding'
    elif act_type == '2':
        step = 'Planning(design)'
    elif act_type == '3':
        step = 'Drafting'
    elif act_type == '4':
        step = 'QC Project'
    elif act_type == '5':
        step = 'Research'
    elif act_type == '6':
        step = 'Permit'
    elif act_type == '10':
        step = 'Invoicing'

    params = {"form":form, "mediaform":mediaform, "remarkform":remarkform, "activitydata":activitydata, "step":step, "act_type":act_type, 'exist_data':'', 'exist_comment':exist_comment, 'exist_media':exist_media}
    return render(request, 'task_details.html', params)