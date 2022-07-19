from multiprocessing import current_process
from activity.views.import_data import *
from django.db.models import Q
from django.shortcuts import render
from io import BytesIO
from django.http import HttpResponse
from django.template.loader import get_template
from django.views import View
from xhtml2pdf import pisa

def mobile(request):
        current_user = request.user.id 
        # jobs = Activity.objects.filter(assign_fielder = current_user)
        # print(jobs)
        jobs = Activity.objects.filter(assign_fielder__isnull = False).order_by('-id')
        # print(jobs)   
        print(current_user)   
        context = {'jobs':jobs}
        return render(request,'feuser/my_activity.html',context)

def mobile_view(request):
    if request.method == "GET":
        job_id = request.GET.get("id", "off")
        # print(job_id)
        if job_id != 'off':
            jobdata = Activity.objects.filter(id=job_id)[0]
            # print(jobdata.ewo)
            params = {'jobdata': jobdata}
            return render(request, 'feuser/activity_view.html', params)
        else:
            return redirect('my_activity')

def mobile_media(request):
    if request.method == "GET":
        got_id = request.GET.get("id","off")
        # print('sdsd',got_id)
        if got_id != 'off':
            media = Activity.objects.filter(id=got_id)[0]
            # print(media.ewo)
            f1_files = Activity_media.objects.filter(activity_id=got_id, file_type='f1').order_by('-id')
            f2_files = Activity_media.objects.filter(activity_id=got_id, file_type='f2').order_by('-id')
            # print(f1_files)
            for i in f1_files:
                print(i.file_name)
            # print(f2_files)
            params = {'media': media,'f1_files':f1_files,'f2_files':f2_files}
            return render(request, 'feuser/activity_media.html', params)
        else:
            return redirect('activity_media')
    return render (request, "feuser/activity_media.html")


# def pdf_report_create(request):
#     # products = Product.objects.all()
#     if request.method == "GET":
#         got_id = request.GET.get("id","off")
#         # print('sdsd',got_id)
#         if got_id != 'off':
#             media = Activity.objects.filter(id=got_id)[0]
#             f1_files = Activity_media.objects.filter(activity_id=got_id, file_type='f1').order_by('-id')
#             f2_files = Activity_media.objects.filter(activity_id=got_id, file_type='f2').order_by('-id')
#             print(f1_files)
#             print(f2_files)
#             params = {'media': media,'f1_files':f1_files,'f2_files':f2_files}
            
#             template_path = 'feuser/pdf_template.html'
#             response = HttpResponse(content_type='application/pdf')
#             filename = str(media.ewo) + ".pdf"
#             # print(filename)
            
#             response['Content-Disposition'] = 'attachment;filename="{}"'.format(filename)
            
#             template = get_template(template_path)

#             html = template.render(params)

#             pisa_status = pisa.CreatePDF(html, dest=response)
#             if pisa_status.err:
#                 return HttpResponse('We had some errors <pre>' + html + '</pre>')
#             return response
    
