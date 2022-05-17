from activity.views.import_data import *

def handleLogout(request):
    logout(request)
    #messages.success(request, "Successfully logged out")
    return redirect('handleLogin')