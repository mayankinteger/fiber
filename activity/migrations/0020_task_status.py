# Generated by Django 4.0.3 on 2022-06-16 05:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('activity', '0019_delete_task_status_activity_fielder_ecd_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='Task_status',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('task_id', models.IntegerField()),
                ('status', models.CharField(blank=True, max_length=100, null=True)),
            ],
        ),
    ]
