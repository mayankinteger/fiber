# from activity.views.import_data import *
from activity.views.import_data import *
# from activity.views.page_permission import *

# @login_required(login_url="/login")
def activity_media(request):
    return render(request, 'feuser/activity_media.html')
        
        
        

