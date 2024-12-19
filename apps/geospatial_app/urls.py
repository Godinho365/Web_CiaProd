from django.urls import path
from . import views

urlpatterns = [
    path('localizacoes-proximas/', views.nearby_locations, name='nearby_locations'),

]
