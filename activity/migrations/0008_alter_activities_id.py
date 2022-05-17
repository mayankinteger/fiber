# Generated by Django 4.0.3 on 2022-05-12 05:47

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('activity', '0007_alter_activities_id'),
    ]

    operations = [
        migrations.AlterField(
            model_name='activities',
            name='id',
            field=models.PositiveSmallIntegerField(choices=[(1, 'Fielding'), (2, 'Planning'), (3, 'Drafting'), (4, 'QC Job')], primary_key=True, serialize=False),
        ),
    ]