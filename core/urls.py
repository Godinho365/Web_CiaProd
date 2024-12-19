# -*- encoding: utf-8 -*-
"""
Copyright (c) 2019 - present AppSeed.us
"""

from django.contrib import admin
from django.urls import path, include  # add this
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
    path('admin/', admin.site.urls),          # Django admin route
    path("", include("apps.authentication.urls")), # Auth routes - login / register
    path("", include("apps.home.urls")),  # <- Adicione a vírgula aqui
    path('doc/', include('apps.doc.urls')),
    path('auth/', include('apps.authentication.urls')),  # UI Kits Html files
    path('loc/', include('apps.geospatial_app.urls')),  # Incluindo as URLs do seu aplicativo
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
