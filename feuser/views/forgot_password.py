
from activity.views.import_data import *

def send_mail(mydata, page, subject):
    mail_setting = Mail_settings.objects.get(priority=2)
    html_content = render_to_string("email/"+page, mydata)
    text_content = strip_tags(html_content)
    if page == 'fesuer/forgot_password.html':
        receiver = [mydata['email']]
    else:
        receiver = [mydata['email'],'amit@integertel.com']
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

def random_with_N_digits(n):
    range_start = 10**(n-1)
    range_end = (10**n)-1
    return randint(range_start, range_end)

def forgot_password(request):
    if request.method=="POST":
        email = request.POST.get("email")
        print(email)
        try:
            user_data = Bay_users.objects.get(email=email)
        except:
            user_data = ''
        form_edit_id = request.POST.get("form_edit_id")
        #print(user_data)
        # Get the get parameters
        if request.POST.get("form_edit_id") and request.POST.get("form_edit_otp") and user_data:
            password = request.POST.get("password")
            print(password)
            confirm_password = request.POST.get("confirm_password")
            print(confirm_password)
            exist_otp = request.POST.get("exist_otp")
            print(exist_otp)
            if password!=confirm_password:
                messages.error(request, "Password not matching !")
                #return redirect('/reset_password?email='+email+'&&id='+str(user_data.id)+'&&otp=yes')
                params = {'email':email, 'id':user_data.id, 'otp':exist_otp}
                return render(request, 'feuser/forgot_password.html', params)
            try:
                check_user = Bay_users.objects.get(email=email, otp=exist_otp)
                print(check_user)
            except:
                messages.error(request, "Something went wrong! Please try again")
                return redirect('forgot_password')
            user_data.set_password(password)
            print(user_data)
            user_data.save()
            bay_role = Bay_roles.objects.get(id=10)
            user=authenticate(email=email, password=password, otp=exist_otp)
            print(user)
            if user and (user.role.id == bay_role.id):
                login(request, user)
                messages.success(request, "Successfully reset your password and Logged In")
                return redirect("my_activity")
            else:
                messages.error(request, "Invalid credentials Supplied!")
                #return redirect('/reset_password?email='+email+'&&id='+str(user_data.id)+'&&otp=yes')
                params = {'email':email, 'id':user_data.id, 'otp':'yes'}
                return render(request, 'feuser/forgot_password.html', params)
        elif request.POST.get("form_edit_id") and user_data:
            otp_check = request.POST.get("otp")
            if otp_check!=user_data.otp or user_data.email=='':
                messages.error(request, "Invalid OTP Supplied!")
                #return redirect('/reset_password?email='+email+'&&id='+str(user_data.id))
                params = {'email':email, 'id':user_data.id}
                return render(request, 'feuser/forgot_password.html', params)
            else:
                messages.success(request, "Enter your new Password.")
                #return redirect('/reset_password?email='+email+'&&id='+str(user_data.id)+'&&otp=yes')
                params = {'email':email, 'id':user_data.id, 'otp':otp_check}
                return render(request, 'feuser/forgot_password.html', params)
        else:
            if user_data:
                otp = random_with_N_digits(6)
                Bay_users.objects.filter(id=user_data.id).update(otp=otp)
                '''send_mail_reset'''
                params = {'otp':otp, 'email':email}
                send_mail(params, 'forgot_password.html', 'Reset Password')
                messages.success(request, "Your OTP has been sent to your email id.")	
                #return redirect('/reset_password?email='+email+'&&id='+str(user_data.id))
                params = {'email':email, 'id':user_data.id}
                return render(request, 'feuser/forgot_password.html', params)
            messages.error(request, "Invalid Email!")
            return redirect('/forgot_password')
        

    return render(request, "feuser/forgot_password.html")
