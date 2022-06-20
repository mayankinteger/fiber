from activity.views.import_data import *
from activity.views.page_permission import *

@login_required(login_url="/login")
def task_details(request):
    current_url = resolve(request.path_info).url_name
    user_id = request.user.id
    page_check = permision_check(current_url,user_id)
    if page_check == False:
        return render(request,'404.html')
    activity_id = request.GET.get("id")
    act_type = request.GET.get("step")
    task_details = Task_detail.objects.filter(activity=activity_id, task_id=act_type).latest('id')

    if request.method == 'POST':
        activity_id_data = Activity.objects.get(pk=activity_id)
        doer_data = request.POST.get("doer")
        doer = None
        if doer_data!='0':
            doer = Bay_users.objects.get(pk=doer_data)
        qc_eng_1_data = request.POST.get("qc_eng_1")
        qc_eng_1 = None
        if qc_eng_1_data!='0':
            qc_eng_1 = Bay_users.objects.get(pk=qc_eng_1_data)
        
        qc_eng_2_data = request.POST.get("qc_eng_2")
        qc_eng_2 = None
        if qc_eng_2_data!='0':
            qc_eng_2 = Bay_users.objects.get(pk=qc_eng_2_data)
        status_data = request.POST.get("status")
        status = None
        if status_data!='0':
            status = Task_status.objects.get(pk=status_data)
        internal_qc_rating = request.POST.get("internal_qc_rating")
        external_qc_rating = request.POST.get("external_qc_rating")
        att_qc_rating = request.POST.get("att_qc_rating")
        start_date = request.POST.get("start_date")
        strt_date = None
        if start_date:
            strt_date = datetime.datetime.strptime(start_date, '%m-%d-%Y').strftime('%Y-%m-%d')
        complete_date = request.POST.get("complete_date")
        cmplte_date = None
        if complete_date:
            cmplte_date = datetime.datetime.strptime(complete_date, '%m-%d-%Y').strftime('%Y-%m-%d')
        if task_details:
            Task_detail.objects.filter(id=task_details.id).update(activity=activity_id_data, task_id=act_type, doer=doer, qc_eng_1=qc_eng_1, qc_eng_2=qc_eng_2, internal_qc_rating=internal_qc_rating, external_qc_rating=external_qc_rating, att_qc_rating=att_qc_rating, start_date=strt_date, complete_date=cmplte_date, status=status)
            return redirect('/task_details?step='+act_type+'&id='+activity_id)
        else:
            task_details_data = Task_detail(activity=activity_id_data, task_id=act_type, doer=doer, qc_eng_1=qc_eng_1, qc_eng_2=qc_eng_2, internal_qc_rating=internal_qc_rating, external_qc_rating=external_qc_rating, att_qc_rating=att_qc_rating, start_date=strt_date, complete_date=cmplte_date, status=status)
            task_details_data.save()
            return redirect('/task_details?step='+act_type+'&id='+activity_id)
    

    if activity_id and act_type:
        activitydata = Activity.objects.get(pk=activity_id)
        task_details = Task_detail.objects.filter(activity=activity_id, task_id=act_type).latest('id')
        status_data = 0
        doer = 0
        qc_eng_1 = 0
        qc_eng_2 = 0
        internal_qc_rating = 0
        external_qc_rating = 0
        att_qc_rating = 0
        start_date = None
        complete_date = None
        if task_details:
            status_data = task_details.status.id
            doer = task_details.doer.id
            qc_eng_1 = task_details.qc_eng_1.id
            qc_eng_2 = task_details.qc_eng_2.id
            internal_qc_rating = task_details.internal_qc_rating
            external_qc_rating = task_details.external_qc_rating
            att_qc_rating = task_details.att_qc_rating
            start_date = task_details.start_date
            complete_date = task_details.complete_date
        activity_task_data = Activity_tasks.objects.filter(activity_id=activity_id, task=act_type)
        counter = 1
        data_list = []
        for i in activity_task_data:
            if counter==1 and (act_type == '1' or act_type == '2' or act_type == '3'):
                data_list.insert(0,i)
                counter+=1
            elif i.subtask.subtask == 'Submission' and (act_type == '1' or act_type == '2' or act_type == '3'):
                data_list.insert(1,i)
                counter+=1
        
        if len(data_list)>0 and start_date == None:
            if data_list[0].start_date:
                start_date = data_list[0].start_date
                
        
        if len(data_list)>1 and complete_date == None:
            if data_list[1].complete_date:
                complete_date = data_list[1].complete_date
        
        try:
            exist_media = Task_media.objects.filter(task_id__activity_id=activity_id, task_id__task=act_type)
        except:
            exist_media = ''
        try:
            exist_comment = Task_remark.objects.filter(task_id__activity_id=activity_id, task_id__task=act_type)
        except:
            exist_comment = ''
    else:
        return redirect('activity_list')



    form = TaskForm(initial={'activity_id_id':activity_id, 'task_id':act_type, 'start_date':start_date, 'complete_date':complete_date, 'status':status_data, 'doer':doer, 'qc_eng_1':qc_eng_1, 'qc_eng_2':qc_eng_2, 'internal_qc_rating':internal_qc_rating, 'external_qc_rating':external_qc_rating, 'att_qc_rating':att_qc_rating})
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
