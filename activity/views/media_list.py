from activity.views.import_data import *
from activity.views.page_permission import *

@login_required(login_url="/login")
def media_list(request):
    current_url = resolve(request.path_info).url_name
    user_id = request.user.id
    page_check = permision_check(current_url,user_id)
    if page_check == False:
        return render(request,'404.html')
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
