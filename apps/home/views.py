# -*- encoding: utf-8 -*-
"""
Copyright (c) 2019 - present AppSeed.us
"""

from django import template
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from django.template import loader 
from django.urls import reverse
from django.shortcuts import render
from apps.doc.models import Section
from apps.authentication.views import dashboard


@login_required(login_url="/login/")
def index(request):
    context = {'segment': 'index'}

    sections = Section.objects.prefetch_related( 
        'categories__subcategories__topics__subtopics__instructions'
    )

    context['sections'] = sections  # Adicione as sections ao contexto

    html_template = loader.get_template('chart/UserOnline.html')
    return HttpResponse(html_template.render(context, request))


def icons(request):
    return render(request, 'home/icons.html')


