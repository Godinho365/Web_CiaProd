from django import forms
from django.db import models
from ckeditor.fields import RichTextField  # Se estiver usando o CKEditor
from django.contrib.auth.models import User


class Instruction(models.Model):
    title = models.CharField(max_length=255)
    content = RichTextField(blank=True, null=True)
    section = models.ForeignKey('Section', on_delete=models.CASCADE, related_name='instructions')
    category = models.ForeignKey('Category', on_delete=models.CASCADE, related_name='instructions')
    subcategory = models.ForeignKey('Subcategory', on_delete=models.CASCADE, related_name='instructions')
    topic = models.ForeignKey('Topic', on_delete=models.CASCADE, related_name='instructions')  # Campo para o Tópico
    subtopic = models.ForeignKey('Subtopic', on_delete=models.CASCADE, related_name='instructions', blank=True, null=True)  # Novo campo para o Subtópico
    tags = models.ManyToManyField('Tag', blank=True, related_name='instructions')
    author = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    view_count = models.PositiveIntegerField(default=0)
    subfase = models.CharField(max_length=100, blank=True, null=True)
    order = models.IntegerField(default=0)


    class Meta:
        ordering = ['order']
    
    def __str__(self):
        return self.title

class Section(models.Model):
    title = models.CharField(max_length=255, unique=True)
    content = RichTextField(blank=True, null=True)
    author = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    view_count = models.PositiveIntegerField(default=0)
    order = models.PositiveIntegerField(default=0)
    imagem = models.ImageField(upload_to='section_imagens/', blank=True, null=True)

    class Meta:
        ordering = ['order']

    def __str__(self):
        return self.title

class Category(models.Model):
    name = models.CharField(max_length=100, unique=True)
    section = models.ForeignKey(Section, on_delete=models.CASCADE, related_name='categories')
    content = RichTextField(blank=True, null=True)
    author = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    view_count = models.IntegerField(default=0)
    order = models.PositiveIntegerField(default=0)
    imagem = models.ImageField(upload_to='categories_imagens/', blank=True, null=True)

    class Meta:
        ordering = ['order']

    def __str__(self):
        return self.name

class Subcategory(models.Model):
    name = models.CharField(max_length=100)  
    content = RichTextField(blank=True, null=True)
    section = models.ForeignKey(Section, on_delete=models.CASCADE, related_name='subcategories')
    category = models.ForeignKey(Category, on_delete=models.CASCADE, related_name='subcategories')
    author = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    view_count = models.PositiveIntegerField(default=0)
    order = models.PositiveIntegerField(default=0)
    imagem = models.ImageField(upload_to='subcategory_imagens/', blank=True, null=True)

    class Meta:
        ordering = ['order']

    def __str__(self):
        return self.name

class Topic(models.Model):
    name = models.CharField(max_length=100)
    content = RichTextField(blank=True, null=True)
    section = models.ForeignKey(Section, on_delete=models.CASCADE, related_name='topics')  # Novo campo para seção
    category = models.ForeignKey(Category, on_delete=models.CASCADE, related_name='topics')  # Novo campo para categoria
    subcategory = models.ForeignKey(Subcategory, on_delete=models.CASCADE, related_name='topics')
    author = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    view_count = models.PositiveIntegerField(default=0)
    order = models.PositiveIntegerField(default=0)
    imagem = models.ImageField(upload_to='topic_imagens/', blank=True, null=True)

    class Meta:
        ordering = ['order']

    def __str__(self):
        return self.name
    
class Subtopic(models.Model):
        name = models.CharField(max_length=100)
        content = RichTextField(blank=True, null=True)
        topic = models.ForeignKey(Topic, on_delete=models.CASCADE, related_name='subtopics')
        author = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
        created_at = models.DateTimeField(auto_now_add=True)
        view_count = models.PositiveIntegerField(default=0)  
        order = models.PositiveIntegerField(default=0)
        imagem = models.ImageField(upload_to='subtopic_imagens/', blank=True, null=True)

        class Meta:
            ordering = ['order']

        def __str__(self):
            return self.name

class Tag(models.Model):
    name = models.CharField(max_length=50, unique=True)

    def __str__(self):
        return self.name
