# Generated by Django 4.0.6 on 2023-01-07 15:38

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('workouts', '0009_alter_exercise_description'),
    ]

    operations = [
        migrations.AlterField(
            model_name='workout',
            name='description',
            field=models.TextField(blank=True, max_length=10000, null=True),
        ),
    ]