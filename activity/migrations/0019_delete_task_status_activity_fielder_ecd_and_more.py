# Generated by Django 4.0.3 on 2022-06-16 05:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('activity', '0018_task_status'),
    ]

    operations = [
        migrations.DeleteModel(
            name='Task_status',
        ),
        migrations.AddField(
            model_name='activity',
            name='fielder_ecd',
            field=models.DateField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='activity',
            name='fielding_start_date',
            field=models.DateField(blank=True, null=True),
        ),
    ]
