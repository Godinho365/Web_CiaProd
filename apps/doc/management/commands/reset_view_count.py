from django.core.management.base import BaseCommand
from apps.doc.models import Instruction, Section, Category, Subcategory, Topic, Subtopic

class Command(BaseCommand):
    help = 'Reseta o view_count de todos os registros para 0'

    def handle(self, *args, **kwargs):
        # Atualizando todos os view_count para 0
        Instruction.objects.update(view_count=0)
        Section.objects.update(view_count=0)
        Category.objects.update(view_count=0)
        Subcategory.objects.update(view_count=0)
        Topic.objects.update(view_count=0)
        Subtopic.objects.update(view_count=0)

        # Exibindo uma mensagem de sucesso
        self.stdout.write(self.style.SUCCESS('Todos os view_count foram resetados para 0!'))
