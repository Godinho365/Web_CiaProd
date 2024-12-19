from django.db import models

class Location(models.Model):
    name = models.CharField(max_length=100)
    coordinates = models.TextField()  # Armazenar as coordenadas como WKT (exemplo: "POINT(12.34 56.78)")

    class Meta:
        app_label = 'apps.geospatial_app'
