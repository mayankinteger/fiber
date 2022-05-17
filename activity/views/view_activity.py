from activity.views.import_data import *

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
