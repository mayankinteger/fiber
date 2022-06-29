from http import client
from activity.views.import_data import *
from activity.models import Activity
from activity.views.page_permission import *

current_date = date.today()
# current_date = date.today()
# today = datetime.date.today()
present = datetime.date.today()
weekday = present.weekday()
start_delta = datetime.timedelta(days=weekday, weeks=1)
start_week = datetime.timedelta(days=weekday)
start_last_week = present - start_delta
start_this_week =present - start_week
# print(start_last_week)
# print(start_this_week)
prev = current_date.replace(day=1) - timedelta(days=1)
now = timezone.now()
lastt = current_date.replace(year=present.year) - timedelta(days=366)
def dashboard(request):
    current_url = resolve(request.path_info).url_name
    user_id = request.user.id
    page_check = permision_check(current_url,user_id)
    if page_check == False:
        return render(request,'404.html')
    present = datetime.date.today()
    now = timezone.now()
    added = Activity.objects.aggregate(
        total=models.Count('id'),
        today=models.Count('id', filter=models.Q(rec_date=now.date())),
        month=models.Count('id', filter=models.Q(rec_date__month=present.month)),
        previous_month=models.Count('id', filter=models.Q(rec_date__month=prev.month)),
        year=models.Count('id', filter=models.Q(rec_date__year=present.year)),
        previous_year=models.Count('id', filter=models.Q(rec_date__year=lastt.year)),
        yesterday=models.Count('id', filter=models.Q(rec_date__contains=(now - timedelta(hours=24)).date())),
        day_before_yesterday = models.Count('id', filter=models.Q(rec_date__contains=(now - timedelta(hours=48)).date())),
        this_week=models.Count('id', filter=models.Q(rec_date__gte=start_this_week)),
        last_week=models.Count('id', filter=models.Q(rec_date__gte= start_last_week, rec_date__lt=start_this_week)),
    )
    #  print(last_week)
    present1 = datetime.date.today()
    completed = Activity.objects.aggregate(
        total=models.Count('id'),
        today=models.Count('id', filter=models.Q(cmplt_date=now.date())),
        month=models.Count('id', filter=models.Q(cmplt_date__month=present1.month)),
        previous_month=models.Count('id', filter=models.Q(cmplt_date__month=prev.month)),
        year=models.Count('id', filter=models.Q(cmplt_date__year=present1.year)),
        previous_year=models.Count('id', filter=models.Q(cmplt_date__year=lastt.year)),
        yesterday=models.Count('id', filter=models.Q(cmplt_date__contains=(now - timedelta(hours=24)).date())),
        day_before_yesterday = models.Count('id', filter=models.Q(cmplt_date__contains=(now - timedelta(hours=48)).date())),
        this_week=models.Count('id', filter=models.Q(cmplt_date__gte=start_this_week)),
        last_week=models.Count('id', filter=models.Q(cmplt_date__gte=start_last_week,cmplt_date__lt=start_this_week,)),
    )
    
    # fe_f =  Activity.objects.aggregate(
        
    # ) 
    ewos = Activity.objects.filter(cmplt_date__isnull = False).order_by('-id')[:10]
    #print(ewos)
    days_list=[]
    ewo_list=[]
    complete_date = []
    receive_date = []
    for i in ewos:
        ewo_list.append(i.ewo)
        complete_date.append(i.cmplt_date)
        receive_date.append(i.rec_date)
        delta = i.cmplt_date - i.rec_date
        # print(delta.days)
        if delta:
            days_list.append(delta.days)
        else:
            days_list.append(0)
   
    # print(complete_date)    
    fe_list = Fe_users.objects.all()
    fe_name=[]
    for i in fe_list:
        fe_name.append(i.fname)
    # print(names)
    # print(fe_name)
    fe_list = Fe_users.objects.all()
    fe_name=[]
    cl1_fe_data = []
    cl2_fe_data = []
    cl3_fe_data = []
    cl4_fe_data = []
    act_month = present.month
    for i in fe_list:
        fe_name.append(i.fname)
        field_cl1_data = Activity.objects.aggregate(
            fe=models.Count('id', filter=models.Q(client_id=1,assign_fielder=i.id,rec_date__month=act_month))
            )
        cl1_fe_data.append(field_cl1_data['fe'])
        field_cl2_data = Activity.objects.aggregate(
            fe=models.Count('id', filter=models.Q(client_id=2,assign_fielder=i.id,rec_date__month=act_month))
            )
        cl2_fe_data.append(field_cl2_data['fe'])
        field_cl3_data = Activity.objects.aggregate(
            fe=models.Count('id', filter=models.Q(client_id=3,assign_fielder=i.id,rec_date__month=act_month))
            )
        cl3_fe_data.append(field_cl3_data['fe'])
        
    #print(cl1_fe_data)
    #print(cl2_fe_data)
    # print(cl4_fe_data)
    
    fielder_list = Activity.objects.all()
    # print(fielder_list)
    act_month = present.month
    
    context  = {'added': added,'fe_name':fe_name,'completed': completed,'complete_date':complete_date,'receive_date':receive_date,'ewo_list':ewo_list,'days_list':days_list, 'field_cl1_output':cl1_fe_data,'field_cl2_output':cl2_fe_data,'field_cl3_output':cl3_fe_data,'act_month':int(act_month)}
    return render(request, 'dashboard.html', context)


def dashboard1(request):
    current_url = resolve(request.path_info).url_name
    user_id = request.user.id
    page_check = permision_check(current_url,user_id)
    if page_check == False:
        return render(request,'404.html')
    # year_count = Activity.objects.filter(rec_date__year='2022').count()
    client_list = Clients.objects.order_by('name')
    #clients_list = Activity.objects.filter(client_id=3, rec_date__month='5').count()
    client_chart = 1
    
    present = datetime.date.today()
    act_month = present.month
    #client_chart = 1
    if request.method == 'POST' and request.POST.get("activity_month"):
        act_month=request.POST.get("activity_month")
    first_cl_result = Activity.objects.aggregate(
        cl_jan=models.Count('id', filter=models.Q(client_id=1,rec_date__month='1')),
        cl_feb=models.Count('id', filter=models.Q(client_id=1,rec_date__month='2')),
        cl_mar=models.Count('id', filter=models.Q(client_id=1,rec_date__month='3')),
        cl_apr=models.Count('id', filter=models.Q(client_id=1,rec_date__month='4')),
        cl_may=models.Count('id', filter=models.Q(client_id=1,rec_date__month='5')),
        cl_jun=models.Count('id', filter=models.Q(client_id=1,rec_date__month='6')),
        cl_jul=models.Count('id', filter=models.Q(client_id=1,rec_date__month='7')),
        cl_aug=models.Count('id', filter=models.Q(client_id=1,rec_date__month='8')),
        cl_sep=models.Count('id', filter=models.Q(client_id=1,rec_date__month='9')),
        cl_oct=models.Count('id', filter=models.Q(client_id=1,rec_date__month='10')),
        cl_nov=models.Count('id', filter=models.Q(client_id=1,rec_date__month='11')),
        cl_dec=models.Count('id', filter=models.Q(client_id=1,rec_date__month='12')),
    )
    sec_cl_result = Activity.objects.aggregate(
        cl_jan=models.Count('id', filter=models.Q(client_id=2,rec_date__month='1')),
        cl_feb=models.Count('id', filter=models.Q(client_id=2,rec_date__month='2')),
        cl_mar=models.Count('id', filter=models.Q(client_id=2,rec_date__month='3')),
        cl_apr=models.Count('id', filter=models.Q(client_id=2,rec_date__month='4')),
        cl_may=models.Count('id', filter=models.Q(client_id=2,rec_date__month='5')),
        cl_jun=models.Count('id', filter=models.Q(client_id=2,rec_date__month='6')),
        cl_jul=models.Count('id', filter=models.Q(client_id=2,rec_date__month='7')),
        cl_aug=models.Count('id', filter=models.Q(client_id=2,rec_date__month='8')),
        cl_sep=models.Count('id', filter=models.Q(client_id=2,rec_date__month='9')),
        cl_oct=models.Count('id', filter=models.Q(client_id=2,rec_date__month='10')),
        cl_nov=models.Count('id', filter=models.Q(client_id=2,rec_date__month='11')),
        cl_dec=models.Count('id', filter=models.Q(client_id=2,rec_date__month='12')),
    )
    third_cl_result = Activity.objects.aggregate(
        cl_jan=models.Count('id', filter=models.Q(client_id=3,rec_date__month='1')),
        cl_feb=models.Count('id', filter=models.Q(client_id=3,rec_date__month='2')),
        cl_mar=models.Count('id', filter=models.Q(client_id=3,rec_date__month='3')),
        cl_apr=models.Count('id', filter=models.Q(client_id=3,rec_date__month='4')),
        cl_may=models.Count('id', filter=models.Q(client_id=3,rec_date__month='5')),
        cl_jun=models.Count('id', filter=models.Q(client_id=3,rec_date__month='6')),
        cl_jul=models.Count('id', filter=models.Q(client_id=3,rec_date__month='7')),
        cl_aug=models.Count('id', filter=models.Q(client_id=3,rec_date__month='8')),
        cl_sep=models.Count('id', filter=models.Q(client_id=3,rec_date__month='9')),
        cl_oct=models.Count('id', filter=models.Q(client_id=3,rec_date__month='10')),
        cl_nov=models.Count('id', filter=models.Q(client_id=3,rec_date__month='11')),
        cl_dec=models.Count('id', filter=models.Q(client_id=3,rec_date__month='12')),
    )
    now = timezone.now()
    result = Activity.objects.aggregate(
        fielding_month=models.Count('id', filter=models.Q(activity=1,rec_date__month=act_month)),
        planning_month=models.Count('id', filter=models.Q(activity=2,rec_date__month=act_month)),
        drafting_month=models.Count('id', filter=models.Q(activity=3,rec_date__month=act_month)),
        qc_month=models.Count('id', filter=models.Q(activity=4,rec_date__month=act_month)),
    )
    context = {'result': result, 'first_cl_result': first_cl_result, 'sec_cl_result': sec_cl_result, 'third_cl_result': third_cl_result, 'act_month':int(act_month), 'client_list':client_list}
    return render(request, 'dashboard1.html', context)  # type: ignore

