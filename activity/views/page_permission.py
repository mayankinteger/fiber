from activity.views.import_data import *

def permision_check(page,user_id):
    user_data = Bay_users.objects.get(pk=user_id)
    role_name = user_data.role.page_role_column
    check = Page_role.objects.filter(pages=page).values(role_name)
    if check[0][role_name]==1:
        return True
    else:
        return False
