# Generated by Django 4.1.7 on 2023-10-28 16:46

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('art_app', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='users',
            name='address',
        ),
    ]
