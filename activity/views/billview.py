from activity.views.import_data import *

@login_required(login_url="/login")
def billview(request):
    #act_list = Activity.objects.order_by('-id')
    #params = {'act_list':act_list}
    bill_list = Bill.objects.order_by('-id')
    params = {'bill_list':bill_list}
    #bill = Bill.objects.get(activity__bill)

    #print(bill_list.activity)
    return render(request, 'billview.html', params)