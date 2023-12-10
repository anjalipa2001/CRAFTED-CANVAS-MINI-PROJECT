from django.urls import path
from art_app.artist_views import *

urlpatterns = [

    path('',ArtistIndexView.as_view()),
    path('AddArt',AddArt.as_view()),
    path('ViewArt',ViewArt.as_view()),
    path('BookingView',BookingView.as_view()),
    path('RentRequests',RentRequests.as_view()),
    path('ApproveRent',ApproveRent.as_view()),
    path('RejectRent',RejectRent.as_view()),
    path('RentAmount',RentAmount.as_view()),
    path('AddEvent',AddEvent.as_view()),
    path('ViewPremium',ViewPremium.as_view()),
    path('PremiumPayment',PremiumPayment.as_view()),


]
def urls():
    return urlpatterns, 'artist', 'artist'