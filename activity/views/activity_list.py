from activity.views.import_data import *

@login_required(login_url="/login")
def activity_list(request):
    act_list = Activity.objects.order_by('-id')
    myFilter = ActivityFilter(request.GET, queryset=act_list)
    act_list = myFilter.qs   
    return render(request, 'activity_list.html', {'act_list':act_list,'myFilter':myFilter})
