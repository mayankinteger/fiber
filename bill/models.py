from distutils.command.upload import upload
from django.db import models
from django.utils.timezone import now
from django.utils import timezone
from django.utils.translation import gettext_lazy as _
from activity.models import *


class Bill(models.Model):
    id = models.AutoField(primary_key=True)
    activity = models.ForeignKey(Activity, on_delete=models.CASCADE, blank=True, null=True)
    job_status = models.IntegerField(default=0)
    bucket = models.IntegerField(default=0)
    drafting_week = models.DateField(blank=True, null=True)
    fielder_sub_date = models.DateField(blank=True, null=True)
    design_sub_date = models.DateField(blank=True, null=True)
    field_correct_sub_date = models.DateField(blank=True, null=True)
    design_correct_sub_date = models.DateField(blank=True, null=True)
    invoicing_status_field = models.IntegerField(default=0)
    invoicing_status_design = models.IntegerField(default=0)
    invoicing_remark = models.TextField(blank=True, null=True)
    added_by = models.ForeignKey(Bay_users, related_name='billadded_by', on_delete=models.CASCADE, blank=True, null=True)
    added_date = models.DateField(auto_now_add=True)
    timestamp=models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return str(self.id)