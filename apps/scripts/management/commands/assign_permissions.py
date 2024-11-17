# apps/doc/management/commands/assign_permissions.py

from django.core.management.base import BaseCommand
from guardian.shortcuts import assign_perm
from django.contrib.auth.models import Group
from apps.doc.models import Instruction, Section, Category, Subcategory, Topic, Subtopic, Tag

class Command(BaseCommand):
    help = 'Atribui permissões para modelos de instrução, seção, categoria, subcategoria, etc.'

    def handle(self, *args, **kwargs):
        # Pegue os grupos
        contrib_group = Group.objects.get(name='Contribuidor')
        visitor_group = Group.objects.get(name='Visitante')

        # Atribuindo permissões para o modelo `Instruction`
        for instruction in Instruction.objects.all():
            assign_perm('change_instruction', contrib_group, instruction)
            assign_perm('view_instruction', visitor_group, instruction)
            assign_perm('delete_instruction', contrib_group, instruction)

        # Atribuindo permissões para o modelo `Section`
        for section in Section.objects.all():
            assign_perm('change_section', contrib_group, section)
            assign_perm('view_section', visitor_group, section)
            assign_perm('delete_section', contrib_group, section)

        # Atribuindo permissões para o modelo `Category`
        for category in Category.objects.all():
            assign_perm('change_category', contrib_group, category)
            assign_perm('view_category', visitor_group, category)
            assign_perm('delete_category', contrib_group, category)

        # Atribuindo permissões para o modelo `Subcategory`
        for subcategory in Subcategory.objects.all():
            assign_perm('change_subcategory', contrib_group, subcategory)
            assign_perm('view_subcategory', visitor_group, subcategory)
            assign_perm('delete_subcategory', contrib_group, subcategory)

        # Atribuindo permissões para o modelo `Topic`
        for topic in Topic.objects.all():
            assign_perm('change_topic', contrib_group, topic)
            assign_perm('view_topic', visitor_group, topic)
            assign_perm('delete_topic', contrib_group, topic)

        # Atribuindo permissões para o modelo `Subtopic`
        for subtopic in Subtopic.objects.all():
            assign_perm('change_subtopic', contrib_group, subtopic)
            assign_perm('view_subtopic', visitor_group, subtopic)
            assign_perm('delete_subtopic', contrib_group, subtopic)

        # Atribuindo permissões para o modelo `Tag`
        for tag in Tag.objects.all():
            assign_perm('change_tag', contrib_group, tag)
            assign_perm('view_tag', visitor_group, tag)
            assign_perm('delete_tag', contrib_group, tag)

        # Confirmação de sucesso
        self.stdout.write(self.style.SUCCESS('Permissões atribuídas com sucesso!'))
