from http import client
from activity.views.import_data import *
from activity.models import Activity
current_date = date.today()
def dashboard(request):
    # year_count = Activity.objects.filter(rec_date__year='2022').count()
    present = datetime.date.today()
    #print(present)
    # result1 =  Activity.objects.filter(rec_date__year=present.year,
    #                        rec_date__month=present.month)
    # context1 = {'result1':result1}
    now = timezone.now()
    result = Activity.objects.aggregate(
        total=models.Count('id'),
        today=models.Count('id', filter=models.Q(rec_date=now.date())),
        month=models.Count('id', filter=models.Q(rec_date__month=present.month)),
        year=models.Count('id', filter=models.Q(rec_date__year=present.year)),
        yesterday=models.Count('id', filter=models.Q(rec_date__gte=(now - timedelta(hours=24)).date())),
        this_week=models.Count('id', filter=models.Q(rec_date__gte=(now - timedelta(days=7)).date())),
    )
    context = {'result': result}
    # print(entry)
    return render(request, 'dashboard.html', context)  # type: ignore



def dashboard1(request):
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

