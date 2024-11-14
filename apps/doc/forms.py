from django import forms
from ckeditor.widgets import CKEditorWidget
from .models import Instruction, Section, Category, Subcategory , Topic, Subtopic

class InstructionForm(forms.ModelForm):
    class Meta:
        model = Instruction
        fields = ['title', 'content', 'section', 'category', 'subcategory', 'topic', 'subtopic']
        widgets = {
            'title': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': 'Digite o título da instrução',
            }),
            'content': CKEditorWidget(),  # CKEditor já está definido
            'section': forms.Select(attrs={
                'class': 'form-control',
            }),
            'category': forms.Select(attrs={
                'class': 'form-control',
            }),
            'subcategory': forms.Select(attrs={
                'class': 'form-control',
            }),
            'topic': forms.Select(attrs={
                'class': 'form-control',
            }),
            'subtopic': forms.Select(attrs={
                'class': 'form-control',
            }),
        }


class SectionForm(forms.ModelForm):
    class Meta:
        model = Section
        fields = ['title', 'imagem']
        widgets = {
            'title': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Digite o Nome'}),
            'imagem': forms.ClearableFileInput(attrs={'class': 'form-control'}),
        }

class CategoryForm(forms.ModelForm):
    class Meta:
        model = Category
        fields = ['name', 'section', 'imagem', 'content']  # Inclua 'section' na lista de campos
        widgets = {
            'name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Digite o Nome'}),
            'section': forms.Select(attrs={'class': 'form-control'}),  # O campo será um Select
            'imagem': forms.ClearableFileInput(attrs={'class': 'form-control'}),
            'content': CKEditorWidget(),  # CKEditor já está definido
            
        }

    def __init__(self, *args, **kwargs):
        section_instance = kwargs.pop('section_instance', None)  # Retira o 'section_instance' do kwargs
        super().__init__(*args, **kwargs)
        if section_instance:
            self.fields['section'].initial = section_instance.id  # Define o valor inicial da seção

class SubcategoryForm(forms.ModelForm):
    class Meta:
        model = Subcategory
        fields = ['name', 'category', 'section', 'imagem', 'content']  # Campos ajustados conforme o modelo Subcategory
        widgets = {
            'name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Digite o Nome'}),
            'section': forms.Select(attrs={'class': 'form-control'}),
            'category': forms.Select(attrs={'class': 'form-control'}),
            'imagem': forms.ClearableFileInput(attrs={'class': 'form-control'}),
            'content': CKEditorWidget(),  # CKEditor já está definido
        }

    def __init__(self, *args, **kwargs):
        # Retire category e section dos kwargs
        category = kwargs.pop('category', None)
        section = kwargs.pop('section', None)
        super(SubcategoryForm, self).__init__(*args, **kwargs)  # Chame o init da classe base

        # Se uma categoria for passada, configure o queryset para o campo de categoria
        if category:
            self.fields['category'].queryset = Category.objects.filter(id=category.id)
            self.fields['category'].initial = category

        # Se uma seção for passada, configure o queryset para o campo de seção
        if section:
            self.fields['section'].queryset = Section.objects.filter(id=section.id)
            self.fields['section'].initial = section

class OrderInstructionsForm(forms.Form):
    instruction_ids = forms.CharField(widget=forms.HiddenInput())           
        
class TopicForm(forms.ModelForm):
    class Meta:
        model = Topic
        fields = ['name', 'content', 'section', 'category', 'subcategory', 'imagem']
        
        widgets = {
            'name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Digite o nome do tópico'}),
            'section': forms.Select(attrs={'class': 'form-control'}),
            'category': forms.Select(attrs={'class': 'form-control'}),
            'subcategory': forms.Select(attrs={'class': 'form-control'}),
            'imagem': forms.ClearableFileInput(attrs={'class': 'form-control'}),
        }

class SubtopicForm(forms.ModelForm):
    class Meta:
        model = Subtopic
        fields = ['name', 'content', 'topic', 'imagem']
        
        widgets = {
            'name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Digite o nome do subtópico'}),
            'topic': forms.Select(attrs={'class': 'form-control'}),
            'imagem': forms.ClearableFileInput(attrs={'class': 'form-control'}),
        }