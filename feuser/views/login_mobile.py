# from activity.views.import_data import *
from activity.views.import_data import *
# from activity.views.page_permission import *

# @login_required(login_url="/login")
# 

def feindex(request):
    return redirect('login_mobile')


def login_mobile(request):
    if request.method=="POST":
        # Get the post parameters
        email=request.POST['email']
        password=request.POST['password']
        bay_role = Bay_roles.objects.get(id=10)
        user=authenticate(email= email, password= password, is_active=True)
        if user and (user.role.id == bay_role.id):
            login(request, user)
            messages.success(request, "Successfully Logged In")
            return redirect("my_activity")
        else:
            messages.error(request, "Invalid credentials! Please try again")
            return redirect("login_mobile")
    elif request.user.is_authenticated:
        return redirect("my_activity")
    else:
        params = {'redirect_page': request.GET.get("next", "off")}
        return render(request,'feuser/login_mobile.html')
        
        
        

