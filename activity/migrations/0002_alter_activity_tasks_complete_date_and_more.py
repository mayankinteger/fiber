# Generated by Django 4.0.3 on 2022-05-09 05:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('activity', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='activity_tasks',
            name='complete_date',
            field=models.DateField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='activity_tasks',
            name='start_date',
            field=models.DateField(blank=True, null=True),
        ),
    ]
