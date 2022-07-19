from activity.views.import_data import *

def logout_mobile(request):
    logout(request)
    #messages.success(request, "Successfully logged out")
    return redirect('login_mobile')