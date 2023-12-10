from django.contrib.auth.models import User
from django.views.generic import TemplateView, View
from django.shortcuts import render,redirect

from art_app.models import *

class UserIndexView(TemplateView):
    template_name = 'user/index.html'
    def get_context_data(self, **kwargs):
        context = super(UserIndexView,self).get_context_data(**kwargs)
        art = arts.objects.filter(status="approved")
        eve = Events.objects.filter(status="added")
        context['art'] = art
        context['eve'] = eve
        return context   
    
class ViewArt(TemplateView):
    template_name = 'user/view_arts.html'

    def get_context_data(self, **kwargs):
        context = super(ViewArt,self).get_context_data(**kwargs)
        art = arts.objects.filter(status="approved")
        context['art'] = art
        return context   
    
class ArtDetails(TemplateView):
    template_name = 'user/art_details.html'
    def get_context_data(self, **kwargs):
        context = super(ArtDetails,self).get_context_data(**kwargs)
        id=self.request.GET['id']
        art = arts.objects.filter(status="approved",id=id)
        context['art'] = art
        return context

    def post(self , request,*args,**kwargs):
        user=users.objects.get(user_id=self.request.user.id)
        id= self.request.GET['id']
        pe = arts.objects.get(id=id)

        se = art_cart()
        se.user_id=user.id
        se.art_id=pe.id
        se.status='added'
        se.save()
        return render(request, 'user/index.html', {'message': "Add to Cart"}) 
    
class CartView(TemplateView):
    template_name = 'user/cart_view.html'
    def get_context_data(self, **kwargs):
        context = super(CartView, self).get_context_data(**kwargs)
        user=users.objects.get(user_id=self.request.user.id)
        ar = art_cart.objects.filter(status='added', user_id=user.id)
        total = 0
        for i in ar:
            total = total + int(i.art.price)
        context['asz'] = total
        context['art'] = ar
        return context

    
class RejectCartView(TemplateView):
    def dispatch(self,request,*args,**kwargs):
        id = request.GET['id']
        art_cart.objects.get(id=id).delete()
        return redirect(request.META['HTTP_REFERER'])
    
class ArtCheckout(TemplateView):
    template_name = 'user/checkout.html'
    def get_context_data(self, **kwargs):
        context = super(ArtCheckout, self).get_context_data(**kwargs)
        user=users.objects.get(user_id=self.request.user.id)
        ar = art_cart.objects.filter(status='added', user_id=user.id)
        total = 0
        for i in ar:
            total = total + int(i.art.price)
        context['asz'] = total
        context['ar'] = ar
        return context

class ArtPayment(TemplateView):
    template_name= 'user/checkout.html'
    def dispatch(self,request,*args,**kwargs):
        user=users.objects.get(user_id=self.request.user.id)
        ch = art_cart.objects.filter(user_id=user.id,status='added')
        for i in ch:
            i.status='paid'
            i.address=request.POST["address"]
            i.profit=int(i.art.price)*10/100
            i.save()

        return render(request,'user/index.html',{'message':" payment Successfull, Check Booking Details"})
    
class BookingView(TemplateView):
    template_name = 'user/booking_view.html'
    def get_context_data(self, **kwargs):
        context = super(BookingView, self).get_context_data(**kwargs)
        user=users.objects.get(user_id=self.request.user.id)
        ar = art_cart.objects.filter(user_id=user.id)
        context['art'] = ar
        return context
    
class RentArt(TemplateView):
    template_name = 'user/rent_req.html'
    def post(self , request,*args,**kwargs):
        user=users.objects.get(user_id=self.request.user.id)
        id= self.request.GET['id']
        pe = arts.objects.get(id=id)
        from_date=request.POST['from_date']
        to_date=request.POST['to_date']

        se = rental()
        se.user_id=user.id
        se.art_id=pe.id
        se.status='added'
        se.from_date=from_date
        se.to_date=to_date
        se.save()
        return render(request, 'user/index.html', {'message': "Request Sent"})
    
class RentView(TemplateView):
    template_name = 'user/rent_view.html'
    def get_context_data(self, **kwargs):
        context = super(RentView, self).get_context_data(**kwargs)
        user=users.objects.get(user_id=self.request.user.id)
        ar = rental.objects.filter(user_id=user.id)
        context['art'] = ar
        return context

class RentCheckout(TemplateView):
    template_name = 'user/rent_payment.html'
    def get_context_data(self, **kwargs):
        context = super(RentCheckout, self).get_context_data(**kwargs)
        user=users.objects.get(user_id=self.request.user.id)
        ar = rental.objects.filter(user_id=user.id)
        
        context['ar'] = ar
        return context

class RentPayment(TemplateView):
    template_name= 'user/rent_payment.html'
    def dispatch(self,request,*args,**kwargs):
        user=users.objects.get(user_id=self.request.user.id)
        ch = rental.objects.filter(user_id=user.id)

        for i in ch:
            i.status='paid'
            i.save()

        return render(request,'user/index.html',{'message':" payment Successfull, Check Booking Details"})
        
class ViewEvents(TemplateView):
    template_name = 'user/view_events.html'
    def get_context_data(self, **kwargs):
        context = super(ViewEvents, self).get_context_data(**kwargs)
       
        eve = Events.objects.all()
        
        context['eve'] = eve
        return context