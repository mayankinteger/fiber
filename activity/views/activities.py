from activity.views.import_data import *
from activity.views.page_permission import *

@login_required(login_url="/login")
def activities(request):
    current_url = resolve(request.path_info).url_name
    user_id = request.user.id
    page_check = permision_check(current_url,user_id)
    if page_check == False:
        return render(request,'404.html')
    activity_id = request.GET.get("id")
    act_type = request.GET.get("step")
    task_subtask = Activity_tasks.objects.filter(activity_id=activity_id, type=act_type).order_by('id')
    subtask_data = Subtasks.objects.filter(status=0, task_id=act_type)
    activitydata = Activity.objects.get(pk=activity_id)
    #print(task_subtask)
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
    param = {'activitydata':activitydata, 'step':step, 'act_type':act_type, 'task_subtask':task_subtask, 'subtask_data':subtask_data}
    return render(request, 'activities.html', param)

@login_required(login_url="/login")
def activities_subtask(request):
    activity = request.POST.get("activity_id")
    activity_id = Activity.objects.get(id=activity)
    type = request.POST.get("type")
    subtask = request.POST.get("subtask")
    subtask_id = Subtasks.objects.get(id=subtask)
    added_by = request.POST.get("added_by")
    added_by_id = Bay_users.objects.get(id=added_by)
    status = request.POST.get("status")
    activities_subtask = Activity_tasks(activity_id=activity_id, type=type, subtask=subtask_id, status=status, added_by=added_by_id)
    activities_subtask.save()
    return redirect('/activities?step='+type+'&id='+activity)

@login_required(login_url="/login")
def subtask_remark(request):
    activity = request.POST.get("r_activity_id")
    remark = request.POST.get("remark")
    #activity_id = Activity.objects.get(id=activity)
    type = request.POST.get("r_type")
    task = request.POST.get("r_task_id")
    task_id = Activity_tasks.objects.get(id=task)
    added_by = request.POST.get("r_added_by")
    added_by_id = Bay_users.objects.get(id=added_by)
    task_remark = Task_remark(task_id=task_id, added_by=added_by_id, remark=remark)
    task_remark.save()
    messages.success(request, " Your remark has been saved successfully")
    return redirect('/activities?step='+type+'&id='+activity)

@login_required(login_url="/login")
def subtask_media(request):
    activity = request.POST.get("m_activity_id")
    media = request.FILES.get("media")
    #activity_id = Activity.objects.get(id=activity)
    type = request.POST.get("m_type")
    task = request.POST.get("m_task_id")
    task_id = Activity_tasks.objects.get(id=task)
    added_by = request.POST.get("m_added_by")
    added_by_id = Bay_users.objects.get(id=added_by)
    task_media = Task_media(task_id=task_id, added_by=added_by_id, media=media)
    task_media.save()
    messages.success(request, " Your media has been saved successfully")
    return redirect('/activities?step='+type+'&id='+activity)
