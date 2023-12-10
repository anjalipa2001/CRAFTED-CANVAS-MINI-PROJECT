from django.contrib.auth.models import User
from django.views.generic import TemplateView, View
from django.shortcuts import render

from art_app.models import *

class AdminIndexView(TemplateView):
    template_name = 'admin/index.html'

class UserView(TemplateView):
    template_name = 'admin/user_view.html'
    def get_context_data(self, **kwargs):
        context = super(UserView,self).get_context_data(**kwargs)
        doc = users.objects.filter(user__is_active='1')
        context['doc'] = doc
        return context

class ArtistRequests(TemplateView):
    template_name = 'admin/artist_req.html'
    def get_context_data(self, **kwargs):
        context = super(ArtistRequests,self).get_context_data(**kwargs)

        shop = artists.objects.filter(user__last_name='0',user__is_staff='0',user__is_active='1')

        context['shop'] = shop
        return context
    
class Approve(View):
    def dispatch(self, request, *args, **kwargs):
        id = request.GET['id']
        user = User.objects.get(pk=id)
        user.last_name='1'
        user.save()
        return render(request,'admin/index.html',{'message':" Account Approved"})

class Reject(View):
    def dispatch(self, request, *args, **kwargs):
        id = request.GET['id']
        user = User.objects.get(pk=id)
        user.last_name='1'
        user.is_active='0'
        user.save()
        return render(request,'admin/index.html',{'message':"Account Removed"})
    
class ArtistView(TemplateView):
    template_name = 'admin/artist_view.html'
    def get_context_data(self, **kwargs):
        context = super(ArtistView,self).get_context_data(**kwargs)

        shop = artists.objects.filter(user__last_name='1',user__is_staff='0',user__is_active='1')

        context['shop'] = shop
        return context

class ArtRequests(TemplateView):
    template_name = 'admin/art_req.html'
    def get_context_data(self, **kwargs):
        context = super(ArtRequests,self).get_context_data(**kwargs)

        art = arts.objects.filter(status="added")

        context['art'] = art
        return context
    
class ApproveArt(View):
    def dispatch(self, request, *args, **kwargs):
        id = request.GET['id']
        art = arts.objects.get(pk=id)
        art.status='approved'
        art.save()
        return render(request,'admin/index.html',{'message':"Art Approved"})
    
class RejectArt(View):
    def dispatch(self, request, *args, **kwargs):
        id = request.GET['id']
        art = arts.objects.get(pk=id)
        art.status='rejected'
        art.save()
        return render(request,'admin/index.html',{'message':"Art Rejected"})
    
class ViewArts(TemplateView):
    template_name = 'admin/view_arts.html'
    def get_context_data(self, **kwargs):
        context = super(ViewArts,self).get_context_data(**kwargs)

        art = arts.objects.filter(status="approved")

        context['art'] = art
        return context

class BookingView(TemplateView):
    template_name = 'admin/booking_view.html'
    def get_context_data(self, **kwargs):
        context = super(BookingView, self).get_context_data(**kwargs)
        ar = art_cart.objects.all()
        context['art'] = ar
        return context