# Generated by Django 4.1.7 on 2023-10-28 19:22

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('art_app', '0008_alter_arts_description'),
    ]

    operations = [
        migrations.CreateModel(
            name='art_cart',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status', models.CharField(max_length=50, null=True)),
                ('art', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='art_app.arts')),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='art_app.users')),
            ],
        ),
    ]
