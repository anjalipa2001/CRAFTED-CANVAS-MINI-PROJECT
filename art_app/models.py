from django.db import models
from django.contrib.auth.models import User

# Create your models here.

class UserType(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE,null=True)
    type = models.CharField(max_length=50,null=True)

class users(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE,null=True)
    phone = models.CharField(max_length=50,null=True)

class artists(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE,null=True)
    address = models.CharField(max_length=50,null=True)
    phone = models.CharField(max_length=50,null=True)
    status = models.CharField(max_length=100,null=True)

class arts(models.Model):
    artist = models.ForeignKey(artists, on_delete=models.CASCADE,null=True)
    name = models.CharField(max_length=50,null=True)
    category = models.CharField(max_length=50,null=True)
    price = models.CharField(max_length=50,null=True)
    image = models.ImageField(null=True)
    status = models.CharField(max_length=50,null=True)
    description = models.CharField(max_length=200,null=True)

class art_cart(models.Model):
    art = models.ForeignKey(arts, on_delete=models.CASCADE,null=True)
    user = models.ForeignKey(users, on_delete=models.CASCADE,null=True)
    status=models.CharField(max_length=50,null=True)
    profit=models.CharField(max_length=50,null=True)
    address=models.CharField(max_length=100,null=True)

class rental(models.Model):
    art = models.ForeignKey(arts, on_delete=models.CASCADE,null=True)
    user = models.ForeignKey(users, on_delete=models.CASCADE,null=True)
    status=models.CharField(max_length=50,null=True)
    address=models.CharField(max_length=100,null=True)
    amount=models.CharField(max_length=100,null=True)
    from_date=models.DateField(null=True)
    to_date=models.DateField(null=True)

class Events(models.Model):
    artist = models.ForeignKey(artists, on_delete=models.CASCADE,null=True)
    name = models.CharField(max_length=50,null=True)
    place = models.CharField(max_length=50,null=True)
    date = models.DateField(null=True)
    time = models.TimeField(null=True)
    status = models.CharField(max_length=50,null=True)
    description = models.CharField(max_length=200,null=True)
    image = models.ImageField(null=True)

class Premium(models.Model):
    artist = models.ForeignKey(artists, on_delete=models.CASCADE,null=True)
    amount = models.CharField(max_length=100,null=True)
    status = models.CharField(max_length=50,null=True)