# Generated by Django 4.0.3 on 2022-05-09 06:51

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('activity', '0002_alter_activity_tasks_complete_date_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='activity_tasks',
            name='activity_id',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='activity.activity'),
        ),
        migrations.AlterField(
            model_name='activity_tasks',
            name='subtask',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='activity.subtasks'),
        ),
    ]
