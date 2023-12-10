from django.contrib.auth.models import User
from django.views.generic import TemplateView, View
from django.core.files.storage import FileSystemStorage
from django.shortcuts import render

from art_app.models import *

class ArtistIndexView(TemplateView):
    template_name = 'artist/index.html'

class AddArt(TemplateView):
    template_name = 'artist/add_arts.html'
    def post(self , request,*args,**kwargs):
        artist=artists.objects.get(user_id=self.request.user.id)
        name = request.POST['name']
        category = request.POST['category']
        price=request.POST['price']
        description=request.POST['description']
        image=request.FILES['image']
        fii=FileSystemStorage()
        filesss=fii.save(image.name,image)
        
        se = arts()
        se.artist_id=artist.id
        se.name = name
        se.category = category
        se.price=price
        se.image=filesss
        se.description=description
        se.status='added'
        se.save()
        
        return render(request, 'artist/index.html', {'message': "successfully added"})
    
class ViewArt(TemplateView):
    template_name = 'artist/view_arts.html'

    def get_context_data(self, **kwargs):
        context = super(ViewArt,self).get_context_data(**kwargs)
        com=artists.objects.get(user_id=self.request.user.id)
        art = arts.objects.filter(artist_id=com.id)

        context['art'] = art
        return context   
    
class BookingView(TemplateView):
    template_name = 'artist/booking_view.html'
    def get_context_data(self, **kwargs):
        context = super(BookingView, self).get_context_data(**kwargs)
        user=artists.objects.get(user_id=self.request.user.id)
        ar = art_cart.objects.filter(art__artist_id=user.id)
        context['art'] = ar
        return context

class RentRequests(TemplateView):
    template_name = 'artist/rent_req.html'
    def get_context_data(self, **kwargs):
        context = super(RentRequests, self).get_context_data(**kwargs)
        user=artists.objects.get(user_id=self.request.user.id)
        ar = rental.objects.filter(art__artist_id=user.id)
        context['art'] = ar
        return context
    
class ApproveRent(View):
    def dispatch(self, request, *args, **kwargs):
        id = request.GET['id']
        art = rental.objects.get(pk=id)
        art.status='approved'
        art.save()
        return render(request,'artist/rent_req.html',{'message':"Approved"})
    
class RejectRent(View):
    def dispatch(self, request, *args, **kwargs):
        id = request.GET['id']
        art = rental.objects.get(pk=id)
        art.status='rejected'
        art.save()
        return render(request,'artist/rent_req.html',{'message':"Rejected"})
    
class RentAmount(TemplateView):
    template_name = 'artist/rent_amount.html'
    def post(self , request,*args,**kwargs):
        id= self.request.GET['id']
        se = rental.objects.get(id=id)
        se.amount=request.POST['amount']
        se.save()
        return render(request, 'artist/index.html', {'message': "Added"}) 
    
class AddEvent(TemplateView):
    template_name = 'artist/add_event.html'
    
    def post(self , request,*args,**kwargs):
        artist=artists.objects.get(user_id=self.request.user.id)
        name = request.POST['name']
        place = request.POST['place']
        date = request.POST['date']
        time=request.POST['time']
        description=request.POST['description']
        image=request.FILES['image']
        fii=FileSystemStorage()
        filesss=fii.save(image.name,image)

        if artists.objects.filter(status="premium"):
            se = Events()
            se.artist_id=artist.id
            se.name = name
            se.place = place
            se.time = time
            se.date=date
            se.image=filesss
            se.description=description
            se.status='added'
            se.save()
        
            return render(request, 'artist/index.html', {'message': "successfully added"})
        else:
            return render(request, 'artist/premium.html', {'message': "Need Premium membership to add event"})
        
        
class ViewPremium(TemplateView):
    template_name = 'artist/premium.html'
    def get_context_data(self, **kwargs):
        context = super(ViewPremium, self).get_context_data(**kwargs)
        ar = artists.objects.filter(user_id=self.request.user.id)
        context['art'] = ar
        return context
        
class PremiumPayment(TemplateView):
    template_name = 'artist/pre_payment.html'
    def post(self , request,*args,**kwargs):
        artist=artists.objects.get(user_id=self.request.user.id)
        amount = request.POST['amount']
    
        se = Premium()
        se.artist_id=artist.id
        se.amount = amount
        se.status='premium'
        se.save()

        ar=artists.objects.get(id=artist.id)
        ar.status="premium"
        ar.save()
        
        return render(request, 'artist/index.html', {'message': "successfully added"})


