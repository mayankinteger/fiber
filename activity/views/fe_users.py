from activity.views.import_data import *
from activity.views.page_permission import *
from django.contrib.auth.hashers import make_password , check_password
def sendfe_mail(mydata, page, subject):
    mail_setting = Mail_settings.objects.get(priority=2)
    html_content = render_to_string("email/"+page, mydata)
    text_content = strip_tags(html_content)
    if page == 'reset_password.html':
        receiver = [mydata['email']]
    else:
        receiver = [mydata['email'], "amit@integertel.com"]
    email = EmailMultiAlternatives(
        # subject
        subject,
        # msg
        text_content,
        # from email
        mail_setting,
        # recipient list
        receiver
    )
    email.attach_alternative(html_content,"text/html")
    email.send()

def Enquiry(lis1):
    if len(lis1) == 0:
        return 0
    else:
        return 1
@login_required(login_url="/login")
def fe_users(request):
    current_url = resolve(request.path_info).url_name
    user_id = request.user.id
    page_check = permision_check(current_url,user_id)
    if page_check == False:
        return render(request,'404.html')
    bay_role = Bay_roles.objects.get(id=10)
    fe_list = Bay_users.objects.filter(role=bay_role).order_by('-id')
    user_id = request.GET.get("id")
    if user_id:
        edit_data = Bay_users.objects.get(id=user_id)
    else:
        edit_data={}
    
    if request.method == "POST":
        fname = request.POST.get("fname")
        lname = request.POST.get("lname")
        cellnumber = request.POST.get("cellnumber")
        supervisor = request.POST.get("supervisor")
        password = request.POST.get("password")
        email = request.POST.get("email")
        state = request.POST.get("state")
        statelist = request.POST.getlist("state")
        formedit = request.POST.get("form_edit_id")
        # enc_password = pbkdf2_sha256.encrypt(password)
        fe_dataa = Bay_users(fname=fname,lname=lname,state=state,password=password,cell_number=cellnumber,email=email,superviser_id=supervisor)
        fe_dataa.password=make_password(fe_dataa.password)
        if formedit != '':
            exist_email = request.POST.get("check_email")
            check_email = Bay_users.objects.filter(email=email).exclude(email=exist_email)
            if check_email:
                messages.error(request, " Email already register")
                return redirect('fe_users')
            if Enquiry(statelist):
                Bay_users.objects.filter(id=formedit).update(fname=fname,lname=lname,state=state,cell_number=cellnumber,email=email,superviser_id=supervisor)
                u = Bay_users.objects.get(pk=formedit)
                messages.success(request, " Your details has been updated successfully")
                return redirect('fe_users')
            else:
                edit_data = fe_dataa
                messages.error(request, " Please fill all the required fields")
        else:
            check_email = Bay_users.objects.filter(email=email)
            if check_email:
                messages.error(request, " Email already register")
                return redirect('fe_users')

            if Enquiry(statelist):
                fe_dataa.save()
                new_act_id = Bay_users.objects.latest('id').id
                new_act_id = Bay_users.objects.get(id=new_act_id)
                params = {'email':email, 'password':password}
                sendfe_mail(params, 'fe_user.html', 'New fielder added - '+fname+' '+lname)
                messages.success(request, " Your details has been added successfully")
                return redirect('fe_users')
            else:
                edit_data = fe_dataa
                messages.error(request, " Please fill all the required fields")
        
        

    params={'fe_list':fe_list,"edit_data":edit_data}
    return render(request,'fe_users.html',params)