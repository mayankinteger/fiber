# Generated by Django 4.0.3 on 2022-05-12 12:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('activity', '0008_alter_activities_id'),
    ]

    operations = [
        migrations.AlterField(
            model_name='activity',
            name='terminal',
            field=models.CharField(blank=True, max_length=20, null=True),
        ),
    ]
