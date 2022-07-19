from distutils.command.upload import upload
from django.db import models
from django.utils.timezone import now
from django.utils import timezone
from django.utils.translation import gettext_lazy as _
from .managers import Bay_usersManager
from django.contrib.auth.models import User, AbstractUser, AbstractBaseUser, PermissionsMixin

# Create your models here.
class Bay_roles(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    page_role_column = models.CharField(max_length=100, blank=True, null=True)
    orderby = models.IntegerField(blank=True, null=True)

    def __str__(self):
        return self.name

class Bay_users(AbstractBaseUser, PermissionsMixin):
    id = models.AutoField(primary_key=True)
    title = models.IntegerField(default=1)
    fname = models.CharField(max_length=100, blank=True, null=True)
    lname = models.CharField(max_length=100, blank=True, null=True)
    emp_id = models.CharField(max_length=100, blank=True, null=True)
    cell_number = models.CharField(max_length=20, blank=True, null=True)
    #email = models.EmailField(max_length=50)
    email = models.EmailField(_('email address'), unique=True)
    is_staff = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    date_joined = models.DateTimeField(default=timezone.now)
    department = models.IntegerField(blank=True, null=True)
    job_location = models.CharField(max_length=225, blank=True, null=True)
    pan = models.CharField(max_length=225, blank=True, null=True)
    password = models.CharField(max_length=225)
    otp = models.CharField(max_length=10, blank=True, null=True)
    #is_active = models.IntegerField(default=0)
    company_id = models.IntegerField(blank=True, null=True)
    role = models.ForeignKey(Bay_roles, on_delete=models.CASCADE, blank=True, null=True)
    job_title_id = models.IntegerField(blank=True, null=True)
    spouse_name = models.CharField(max_length=225, blank=True, null=True)
    lead_id = models.IntegerField(blank=True, null=True)
    if_lead = models.IntegerField(blank=True, null=True)
    asc_lead_percent = models.FloatField(blank=True, null=True)
    asc_lead_id = models.IntegerField(blank=True, null=True)
    if_asc_lead = models.IntegerField(blank=True, null=True)
    by_admin_ban = models.IntegerField(blank=True, null=True)
    self_recru = models.FloatField(blank=True, null=True)
    team_recru = models.FloatField(blank=True, null=True)
    hourly_payroll = models.CharField(max_length=225, blank=True, null=True)
    basic = models.CharField(max_length=225, blank=True, null=True)
    hra = models.CharField(max_length=225, blank=True, null=True)
    da = models.CharField(max_length=225, blank=True, null=True)
    state = models.CharField(max_length=225, blank=True, null=True)
    sub_group_name = models.IntegerField(blank=True, null=True)
    aadhar_number = models.CharField(max_length=20, blank=True, null=True)
    ssn = models.CharField(max_length=11, blank=True, null=True)
    driving_licence = models.CharField(max_length=20, blank=True, null=True)
    dl_expiry = models.DateField(blank=True, null=True)
    state_of_issue = models.CharField(max_length=50, blank=True, null=True)
    marital_status = models.IntegerField(blank=True, null=True)
    address = models.TextField(blank=True, null=True)
    p_address = models.CharField(max_length=225, blank=True, null=True)
    r_zip = models.IntegerField(blank=True, null=True)
    p_zip = models.IntegerField(blank=True, null=True)
    personal_mobile = models.CharField(max_length=20, blank=True, null=True)
    personal_email = models.EmailField(max_length=50, blank=True, null=True)
    reporting_office = models.CharField(max_length=225, blank=True, null=True)
    job_country = models.IntegerField(blank=True, null=True)
    emg_name = models.CharField(max_length=225, blank=True, null=True)
    emg_number = models.CharField(max_length=225, blank=True, null=True)
    emg_relation = models.IntegerField(blank=True, null=True)
    linkedin = models.TextField(blank=True, null=True)
    blog = models.TextField(blank=True, null=True)
    pic = models.ImageField(upload_to='pics', blank=True, null=True)
    date_of_joining = models.DateField(blank=True, null=True)
    probation_till = models.DateField(blank=True, null=True)
    dt_resign = models.DateField(blank=True, null=True)
    account_number = models.CharField(max_length=20, blank=True, null=True)
    medical_vali = models.CharField(max_length=20, blank=True, null=True)
    medical_amount = models.CharField(max_length=20, blank=True, null=True)
    term_vali = models.CharField(max_length=20, blank=True, null=True)
    term_amount = models.CharField(max_length=20, blank=True, null=True)
    company = models.IntegerField(blank=True, null=True)
    login_token = models.CharField(max_length=225, blank=True, null=True)
    secret_code = models.CharField(max_length=100, blank=True, null=True)
    otp_code = models.IntegerField(blank=True, null=True)
    superviser_id = models.IntegerField(blank=True, null=True)
    added_date = models.DateField(auto_now_add=True)
    timestamp=models.DateTimeField(default=timezone.now)
    USERNAME_FIELD = 'email'
    REQUIRED_FIELD = []

    objects = Bay_usersManager()

    def __str__(self):
        return self.email

class Fe_users(models.Model):
    id = models.AutoField(primary_key=True)
    fname = models.CharField(max_length=100, blank=True, null=True)
    lname = models.CharField(max_length=100, blank=True, null=True)
    cell_number = models.CharField(max_length=20, blank=True, null=True)
    email = models.EmailField(max_length=50)
    password = models.CharField(max_length=225)
    client = models.IntegerField(blank=True, null=True)
    added_date = models.DateField(auto_now_add=True, null=True)
    is_active = models.IntegerField(default=0)
    company_id = models.IntegerField(blank=True, null=True)
    superviser_id = models.IntegerField(blank=True, null=True)
    role = models.IntegerField(default=0)
    by_admin_ban = models.IntegerField(blank=True, null=True)
    state = models.CharField(max_length=225, blank=True, null=True)
    web_email = models.EmailField(max_length=50, blank=True, null=True)
    web_password = models.CharField(max_length=225, blank=True, null=True)
    forgot_password_status = models.IntegerField(blank=True, null=True)
    token = models.CharField(max_length=225, blank=True, null=True)
    timestamp=models.DateTimeField(default=timezone.now)

    def __str__(self):
        return self.email
    
class Clients(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name

class Activities(models.Model):
    FIELDING = 1
    PLANNING = 2
    DRAFTING = 3
    QCJob = 4
    RESEARCH = 5
    TYPE_CHOICES = (
        (FIELDING, 'Fielding'),
        (PLANNING, 'Planning'),
        (DRAFTING, 'Drafting'),
        (QCJob, 'QC Job'),
        (RESEARCH, 'Research'),
    )
    id = models.PositiveSmallIntegerField(choices=TYPE_CHOICES, primary_key=True)

    def __str__(self):
        return self.get_id_display()

class Activity(models.Model):
    id = models.AutoField(primary_key=True)
    ticket = models.CharField(max_length=100, blank=True, null=True)
    client_ticket = models.CharField(max_length=100, blank=True, null=True)
    rec_date = models.DateField(blank=True, null=True)
    ecd = models.DateField(blank=True, null=True, help_text='Date of ecd')
    revised_ecd = models.DateField(blank=True, null=True)
    client_id = models.ForeignKey(Clients, on_delete=models.CASCADE, blank=True, null=True)
    market = models.IntegerField(default=0)
    ewo = models.CharField(max_length=225, blank=True, null=True)
    da = models.CharField(max_length=20, blank=True, null=True)
    lus = models.CharField(max_length=20, blank=True, null=True)
    wire_center = models.TextField(blank=True, null=True)
    pfp = models.TextField(blank=True, null=True)
    latitude = models.CharField(max_length=50, blank=True, null=True)
    longitude = models.CharField(max_length=50, blank=True, null=True)
    job_type = models.CharField(max_length=50, blank=True, null=True)
    job_no = models.CharField(max_length=50, blank=True, null=True)
    f1cfas = models.CharField(max_length=20, blank=True, null=True)
    f1job_no = models.CharField(max_length=20, blank=True, null=True)
    f1_sow = models.TextField(blank=True, null=True)
    f2cfas = models.CharField(max_length=20, blank=True, null=True)
    f2job_no = models.CharField(max_length=20, blank=True, null=True)
    f2_sow = models.TextField(blank=True, null=True)
    notes = models.TextField(blank=True, null=True)
    activity = models.ManyToManyField(Activities)
    assign_fielder = models.ForeignKey(Bay_users, related_name='assign_fielder', on_delete=models.CASCADE, blank=True, null=True)
    assign_int_eng = models.ForeignKey(Bay_users, related_name='assign_int_eng', on_delete=models.CASCADE, blank=True, null=True)
    int_eng2 = models.ForeignKey(Bay_users, related_name='int_eng2', on_delete=models.CASCADE, blank=True, null=True)
    lead_eng = models.ForeignKey(Bay_users, related_name='lead_eng', on_delete=models.CASCADE, blank=True, null=True)
    work_print = models.CharField(max_length=20, blank=True, null=True)
    footage = models.CharField(max_length=20, blank=True, null=True)
    appr_footage = models.CharField(max_length=20, blank=True, null=True)
    terminal = models.CharField(max_length=20, blank=True, null=True)
    added_by = models.ForeignKey(Bay_users, related_name='added_by', on_delete=models.CASCADE, blank=True, null=True)
    added_date = models.DateField(auto_now_add=True)
    timestamp=models.DateTimeField(default=timezone.now)
    cmplt_date = models.DateField(blank=True, null=True)
    fielder_ecd = models.DateField(blank=True, null=True)
    fielding_start_date = models.DateField(blank=True, null=True)

    def __str__(self):
        return self.ticket

class Activity_media(models.Model):
    id = models.AutoField(primary_key=True)
    activity_id = models.ForeignKey(Activity, on_delete=models.CASCADE, blank=True, null=True)
    file_name = models.FileField(upload_to='activity/')
    file_type = models.TextField()
    media_name = models.CharField(max_length=50, blank=True, null=True)
    caption = models.TextField(blank=True, null=True)
    added_by = models.ForeignKey(Bay_users, on_delete=models.CASCADE, blank=True, null=True)
    added_date = models.DateField(auto_now_add=True)
    timestamp=models.DateTimeField(default=timezone.now)

    def __str__(self):
        return str(self.file_name)

    def delete(self, *args, **kwargs):
        self.file_name.delete()
        super().delete(*args, **kwargs)

class Mail_settings(models.Model):
    id = models.AutoField(primary_key=True)
    protocol = models.CharField(max_length=90, blank=True, null=True)
    host = models.CharField(max_length=90, blank=True, null=True)
    port = models.CharField(max_length=90, blank=True, null=True)
    user = models.CharField(max_length=90, blank=True, null=True)
    passw = models.CharField(max_length=90, blank=True, null=True)
    from_data = models.CharField(max_length=90, blank=True, null=True)
    reply_to = models.CharField(max_length=90, blank=True, null=True)
    name = models.CharField(max_length=90, blank=True, null=True)
    priority = models.IntegerField(blank=True, null=True)

    def __str__(self):
        return self.from_data

class Logins(models.Model):
    id = models.AutoField(primary_key=True)
    user_id = models.ForeignKey(Bay_users, on_delete=models.CASCADE, blank=True, null=True)
    ip = models.CharField(max_length=50, blank=True, null=True)
    login_time = models.DateTimeField(auto_now_add=True, blank=True, null=True)
    logout_time = models.DateTimeField(auto_now_add=True, blank=True, null=True)
    is_login = models.IntegerField(default=1)
    role = models.IntegerField(blank=True, null=True)
    added_date = models.DateTimeField(auto_now_add=True)
    latitude = models.TextField(blank=True, null=True)
    longitude = models.TextField(blank=True, null=True)
    ip_details = models.TextField(blank=True, null=True)

    def __str__(self):
        return self.user_id

class Subtasks(models.Model):
    id = models.AutoField(primary_key=True)
    task_id = models.IntegerField()
    subtask = models.CharField(max_length=100, blank=True, null=True)
    is_active = models.IntegerField(default=1)

    def __str__(self):
        return self.subtask

class Task_status(models.Model):
    id = models.AutoField(primary_key=True)
    task_id = models.IntegerField()
    status = models.CharField(max_length=100, blank=True, null=True)

    def __str__(self):
        return self.status

class Activity_tasks(models.Model):
    id = models.AutoField(primary_key=True)
    activity_id = models.ForeignKey(Activity, on_delete=models.CASCADE, blank=True, null=True)
    task = models.IntegerField()
    subtask = models.ForeignKey(Subtasks, on_delete=models.CASCADE, blank=True, null=True)
    start_date = models.DateField(blank=True, null=True)
    complete_date = models.DateField(blank=True, null=True)
    status = models.IntegerField()
    assigned_to = models.ForeignKey(Bay_users, related_name='assigned_to', on_delete=models.CASCADE, blank=True, null=True)
    added_by = models.ForeignKey(Bay_users, on_delete=models.CASCADE, blank=True, null=True)
    added_date = models.DateField(auto_now_add=True)

    def __str__(self):
        return str(self.id)

class Task_media(models.Model):
    id = models.AutoField(primary_key=True)
    task_id = models.ForeignKey(Activity_tasks, on_delete=models.CASCADE, blank=True, null=True)
    media = models.FileField(upload_to='task_media/')
    added_by = models.ForeignKey(Bay_users, on_delete=models.CASCADE, blank=True, null=True)
    added_date = models.DateField(auto_now_add=True)

    def __str__(self):
        return str(self.task_id)

    def delete(self, *args, **kwargs):
        self.media.delete()
        super().delete(*args, **kwargs)

class Task_remark(models.Model):
    id = models.AutoField(primary_key=True)
    task_id = models.ForeignKey(Activity_tasks, on_delete=models.CASCADE, blank=True, null=True)
    remark = models.TextField(blank=True, null=True)
    added_by = models.ForeignKey(Bay_users, on_delete=models.CASCADE, blank=True, null=True)
    added_date = models.DateField(auto_now_add=True)

    def __str__(self):
        return str(self.task_id)

class Task_detail(models.Model):
    id = models.AutoField(primary_key=True)
    activity = models.ForeignKey(Activity, related_name='task_detail_activity_id', on_delete=models.CASCADE, blank=True, null=True)
    task_id = models.IntegerField()
    qa_eng = models.ForeignKey(Bay_users, related_name='task_detail_qa_eng', on_delete=models.CASCADE, blank=True, null=True)
    qp_eng = models.ForeignKey(Bay_users, related_name='task_detail_qp_eng', on_delete=models.CASCADE, blank=True, null=True)
    qa_rating = models.IntegerField(blank=True, null=True)
    doer = models.ForeignKey(Bay_users, related_name='task_detail_doer', on_delete=models.CASCADE, blank=True, null=True)
    qc_eng_1 = models.ForeignKey(Bay_users, related_name='task_detail_qc_eng_1', on_delete=models.CASCADE, blank=True, null=True)
    qc_eng_2 = models.ForeignKey(Bay_users, related_name='task_detail_qc_eng_2', on_delete=models.CASCADE, blank=True, null=True)
    start_date = models.DateField(blank=True, null=True)
    complete_date = models.DateField(blank=True, null=True)
    status = models.ForeignKey(Task_status, related_name='task_detail_status', on_delete=models.CASCADE, blank=True, null=True)
    internal_qc_rating = models.IntegerField(blank=True, null=True)
    external_qc_rating = models.IntegerField(blank=True, null=True)
    att_qc_rating = models.IntegerField(blank=True, null=True)

    def __str__(self):
        return str(self.id)

class Page_role(models.Model):
    id = models.AutoField(primary_key=True)
    pages = models.CharField(max_length=225)
    order_number = models.IntegerField(default=0)
    admin = models.IntegerField(default=0)
    sales = models.IntegerField(default=0)
    customer_service = models.IntegerField(default=0)
    operations = models.IntegerField(default=0)
    production = models.IntegerField(default=0)
    r_n_d = models.IntegerField(default=0)
    hr = models.IntegerField(default=0)
    account = models.IntegerField(default=0)
    marketing = models.IntegerField(default=0)
    logistics = models.IntegerField(default=0)
    management = models.IntegerField(default=0)

    def __str__(self):
        return str(self.pages)