from activity.views.import_data import *

def index(request):
    return redirect('handleLogin')

def handleLogin(request):
    if request.method=="POST":
        # Get the post parameters
        email=request.POST['email']
        password=request.POST['password']
        bay_role = Bay_roles.objects.get(id=10)
        user=authenticate(email= email, password= password, is_active=True)
        if user:
            login(request, user)
            messages.success(request, "Successfully Logged In")
            if user.role.id == bay_role.id:
                return redirect("feindex")
            else:
                if request.POST.get("redir_page") != '':
                    return redirect(request.POST.get("redir_page"))
                else:
                    return redirect("activity_list")
        else:
            messages.error(request, "Invalid credentials! Please try again")
            return redirect("handleLogin")
    elif request.user.is_authenticated:
        return redirect("activity_list")
    else:
        #return render(request, 'login.html')
        params = {'redirect_page': request.GET.get("next", "off")}
        return render(request, "login.html")