from django import forms

from django.contrib.auth.models import User
from activity.models import Activity_tasks, Task_media, Task_remark
from activity.templatetags.myfilters import *
#from bootstrap_datepicker_plus.widgets import DatePickerInput

status_choice = invoicing_status_list()
class DateInput(forms.DateInput):
    input_type = 'date'    
class TaskForm(forms.ModelForm):
    start_date = forms.DateField(widget=forms.DateInput(attrs={"class": "form-control", 'readonly':True, 'style':"background-color:#e9e9e9;"},format='%m-%d-%Y'), label="Date", input_formats=['%Y-%m-%d', '%m-%d-%Y'], required=False)
    complete_date = forms.DateField(widget=forms.DateInput(attrs={"class": "form-control", 'readonly':True, 'style':"background-color:#e9e9e9;"},format='%m-%d-%Y'), label="Date", input_formats=['%Y-%m-%d', '%m-%d-%Y'], required=False)
    status =  forms.ChoiceField(choices = status_choice,widget=forms.Select(attrs={'class':'form-control'}), required=False)
    footage = forms.IntegerField(widget=forms.NumberInput(attrs={"class": "form-control", 'title':'Total Footage'}), required=False)
    activity_id = forms.CharField(widget=forms.HiddenInput())
    added_by_id = forms.CharField(widget=forms.HiddenInput())
    class Meta:
        model = Activity_tasks
        fields = "__all__"

class TaskmediaForm(forms.ModelForm):
    
    #media = forms.ImageField()
    media = forms.ImageField(widget=forms.ClearableFileInput(attrs={"class": "form-control", "style":"padding: 0.15rem 0.75rem;", "multiple":True}))
    #media = forms.IntegerField(widget=forms.NumberInput(attrs={"class": "form-control", 'title':'Total Footage', 'style':"padding: 0.15rem 0.75rem;"}), required=False)
    class Meta:
        model = Task_media
        fields = "__all__"

class TaskcommentForm(forms.ModelForm):
    remark = forms.CharField(widget=forms.Textarea(attrs={"class": "form-control", 'title':'Total Footage', "rows":5, "title":"Remarks"}), required=False)
    class Meta:
        model = Task_remark
        fields = "__all__"