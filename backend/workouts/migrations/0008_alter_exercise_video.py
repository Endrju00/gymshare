# Generated by Django 4.0.6 on 2023-01-06 19:16

import cloudinary_storage.storage
import cloudinary_storage.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('workouts', '0007_alter_rating_unique_together'),
    ]

    operations = [
        migrations.AlterField(
            model_name='exercise',
            name='video',
            field=models.FileField(blank=True, null=True, storage=cloudinary_storage.storage.VideoMediaCloudinaryStorage(), upload_to='videos/', validators=[cloudinary_storage.validators.validate_video]),
        ),
    ]