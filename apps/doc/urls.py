# urls.py
from django import views
from django.conf import settings
from django.conf.urls.static import static
from django.urls import path
from .views import *


urlpatterns = [
    path('section-list/', list_section, name='list_section'),
    path('section/create/', create_section, name='create_section'),
    path('section/update/<int:id>/', update_section, name='update_section'),
    path('section/delete/<int:id>/', delete_section, name='delete_section'),

    path('section/<int:section_id>/category-list/', list_category, name='list_category'),
    path('section/<int:section_id>/category/create/', create_category, name='create_category'),  
    path('section/<int:section_id>/category/update/<int:id>/', update_category, name='update_category'),  
    path('category/delete/<int:id>/', delete_category, name='delete_category'),
    path('section/<int:section_id>/category/<int:category_id>/', view_category, name='view_category'),

    path('section/<int:section_id>/category/<int:category_id>/subcategory-list/', list_subcategory, name='list_subcategory'),
    path('section/<int:section_id>/category/<int:category_id>/subcategory/create/', create_subcategory, name='create_subcategory'),
    path('subcategory/update/<int:id>/', update_subcategory, name='update_subcategory'),
    path('section/<int:section_id>/category/<int:category_id>/subcategory/delete/<int:id>/', delete_subcategory, name='delete_subcategory'),
    path('section/<int:section_id>/category/<int:category_id>/subcategory/<int:subcategory_id>/view/', view_subcategory, name='view_subcategory'),

    path('section/<int:section_id>/category/<int:category_id>/subcategory/<int:subcategory_id>/topic/<int:topic_id>/subtopic/<int:subtopic_id>/instruction-list/', list_instruction, name='list_instruction'),  
    path('section/<int:section_id>/category/<int:category_id>/subcategory/<int:subcategory_id>/topic/<int:topic_id>/subtopic/<int:subtopic_id>/instructions/create/', create_instruction, name='create_instruction'),  
    path('section/<int:section_id>/category/<int:category_id>/subcategory/<int:subcategory_id>/topic/<int:topic_id>/subtopic/<int:subtopic_id>/instructions/update/<int:id>/', update_instruction, name='update_instruction'),  
    path('section/<int:section_id>/category/<int:category_id>/subcategory/<int:subcategory_id>/topic/<int:topic_id>/subtopic/<int:subtopic_id>/instructions/delete/<int:id>/', delete_instruction, name='delete_instruction'),
    path('instruction/<int:section_id>/<int:category_id>/<int:subcategory_id>/<int:topic_id>/<int:subtopic_id>/<int:instruction_id>/view/', view_instruction, name='view_instruction'),
    path('sections/<int:section_id>/categories/<int:category_id>/subcategories/<int:subcategory_id>/topics/<int:topic_id>/subtopics/<int:subtopic_id>/order_instructions/', order_instructions, name='order_instruction'),


    path('section/<int:section_id>/category/<int:category_id>/subcategory/<int:subcategory_id>/topic-list/', list_topic, name='list_topic'),
    path('section/<int:section_id>/category/<int:category_id>/subcategory/<int:subcategory_id>/topics/create/', create_topic, name='create_topic'),
    path('section/<int:section_id>/category/<int:category_id>/subcategory/<int:subcategory_id>/topics/update/<int:id>/', update_topic, name='update_topic'),
    path('section/<int:section_id>/category/<int:category_id>/subcategory/<int:subcategory_id>/topics/delete/<int:id>/', delete_topic, name='delete_topic'),
    path('section/<int:section_id>/category/<int:category_id>/subcategory/<int:subcategory_id>/topics/<int:topic_id>/view/', view_topic, name='view_topic'),

    path('section/<int:section_id>/category/<int:category_id>/subcategory/<int:subcategory_id>/topic/<int:topic_id>/subtopics/create/',create_subtopic,name='create_subtopic'),
    path('section/<int:section_id>/category/<int:category_id>/subcategory/<int:subcategory_id>/topic/<int:topic_id>/subtopics/<int:id>/update/',update_subtopic,name='update_subtopic'),
    path('section/<int:section_id>/category/<int:category_id>/subcategory/<int:subcategory_id>/topic/<int:topic_id>/subtopics/<int:id>/delete/',delete_subtopic,name='delete_subtopic'),
    path('section/<int:section_id>/category/<int:category_id>/subcategory/<int:subcategory_id>/topic/<int:topic_id>/subtopic-list/',list_subtopic,name='list_subtopic'),
    path('section/<int:section_id>/category/<int:category_id>/subcategory/<int:subcategory_id>/topic/<int:topic_id>/subtopic/<int:subtopic_id>/view/', view_subtopic, name='view_subtopic'),


    path('category/<int:category_id>/restore/<int:version_id>/', restore_category, name='restore_category'),
    path('subcategory/<int:subcategory_id>/restore/<int:version_id>/', restore_subcategory, name='restore_subcategory'),
    path('topic/<int:topic_id>/restore/<int:version_id>/', restore_topic, name='restore_topic'),
    path('subtopic/<int:subtopic_id>/restore/<int:version_id>/', restore_subtopic, name='restore_subtopic'),
    path('instruction/<int:instruction_id>/restore/<int:version_id>/', restore_instruction,name='restore_instruction'),

    
    path('gerar-pdf/<str:model_name>/<int:pk>/', generate_pdf, name='generate_pdf'),

    path('mapeamento-documentacao/', sidenav_view, name='doc_sidenav'),
    
   


]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
