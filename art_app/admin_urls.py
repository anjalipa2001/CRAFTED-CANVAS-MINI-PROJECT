from django.urls import path
from art_app.admin_views import *

urlpatterns = [

    path('',AdminIndexView.as_view()),
    path('UserView',UserView.as_view()),
    path('Approve',Approve.as_view()),
    path('Reject',Reject.as_view()),
    path('ArtistRequests',ArtistRequests.as_view()),
    path('ArtistView',ArtistView.as_view()),
    path('ArtRequests',ArtRequests.as_view()),
    path('ApproveArt',ApproveArt.as_view()),
    path('RejectArt',RejectArt.as_view()),
    path('ViewArts',ViewArts.as_view()),
    path('BookingView',BookingView.as_view()),
]
def urls():
    return urlpatterns, 'admin', 'admin'