from django import forms

from django.contrib.auth.models import User
from activity.models import Activity_tasks, Task_media, Task_remark
from activity.templatetags.myfilters import *
#from bootstrap_datepicker_plus.widgets import DatePickerInput

status_choice = invoicing_status_list()
wireline_role = Bay_roles.objects.get(pk=5)
doers = Bay_users.objects.filter(role=wireline_role,is_active=True).order_by('fname')
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
    def __init__(self, *args,**kwargs):
        super(TaskForm, self).__init__(*args, **kwargs)
        if kwargs:
            self.status_data = Task_status.objects.filter(task_id=kwargs['initial']['task_id'])
            self.task_status = tuple((n.id,str(n.status)) for n in self.status_data)
            self.task_status = list(self.task_status)
            add_tuple = (0,'')
            self.task_status.insert(0, add_tuple)
            self.fields['status'] = forms.ChoiceField(choices = self.task_status,widget=forms.Select(attrs={'class':'form-control'}), required=False)

    qa_eng = forms.ChoiceField(choices = Doer_choice,widget=forms.Select(attrs={'class':'form-control'}), required=False)
    qa_eng_old = forms.ChoiceField(choices = Doer_choice,widget=forms.Select(attrs={'class':'form-control'}), required=False)
    qp_eng = forms.ChoiceField(choices = Doer_choice,widget=forms.Select(attrs={'class':'form-control'}), required=False)
    qp_eng_old = forms.ChoiceField(choices = Doer_choice,widget=forms.Select(attrs={'class':'form-control'}), required=False)
    qa_rating = forms.ChoiceField(choices = Percentage,widget=forms.Select(attrs={'class':'form-control'}), required=False)
    doer = forms.ChoiceField(choices = Doer_choice,widget=forms.Select(attrs={'class':'form-control'}), required=False)
    doer_old = forms.ChoiceField(choices = Doer_choice,widget=forms.Select(attrs={'class':'form-control'}), required=False)
    qc_eng_1 = forms.ChoiceField(choices = Doer_choice,widget=forms.Select(attrs={'class':'form-control'}), required=False)
    qc_eng_1_old = forms.ChoiceField(choices = Doer_choice,widget=forms.Select(attrs={'class':'form-control'}), required=False)
    qc_eng_2 = forms.ChoiceField(choices = Doer_choice,widget=forms.Select(attrs={'class':'form-control'}), required=False)
    qc_eng_2_old = forms.ChoiceField(choices = Doer_choice,widget=forms.Select(attrs={'class':'form-control'}), required=False)
    internal_qc_rating = forms.ChoiceField(choices = Percentage,widget=forms.Select(attrs={'class':'form-control'}), required=False)
    external_qc_rating = forms.ChoiceField(choices = Percentage,widget=forms.Select(attrs={'class':'form-control'}), required=False)
    att_qc_rating = forms.ChoiceField(choices = Percentage,widget=forms.Select(attrs={'class':'form-control'}), required=False)
    start_date = forms.DateField(widget=forms.DateInput(attrs={"class": "form-control custom_datepicker", 'style': 'background-color: #e5e1e1;', "data-provide": "datepicker","data-date-autoclose":"true"},format='%m-%d-%Y'), label="Date", input_formats=['%Y-%m-%d', '%m-%d-%Y'], required=False, disabled=True)
    complete_date = forms.DateField(widget=forms.DateInput(attrs={"class": "form-control custom_datepicker", 'style': 'background-color: #e5e1e1;', "data-provide": "datepicker","data-date-autoclose":"true"},format='%m-%d-%Y'), label="Date", input_formats=['%Y-%m-%d', '%m-%d-%Y'], required=False, disabled=True)
    #permit_assign = forms.DateField(widget=forms.DateInput(attrs={"class": "form-control custom_datepicker", "data-provide": "datepicker","data-date-autoclose":"true"},format='%m-%d-%Y'), label="Date", input_formats=['%Y-%m-%d', '%m-%d-%Y'])
    #permit_submission = forms.DateField(widget=forms.DateInput(attrs={"class": "form-control custom_datepicker", "data-provide": "datepicker","data-date-autoclose":"true"},format='%m-%d-%Y'), label="Date", input_formats=['%Y-%m-%d', '%m-%d-%Y'])
    task_id = forms.CharField(widget=forms.HiddenInput())
    activity_id_id = forms.CharField(widget=forms.HiddenInput(), required=False)
    #subtask_id = forms.CharField(widget=forms.HiddenInput(), required=False)
    #added_by_id = forms.CharField(widget=forms.HiddenInput())
    class Meta:
        model = Task_detail
        #fields = "__all__"
        exclude = ['qa_eng', 'qp_eng', 'doer', 'status', 'qc_eng_1', 'qc_eng_2']

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