# Generated by Django 4.1.7 on 2023-11-01 18:42

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('art_app', '0017_art_cart_address'),
    ]

    operations = [
        migrations.AddField(
            model_name='artists',
            name='status',
            field=models.CharField(max_length=100, null=True),
        ),
    ]
