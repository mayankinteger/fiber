from django import forms

from django.contrib.auth.models import User
from activity.models import Activity_tasks, Task_media, Task_remark
from activity.templatetags.myfilters import *
#from bootstrap_datepicker_plus.widgets import DatePickerInput

status_choice = invoicing_status_list()
wireline_role = Bay_roles.objects.get(pk=5)
doers = Bay_users.objects.filter(role=wireline_role).order_by('fname')
doer = tuple((n.id,str(n.fname)+' '+str(n.lname)) for n in doers)
doer = list(doer)
add_tuple = (0,'')
doer.insert(0, add_tuple)
Doer_choice = doer
percentage = tuple((n,n) for n in range(0,101))
Percentage = list(percentage)
class DateInput(forms.DateInput):
    input_type = 'date'
class TaskForm(forms.ModelForm):
    def __init__(self,**kwargs):
        super(TaskForm, self).__init__(**kwargs)
        self.status_data = Task_status.objects.filter(task_id=kwargs['initial']['task'])
        self.task_status = tuple((n.id,str(n.status)) for n in self.status_data)
        self.task_status = list(self.task_status)
        add_tuple = (0,'')
        self.task_status.insert(0, add_tuple)
        if self.status_data:
            self.fields['status'] = forms.ChoiceField(choices = self.task_status,widget=forms.Select(attrs={'class':'form-control'}))

    doer = forms.ChoiceField(choices = Doer_choice,widget=forms.Select(attrs={'class':'form-control'}))
    qc1 = forms.ChoiceField(choices = Doer_choice,widget=forms.Select(attrs={'class':'form-control'}))
    qc2 = forms.ChoiceField(choices = Doer_choice,widget=forms.Select(attrs={'class':'form-control'}))
    internal_qc = forms.ChoiceField(choices = Percentage,widget=forms.Select(attrs={'class':'form-control'}))
    external_qc = forms.ChoiceField(choices = Percentage,widget=forms.Select(attrs={'class':'form-control'}))
    att_qc = forms.ChoiceField(choices = Percentage,widget=forms.Select(attrs={'class':'form-control'}))
    start_date = forms.DateField(widget=forms.DateInput(attrs={"class": "form-control custom_datepicker", "data-provide": "datepicker","data-date-autoclose":"true"},format='%m-%d-%Y'), label="Date", input_formats=['%Y-%m-%d', '%m-%d-%Y'])
    complete_date = forms.DateField(widget=forms.DateInput(attrs={"class": "form-control custom_datepicker", "data-provide": "datepicker","data-date-autoclose":"true"},format='%m-%d-%Y'), label="Date", input_formats=['%Y-%m-%d', '%m-%d-%Y'])
    complete_date = forms.DateField(widget=forms.DateInput(attrs={"class": "form-control custom_datepicker", "data-provide": "datepicker","data-date-autoclose":"true"},format='%m-%d-%Y'), label="Date", input_formats=['%Y-%m-%d', '%m-%d-%Y'])
    permit_assign = forms.DateField(widget=forms.DateInput(attrs={"class": "form-control custom_datepicker", "data-provide": "datepicker","data-date-autoclose":"true"},format='%m-%d-%Y'), label="Date", input_formats=['%Y-%m-%d', '%m-%d-%Y'])
    permit_submission = forms.DateField(widget=forms.DateInput(attrs={"class": "form-control custom_datepicker", "data-provide": "datepicker","data-date-autoclose":"true"},format='%m-%d-%Y'), label="Date", input_formats=['%Y-%m-%d', '%m-%d-%Y'])
    #status =  forms.ChoiceField(choices = status_choice,widget=forms.Select(attrs={'class':'form-control'}))
    task = forms.CharField(widget=forms.HiddenInput())
    #footage = forms.IntegerField(widget=forms.NumberInput(attrs={"class": "form-control", 'title':'Total Footage'}), required=False)
    subtask_id = forms.CharField(widget=forms.HiddenInput(), required=False)
    activity_id_id = forms.CharField(widget=forms.HiddenInput(), required=False)
    added_by_id = forms.CharField(widget=forms.HiddenInput())
    class Meta:
        model = Activity_tasks
        fields = "__all__"

class TaskmediaForm(forms.ModelForm):
    #media = forms.ImageField(widget=forms.ClearableFileInput(attrs={"class": "form-control", "style":"padding: 0.15rem 0.75rem;", "multiple":True}))
    media = forms.FileField(widget=forms.ClearableFileInput(attrs={"class": "form-control", "style":"padding: 0rem 0.75rem;"}))
    task_id_id = forms.CharField(widget=forms.HiddenInput(), required=False)
    added_by_id = forms.CharField(widget=forms.HiddenInput(), required=False)

    class Meta:
        model = Task_media
        fields = "__all__"

class TaskcommentForm(forms.ModelForm):
    remark = forms.CharField(widget=forms.Textarea(attrs={"class": "form-control", 'title':'Total Footage', "rows":5, "title":"Remarks"}))
    task_id_id = forms.CharField(widget=forms.HiddenInput(), required=False)
    added_by_id = forms.CharField(widget=forms.HiddenInput(), required=False)
    class Meta:
        model = Task_remark
        fields = "__all__"