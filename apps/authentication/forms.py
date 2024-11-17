# -*- encoding: utf-8 -*-
"""
Copyright (c) 2019 - present AppSeed.us
"""

from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django.contrib.auth.models import Group


class LoginForm(forms.Form):
    username = forms.CharField(
        widget=forms.TextInput(
            attrs={
                "placeholder": "Username",
                "class": "form-control"
            }
        ))
    password = forms.CharField(
        widget=forms.PasswordInput(
            attrs={
                "placeholder": "Password",
                "class": "form-control"
            }
        ))


class SignUpForm(UserCreationForm):
    username = forms.CharField(
        widget=forms.TextInput(
            attrs={
                "placeholder": "Username",
                "class": "form-control"
            }
        ))
    email = forms.EmailField(
        widget=forms.EmailInput(
            attrs={
                "placeholder": "Email",
                "class": "form-control"
            }
        ))
    password1 = forms.CharField(
        widget=forms.PasswordInput(
            attrs={
                "placeholder": "Password",
                "class": "form-control"
            }
        ))
    password2 = forms.CharField(
        widget=forms.PasswordInput(
            attrs={
                "placeholder": "Password check",
                "class": "form-control"
            }
        ))

    class Meta:
        model = User
        fields = ('username', 'email', 'password1', 'password2')



class GroupForm(forms.ModelForm):
    class Meta:
        model = Group
        fields = ['name']
        widgets = {
            'name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Nome do Grupo'}),
        }

class UserForm(forms.ModelForm):
    group = forms.ModelChoiceField(
        queryset=Group.objects.all(),
        required=False,
        empty_label="Selecione um grupo"
    )

    class Meta:
        model = User
        fields = ['username', 'first_name', 'last_name', 'email', 'group']

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        
        # Adiciona a classe 'form-control' a todos os campos
        for field in self.fields.values():
            field.widget.attrs['class'] = 'form-control'
            if not field.widget.attrs.get('placeholder'):
                field.widget.attrs['placeholder'] = f'Informe {field.label}'

        # Se for edição de usuário, preenche o campo de grupo
        if self.instance and self.instance.pk:
            # Aqui só preenche um grupo, já que ModelChoiceField permite apenas um
            self.fields['group'].initial = self.instance.groups.first()  # Pega o primeiro grupo do usuário

