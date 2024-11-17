import os
import django
import sys

sys.path.append('apps/scripts')


# Configura o ambiente do Django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'apps.settings')

# Inicializa o Django
django.setup()

from django.contrib.auth.models import Group

def create_groups():
    Group.objects.get_or_create(name='Contribuidor')
    Group.objects.get_or_create(name='Visitante')
    print("Grupos 'Contribuidor' e 'Visitante' criados.")
