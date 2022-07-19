from activity.views.import_data import *
import csv
from activity.templatetags.myfilters import *

@login_required(login_url="/login")
def csv_activity_list(request):
    response = HttpResponse(content_type='text/csv')  
    response['Content-Disposition'] = 'attachment; filename="All activities.csv"'  
    act_list = Activity.objects.order_by('-id')  
    writer = csv.writer(response)  
    writer.writerow(['ID', 'Ticket', 'Job Receive Date', 'ECD', 'Client', 'DA', 'LUs', 'Wire Center', 'Job Type', 'Job No.', 'EWO', 'Client Ticket No.', 'Market', 'Revised ECD', 'PFP', 'Latitude', 'Longitude', 'F1 CFAS', 'F1 Job No.', 'F1 SOW', 'F2 CFAS', 'F2 Job', 'F2 SOW', 'Work Print', 'Footage', 'Terminals', 'Fielder', 'Work Start Date', 'Fielder ECD', 'Lead Eng', 'Notes For Fielders', 'Added By', 'Added Date'])
    sno = 1
    for employee in act_list:
        cient = None
        if employee.client_id:
            cient = employee.client_id.name
        assign_fielder = None
        if employee.assign_fielder:
            assign_fielder = employee.assign_fielder.fname
        lead_eng = None
        if employee.lead_eng:
            lead_eng = employee.lead_eng.fname
        market_data = None
        if employee.market:
            market_data = market(employee.market)

        writer.writerow([sno,employee.ticket,employee.rec_date,employee.ecd,cient,employee.da,employee.lus,employee.wire_center,employee.job_type,employee.job_no,employee.ewo,employee.client_ticket,market_data,employee.revised_ecd,employee.pfp,employee.latitude,employee.longitude,employee.f1cfas,employee.f1job_no,employee.f1_sow,employee.f2cfas,employee.f2job_no,employee.f2_sow,employee.work_print,employee.footage,employee.terminal,assign_fielder,employee.fielding_start_date,employee.fielder_ecd,lead_eng,employee.notes,employee.added_by.fname,employee.added_date])
        sno+=1
    return response