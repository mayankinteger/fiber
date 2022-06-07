from django import forms

from django.contrib.auth.models import User
from bill.models import Bill as Create_Bill
from activity.models import Bay_users, Fe_users
from activity.templatetags.myfilters import *
#from bootstrap_datepicker_plus.widgets import DatePickerInput

users = Fe_users.objects.order_by('fname')
user = tuple((n.id,str(n.fname)+' '+str(n.lname)) for n in users)
user = list(user)
add_tuple = ('','--Select--')
user.insert(0, add_tuple)
Fielder_choice = user
Market= market_list()
Invoicing_status = invoicing_status_list()
Bucket_choices = bucket_list()
Job_status = job_status_list()
class DateInput(forms.DateInput):
    input_type = 'date'    
class BillForm(forms.ModelForm):
    job_status = forms.ChoiceField(choices = Job_status,widget=forms.Select(attrs={'class':'form-control'}), required=False)
    drafting_week = forms.DateField(widget=forms.DateInput(attrs={"class": "form-control custom_datepicker", "data-provide": "datepicker","data-date-autoclose":"true"},format='%m-%d-%Y'), label="Date", input_formats=['%Y-%m-%d', '%m-%d-%Y'], required=False)
    bucket = forms.ChoiceField(choices = Bucket_choices,widget=forms.Select(attrs={'class':'form-control'}), required=False)
    fielder_name = forms.ChoiceField(choices = Fielder_choice,widget=forms.Select(attrs={'class':'form-control'}), required=False)
    fielder_ecd = forms.DateField(widget=forms.DateInput(attrs={"class": "form-control custom_datepicker", "data-provide": "datepicker","data-date-autoclose":"true"},format='%m-%d-%Y'), label="Date", input_formats=['%Y-%m-%d', '%m-%d-%Y'], required=False)
    fielder_sub_date = forms.DateField(widget=forms.DateInput(attrs={"class": "form-control custom_datepicker", "data-provide": "datepicker","data-date-autoclose":"true"},format='%m-%d-%Y'), label="Date", input_formats=['%Y-%m-%d', '%m-%d-%Y'], required=False)
    design_sub_date = forms.DateField(widget=forms.DateInput(attrs={"class": "form-control custom_datepicker", "data-provide": "datepicker","data-date-autoclose":"true"},format='%m-%d-%Y'), label="Date", input_formats=['%Y-%m-%d', '%m-%d-%Y'], required=False)
    field_correct_sub_date = forms.DateField(widget=forms.DateInput(attrs={"class": "form-control custom_datepicker", "data-provide": "datepicker","data-date-autoclose":"true"},format='%m-%d-%Y'), label="Date", input_formats=['%Y-%m-%d', '%m-%d-%Y'], required=False)
    #field_correct_sub_date = forms.DateField(widget=DateInput(attrs={"class": "form-control"}), label="Date", input_formats=['%Y-%m-%d'], required=False)
    design_correct_sub_date = forms.DateField(widget=forms.DateInput(attrs={"class": "form-control custom_datepicker", "data-provide": "datepicker","data-date-autoclose":"true"},format='%m-%d-%Y'), label="Date", input_formats=['%Y-%m-%d', '%m-%d-%Y'], required=False)
    app_footage = forms.IntegerField(widget=forms.NumberInput(attrs={"class": "form-control"}), required=False)
    invoicing_status_field =  forms.ChoiceField(choices = Invoicing_status,widget=forms.Select(attrs={'class':'form-control'}), required=False)
    invoicing_remark = forms.CharField(widget=forms.Textarea(attrs={"placeholder": "Invoicing Remark", "rows":'2', "class": "form-control"}), required=False)
    invoicing_status_design =  forms.ChoiceField(choices = Invoicing_status,widget=forms.Select(attrs={'class':'form-control'}), required=False)
    complete_date = forms.DateField(widget=forms.DateInput(attrs={"class": "form-control custom_datepicker", "data-provide": "datepicker","data-date-autoclose":"true"},format='%m-%d-%Y'), label="Date", input_formats=['%Y-%m-%d', '%m-%d-%Y'], required=False)
    activity_id = forms.CharField(widget=forms.HiddenInput())
    added_by_id = forms.CharField(widget=forms.HiddenInput())
    class Meta:
        model = Create_Bill
        fields = "__all__"