from activity.views.import_data import *
from activity.views.page_permission import *

@login_required(login_url="/login")
def view_activity(request):
    current_url = resolve(request.path_info).url_name
    user_id = request.user.id
    page_check = permision_check(current_url,user_id)
    if page_check == False:
        return render(request,'404.html')
    if request.method == "GET":
        get_id = request.GET.get("id", "off")
        if get_id != 'off':
            viewdata = Activity.objects.filter(id=get_id)[0]
            params = {'viewdata': viewdata}
            return render(request, 'view_activity.html', params)
        else:
            return redirect('activity_list')
