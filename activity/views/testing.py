from activity.views.import_data import *

@login_required(login_url="/login")
def activity_list(request):
    client_id = request.GET.get("client")
    start = request.GET.get("start_date")
    end = request.GET.get("end_date")
    flag=0
    if start and end:
        start_date = datetime.datetime.strptime(start, '%m-%d-%Y').strftime('%Y-%m-%d')
        end_date = datetime.datetime.strptime(end, '%m-%d-%Y').strftime('%Y-%m-%d')
        if start_date>end_date:
            flag = 1
            messages.error(request, " Please select correct date")
            return redirect('/activity_list')
    elif not(end) and start:
        start_date = datetime.datetime.strptime(start, '%m-%d-%Y').strftime('%Y-%m-%d')
    elif not(start) and end:
        messages.error(request, " Please select correct date")
        return redirect('/activity_list')

    if client_id and start and end and flag==0:
        client_ins = Clients.objects.get(id=client_id)
        act_list = Activity.objects.filter(client_id=client_ins, added_date__range=[start_date, end_date]).order_by('-id')
    elif not(client_id) and start and end and flag==0:
        act_list = Activity.objects.filter(added_date__range=[start_date, end_date]).order_by('-id')
    elif client_id and start and flag==0:
        client_ins = Clients.objects.get(id=client_id)
        act_list = Activity.objects.filter(client_id=client_ins, added_date__gte=start_date).order_by('-id')
    elif client_id and flag==0:
        client_ins = Clients.objects.get(id=client_id)
        act_list = Activity.objects.filter(client_id=client_ins).order_by('-id')
    elif start and flag==0:
        act_list = Activity.objects.filter(added_date__gte=start_date).order_by('-id')
    elif flag==0:
        act_list = Activity.objects.order_by('-id')
    client_list = Clients.objects.order_by('name')
    myFilter = ActivityFilter(request.GET, queryset=act_list)
    act_list = myFilter.qs   
    if client_id:
        params = {'act_list':act_list,'client_list':client_list, 'client_ins':client_ins,'myFilter':myFilter}
    else:
        params = {'act_list':act_list,'client_list':client_list,'myFilter':myFilter}
    return render(request, 'activity_list.html', params)
