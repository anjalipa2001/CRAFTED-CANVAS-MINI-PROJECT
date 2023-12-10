from django.views.generic import TemplateView, View
from django.contrib.auth.models import User,auth
from django.contrib.auth import login, authenticate
from django.shortcuts import render,redirect
from django.core.files.storage import FileSystemStorage

from art_app.models import *

# Create your views here.

class IndexView(TemplateView):
    template_name="index.html"

class LoginView(TemplateView):
    template_name="login.html"

    def post(self,request,*args,**kwargs):
        username=request.POST['username']
        print(username)
        password =request.POST['password']
        user=auth.authenticate(username=username,password=password)
        if user is not  None:
            login(request,user)
            if user.last_name =='1':
                if user.is_superuser:
                    return redirect('/admin')
                elif UserType.objects.get(user_id=user.id).type=="artist":
                    return redirect('/artist')
                elif UserType.objects.get(user_id=user.id).type == "user":
                    return redirect('/user')
                else:
                    return render(request,'login.html',{'message':" User Account Not Authenticated"})

            else:
                return render(request,'login.html',{'message':" User Account Not Authenticated"})
        else:
            return render(request,'index.html',{'message':"Invalid Username or Password"})


class UserRegistration(TemplateView):
    template_name='user_reg.html'

    def post(self , request,*args,**kwargs):
        name = request.POST['name']
        username = request.POST['username']
        phone=request.POST['mobile']
        
        email= request.POST['email']
        password = request.POST['password']
        if User.objects.filter(email=email,username=username):
            print ('pass')
            return render(request,'user_reg.html',{'message':"already added the username or email"})

        else:
            user = User.objects.create_user(username=username,password=password,email=email,first_name=name,last_name='1')
            user.save()
            se = users()
            se.user = user
            se.phone = phone
            se.save()
            usertype = UserType()
            usertype.user = user
            usertype.type = "user"
            usertype.save()


            return render(request, 'index.html', {'message': "successfully Registered"})
        

class ArtistRegistration(TemplateView):
    template_name='artist_reg.html'

    def post(self , request,*args,**kwargs):
        name = request.POST['name']
        username = request.POST['username']
        phone=request.POST['mobile']
        
        email= request.POST['email']
        password = request.POST['password']
        if User.objects.filter(email=email,username=username):
            print ('pass')
            return render(request,'artist_reg.html',{'message':"already added the username or email"})

        else:
            user = User.objects.create_user(username=username,password=password,email=email,first_name=name,last_name='0')
            user.save()
            se = artists()
            se.user = user
            se.phone = phone
            se.status = "normal"
            se.save()
            usertype = UserType()
            usertype.user = user
            usertype.type = "artist"
            usertype.save()


            return render(request, 'index.html', {'message': "successfully Registered"})