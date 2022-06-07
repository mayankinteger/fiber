from django.contrib import admin
from activity.models import Bay_roles, Clients, Bay_users, Fe_users, Activity, Activities, Activity_media, Mail_settings, Logins, Subtasks, Activity_tasks, Task_media, Task_remark, Page_role

# Register your models here.
admin.site.register(Bay_roles)
admin.site.register(Clients)
admin.site.register(Bay_users)
admin.site.register(Fe_users)
admin.site.register(Activity)
admin.site.register(Activities)
admin.site.register(Activity_media)
admin.site.register(Mail_settings)
admin.site.register(Logins)
admin.site.register(Subtasks)
admin.site.register(Activity_tasks)
admin.site.register(Task_media)
admin.site.register(Task_remark)
admin.site.register(Page_role)