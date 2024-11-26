from apps.doc.models import Section


def sidenav_view(request):
    sections = Section.objects.prefetch_related(
        'categories__subcategories__topics__subtopics__instructions'
    )
    return {'sections': sections}