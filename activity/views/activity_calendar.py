from activity.views.import_data import *

@login_required(login_url="/login")
def activity_calendar(request):
    act_list = Activity.objects.select_related()
    #print(act_list)
    act_data = []
    for activity in act_list:
        start_date = datetime.datetime.strptime(str(activity.rec_date), '%Y-%m-%d').strftime('%Y-%m-%d')
        date_arr = start_date.split("-")
        #print(date_arr)
        market = ""
        if activity.market==1:
            market = "AL"
        elif activity.market==2:
            market = "LA"
        elif activity.market==3:
            market = "FL"
        elif activity.market==4:
            market = "MS"
        if activity.assign_fielder:
            fielder_fname = activity.assign_fielder.fname+" - "
        else:
            fielder_fname = ""
        single_data = {'title':'"'+fielder_fname+activity.ewo+" - "+market+'"','start':"new Date("+date_arr[0]+", "+str(int(date_arr[1])-1)+", "+str(int(date_arr[2]))+")"}
        act_data.append(single_data)
    act_data = str(act_data)
    #act_data = act_data[1:-1]
    act_data = act_data.replace("'", "")
    #print(act_data)
    params = {'act_data':act_data}
    return render(request, 'activity_calendar.html', params)
