from activity.views.import_data import *

def index(request):
    return redirect('handleLogin')


def handleLogin(request):
    if request.method=="POST":
        # Get the post parameters
        email=request.POST['email']
        password=request.POST['password']
        user=authenticate(email= email, password= password, is_active=True)
        if user is not None:
            login(request, user)
            messages.success(request, "Successfully Logged In")
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
