# Generated by Django 4.0.3 on 2022-04-14 11:32

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
    ]

    operations = [
        migrations.CreateModel(
            name='Bay_users',
            fields=[
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('is_superuser', models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status')),
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('title', models.IntegerField(default=1)),
                ('fname', models.CharField(blank=True, max_length=100, null=True)),
                ('lname', models.CharField(blank=True, max_length=100, null=True)),
                ('emp_id', models.CharField(blank=True, max_length=100, null=True)),
                ('cell_number', models.CharField(blank=True, max_length=20, null=True)),
                ('email', models.EmailField(max_length=254, unique=True, verbose_name='email address')),
                ('is_staff', models.BooleanField(default=False)),
                ('is_active', models.BooleanField(default=True)),
                ('date_joined', models.DateTimeField(default=django.utils.timezone.now)),
                ('department', models.IntegerField(blank=True, null=True)),
                ('job_location', models.CharField(blank=True, max_length=225, null=True)),
                ('pan', models.CharField(blank=True, max_length=225, null=True)),
                ('password', models.CharField(max_length=225)),
                ('otp', models.CharField(blank=True, max_length=10, null=True)),
                ('company_id', models.IntegerField(blank=True, null=True)),
                ('job_title_id', models.IntegerField(blank=True, null=True)),
                ('spouse_name', models.CharField(blank=True, max_length=225, null=True)),
                ('lead_id', models.IntegerField(blank=True, null=True)),
                ('if_lead', models.IntegerField(blank=True, null=True)),
                ('asc_lead_percent', models.FloatField(blank=True, null=True)),
                ('asc_lead_id', models.IntegerField(blank=True, null=True)),
                ('if_asc_lead', models.IntegerField(blank=True, null=True)),
                ('by_admin_ban', models.IntegerField(blank=True, null=True)),
                ('self_recru', models.FloatField(blank=True, null=True)),
                ('team_recru', models.FloatField(blank=True, null=True)),
                ('hourly_payroll', models.CharField(blank=True, max_length=225, null=True)),
                ('basic', models.CharField(blank=True, max_length=225, null=True)),
                ('hra', models.CharField(blank=True, max_length=225, null=True)),
                ('da', models.CharField(blank=True, max_length=225, null=True)),
                ('state', models.IntegerField(blank=True, null=True)),
                ('sub_group_name', models.IntegerField(blank=True, null=True)),
                ('aadhar_number', models.CharField(blank=True, max_length=20, null=True)),
                ('ssn', models.CharField(blank=True, max_length=11, null=True)),
                ('driving_licence', models.CharField(blank=True, max_length=20, null=True)),
                ('dl_expiry', models.DateField(blank=True, null=True)),
                ('state_of_issue', models.CharField(blank=True, max_length=50, null=True)),
                ('marital_status', models.IntegerField(blank=True, null=True)),
                ('address', models.TextField(blank=True, null=True)),
                ('p_address', models.CharField(blank=True, max_length=225, null=True)),
                ('r_zip', models.IntegerField(blank=True, null=True)),
                ('p_zip', models.IntegerField(blank=True, null=True)),
                ('personal_mobile', models.CharField(blank=True, max_length=20, null=True)),
                ('personal_email', models.EmailField(blank=True, max_length=50, null=True)),
                ('reporting_office', models.CharField(blank=True, max_length=225, null=True)),
                ('job_country', models.IntegerField(blank=True, null=True)),
                ('emg_name', models.CharField(blank=True, max_length=225, null=True)),
                ('emg_number', models.IntegerField(blank=True, null=True)),
                ('linkedin', models.TextField(blank=True, null=True)),
                ('blog', models.TextField(blank=True, null=True)),
                ('pic', models.ImageField(blank=True, null=True, upload_to='pics')),
                ('date_of_joining', models.DateField(blank=True, null=True)),
                ('probation_till', models.DateField(blank=True, null=True)),
                ('dt_resign', models.DateField(blank=True, null=True)),
                ('account_number', models.CharField(blank=True, max_length=20, null=True)),
                ('medical_vali', models.CharField(blank=True, max_length=20, null=True)),
                ('medical_amount', models.CharField(blank=True, max_length=20, null=True)),
                ('term_vali', models.CharField(blank=True, max_length=20, null=True)),
                ('term_amount', models.CharField(blank=True, max_length=20, null=True)),
                ('company', models.IntegerField(blank=True, null=True)),
                ('login_token', models.CharField(blank=True, max_length=225, null=True)),
                ('secret_code', models.CharField(blank=True, max_length=100, null=True)),
                ('otp_code', models.IntegerField(blank=True, null=True)),
                ('added_date', models.DateField(auto_now_add=True)),
                ('timestamp', models.DateTimeField(default=django.utils.timezone.now)),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.group', verbose_name='groups')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Activities',
            fields=[
                ('id', models.PositiveSmallIntegerField(choices=[(1, 'Fielding'), (2, 'Planning'), (3, 'Drafting')], primary_key=True, serialize=False)),
            ],
        ),
        migrations.CreateModel(
            name='Activity',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('ticket', models.CharField(blank=True, max_length=100, null=True)),
                ('rec_date', models.DateField(blank=True, null=True)),
                ('ecd', models.DateField(blank=True, null=True)),
                ('market', models.IntegerField(default=0)),
                ('ewo', models.CharField(blank=True, max_length=225, null=True)),
                ('da', models.CharField(blank=True, max_length=20, null=True)),
                ('lus', models.CharField(blank=True, max_length=20, null=True)),
                ('wire_center', models.TextField(blank=True, null=True)),
                ('pfp', models.TextField(blank=True, null=True)),
                ('latitude', models.CharField(blank=True, max_length=50, null=True)),
                ('longitude', models.CharField(blank=True, max_length=50, null=True)),
                ('job_type', models.CharField(blank=True, max_length=50, null=True)),
                ('job_no', models.CharField(blank=True, max_length=50, null=True)),
                ('f1cfas', models.CharField(blank=True, max_length=20, null=True)),
                ('f1job_no', models.CharField(blank=True, max_length=20, null=True)),
                ('f1_sow', models.TextField(blank=True, null=True)),
                ('f2cfas', models.CharField(blank=True, max_length=20, null=True)),
                ('f2job_no', models.CharField(blank=True, max_length=20, null=True)),
                ('f2_sow', models.TextField(blank=True, null=True)),
                ('notes', models.TextField(blank=True, null=True)),
                ('work_print', models.CharField(blank=True, max_length=20, null=True)),
                ('footage', models.IntegerField(blank=True, null=True)),
                ('appr_footage', models.IntegerField(blank=True, null=True)),
                ('terminal', models.IntegerField(blank=True, null=True)),
                ('added_date', models.DateField(auto_now_add=True)),
                ('timestamp', models.DateTimeField(default=django.utils.timezone.now)),
                ('activity', models.ManyToManyField(to='activity.activities')),
                ('added_by', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='added_by', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Activity_tasks',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('type', models.IntegerField()),
                ('start_date', models.DateField(auto_now_add=True)),
                ('complete_date', models.DateField(auto_now_add=True, null=True)),
                ('status', models.IntegerField()),
                ('added_date', models.DateField(auto_now_add=True)),
                ('activity_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='activity.activity')),
                ('added_by', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Bay_roles',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=100)),
                ('page_role_column', models.CharField(blank=True, max_length=100, null=True)),
                ('orderby', models.IntegerField(blank=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Clients',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Fe_users',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('fname', models.CharField(blank=True, max_length=100, null=True)),
                ('lname', models.CharField(blank=True, max_length=100, null=True)),
                ('cell_number', models.CharField(blank=True, max_length=20, null=True)),
                ('email', models.EmailField(max_length=50)),
                ('password', models.CharField(max_length=225)),
                ('client', models.IntegerField(blank=True, null=True)),
                ('added_date', models.DateField(auto_now_add=True, null=True)),
                ('is_active', models.IntegerField(default=0)),
                ('company_id', models.IntegerField(blank=True, null=True)),
                ('superviser_id', models.IntegerField(blank=True, null=True)),
                ('role', models.IntegerField(default=0)),
                ('by_admin_ban', models.IntegerField(blank=True, null=True)),
                ('web_email', models.EmailField(blank=True, max_length=50, null=True)),
                ('web_password', models.CharField(blank=True, max_length=225, null=True)),
                ('forgot_password_status', models.IntegerField(blank=True, null=True)),
                ('token', models.CharField(blank=True, max_length=225, null=True)),
                ('timestamp', models.DateTimeField(default=django.utils.timezone.now)),
            ],
        ),
        migrations.CreateModel(
            name='Mail_settings',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('protocol', models.CharField(blank=True, max_length=90, null=True)),
                ('host', models.CharField(blank=True, max_length=90, null=True)),
                ('port', models.CharField(blank=True, max_length=90, null=True)),
                ('user', models.CharField(blank=True, max_length=90, null=True)),
                ('passw', models.CharField(blank=True, max_length=90, null=True)),
                ('from_data', models.CharField(blank=True, max_length=90, null=True)),
                ('reply_to', models.CharField(blank=True, max_length=90, null=True)),
                ('name', models.CharField(blank=True, max_length=90, null=True)),
                ('priority', models.IntegerField(blank=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Subtasks',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('task_id', models.IntegerField()),
                ('subtask', models.CharField(blank=True, max_length=100, null=True)),
                ('status', models.IntegerField(default=0)),
            ],
        ),
        migrations.CreateModel(
            name='Task_remark',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('remark', models.TextField(blank=True, null=True)),
                ('added_date', models.DateField(auto_now_add=True)),
                ('added_by', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('task_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='activity.activity_tasks')),
            ],
        ),
        migrations.CreateModel(
            name='Task_media',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('media', models.ImageField(upload_to='tasks')),
                ('added_date', models.DateField(auto_now_add=True)),
                ('added_by', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('task_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='activity.activity_tasks')),
            ],
        ),
        migrations.CreateModel(
            name='Logins',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('ip', models.CharField(blank=True, max_length=50, null=True)),
                ('login_time', models.DateTimeField(auto_now_add=True, null=True)),
                ('logout_time', models.DateTimeField(auto_now_add=True, null=True)),
                ('is_login', models.IntegerField(default=1)),
                ('role', models.IntegerField(blank=True, null=True)),
                ('added_date', models.DateTimeField(auto_now_add=True)),
                ('latitude', models.TextField(blank=True, null=True)),
                ('longitude', models.TextField(blank=True, null=True)),
                ('ip_details', models.TextField(blank=True, null=True)),
                ('user_id', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.AddField(
            model_name='activity_tasks',
            name='subtask',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='activity.subtasks'),
        ),
        migrations.CreateModel(
            name='Activity_media',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('file_name', models.FileField(upload_to='activity/')),
                ('file_type', models.TextField()),
                ('media_name', models.CharField(blank=True, max_length=50, null=True)),
                ('caption', models.TextField(blank=True, null=True)),
                ('added_date', models.DateField(auto_now_add=True)),
                ('timestamp', models.DateTimeField(default=django.utils.timezone.now)),
                ('activity_id', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='activity.activity')),
                ('added_by', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.AddField(
            model_name='activity',
            name='assign_fielder',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='activity.fe_users'),
        ),
        migrations.AddField(
            model_name='activity',
            name='assign_int_eng',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='assign_int_eng', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='activity',
            name='client_id',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='activity.clients'),
        ),
        migrations.AddField(
            model_name='activity',
            name='int_eng2',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='int_eng2', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='activity',
            name='lead_eng',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='lead_eng', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='bay_users',
            name='role',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='activity.bay_roles'),
        ),
        migrations.AddField(
            model_name='bay_users',
            name='user_permissions',
            field=models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.permission', verbose_name='user permissions'),
        ),
    ]
