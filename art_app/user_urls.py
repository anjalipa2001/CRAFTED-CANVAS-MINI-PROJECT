from django.urls import path
from art_app.user_views import *

urlpatterns = [

    path('',UserIndexView.as_view()),
    path('ViewArt',ViewArt.as_view()),
    path('ArtDetails',ArtDetails.as_view()),
    path('CartView',CartView.as_view()),
    path('RejectCartView',RejectCartView.as_view()),
    path('ArtCheckout',ArtCheckout.as_view()),
    path('ArtPayment',ArtPayment.as_view()),
    path('BookingView',BookingView.as_view()),
    path('RentArt',RentArt.as_view()),
    path('RentView',RentView.as_view()),
    path('RentPayment',RentPayment.as_view()),
    path('RentCheckout',RentCheckout.as_view()),
    path('ViewEvents',ViewEvents.as_view())

]
def urls():
    return urlpatterns, 'user', 'user'