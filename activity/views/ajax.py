from activity.views.import_data import *


@login_required(login_url="/login")
def ajax(request):
    if request.method == "POST":
        page = request.POST.get("page")
        if page == 'attachment_fetch':
            task_id = request.POST.get("task_id")
            all_media = Task_media.objects.filter(task_id=task_id)
            media = {'page':'media', 'data':all_media}
            html_content = render_to_string("ajax.html", media)
            return HttpResponse(html_content)
        elif page == 'remark_fetch':
            task_id = request.POST.get("task_id")
            all_remark = Task_remark.objects.filter(task_id=task_id)
            remark = {'page':'remark', 'data':all_remark}
            html_content = render_to_string("ajax.html", remark)
            return HttpResponse(html_content)
        elif page == 'task_media_delete':
            id = request.POST.get("id")
            media_del = Task_media.objects.get(pk=id)
            media_del.delete()
            return JsonResponse({'status':'ok'})
        elif page == 'activity_delete':
            get_id = request.POST.get("act_id")
            media_del = Activity_media.objects.filter(activity_id=get_id)
            if media_del:
                for delete_allmedia in media_del:
                    print(delete_allmedia)
                    delete_allmedia.delete()
            task_media_del = Task_media.objects.filter(task_id__activity_id=get_id)
            if task_media_del:
                for delete_taskmedia in task_media_del:
                    print(delete_taskmedia)
                    delete_taskmedia.delete()
            deleted = Activity.objects.filter(id=get_id).delete()
            if deleted:
                return JsonResponse({'response': 'ok'})
        elif page == 'media_delete':
            id = request.POST.get("id")
            media_del = Activity_media.objects.get(pk=id)
            media_del.delete()
            return JsonResponse({'status':'ok'})
        elif page == 'subtask_update':
            task_id = request.POST.get("task_id")
            status = request.POST.get("status")
            
            start_date = request.POST.get("start_date")
            if start_date:
                start_date = datetime.datetime.strptime(start_date, '%m-%d-%Y').strftime('%Y-%m-%d')
            else:
                start_date = None
            
            complete_date = request.POST.get("complete_date")
            if complete_date:
                complete_date = datetime.datetime.strptime(complete_date, '%m-%d-%Y').strftime('%Y-%m-%d')
            else:
                complete_date = None
            
            assigned_to = request.POST.get("assigned_to")
            try:
                assigned_to = Bay_users.objects.get(id=assigned_to)
            except:
                assigned_to = None

            Activity_tasks.objects.filter(id=task_id).update(status=status, start_date=start_date, complete_date=complete_date, assigned_to=assigned_to)
            messages.success(request, " Your task has been updated successfully")
            return HttpResponse('done')
        elif page == 'dashboard':
            client_chart = request.POST.get("client_chart")
            clients_result = Activity.objects.aggregate(
                cl_jan=models.Count('id', filter=models.Q(client_id=client_chart,rec_date__month='1')),
                cl_feb=models.Count('id', filter=models.Q(client_id=client_chart,rec_date__month='2')),
                cl_mar=models.Count('id', filter=models.Q(client_id=client_chart,rec_date__month='3')),
                cl_apr=models.Count('id', filter=models.Q(client_id=client_chart,rec_date__month='4')),
                cl_may=models.Count('id', filter=models.Q(client_id=client_chart,rec_date__month='5')),
                cl_jun=models.Count('id', filter=models.Q(client_id=client_chart,rec_date__month='6')),
                cl_jul=models.Count('id', filter=models.Q(client_id=client_chart,rec_date__month='7')),
                cl_aug=models.Count('id', filter=models.Q(client_id=client_chart,rec_date__month='8')),
                cl_sep=models.Count('id', filter=models.Q(client_id=client_chart,rec_date__month='9')),
                cl_oct=models.Count('id', filter=models.Q(client_id=client_chart,rec_date__month='10')),
                cl_nov=models.Count('id', filter=models.Q(client_id=client_chart,rec_date__month='11')),
                cl_dec=models.Count('id', filter=models.Q(client_id=client_chart,rec_date__month='12')),
            )
            return JsonResponse(clients_result)
        elif page=="fielder_delete":
            get_id = request.POST.get("act_id")
            fe_user_delete = Fe_users.objects.get(id=get_id)
            if fe_user_delete:
                print(fe_user_delete)
                fe_user_delete.delete()
                return JsonResponse({'status':'ok'})
        elif page=="feuser_status_change":
            feuser_id = request.POST.get("feuser_id")
            status = request.POST.get("status")
            fe_user_status = Fe_users.objects.filter(id=feuser_id).update(is_active=status)
            if fe_user_status:
                return JsonResponse({'status':'ok'})
        elif page=="fe_change_password":
             feuser_id = request.POST.get("fe_id")
             password = request.POST.get("password")
             fe_user_data = Fe_users.objects.filter(id=feuser_id).update(password=password)
             if fe_user_data:
                messages.success(request, " Your password has been updated successfully")
                return JsonResponse({'status':'ok'})