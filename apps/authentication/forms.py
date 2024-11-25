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
    # Campo de nome
    first_name = forms.CharField(
        widget=forms.TextInput(
            attrs={
                "placeholder": "Nome",
                "class": "form-control"
            }
        )
    )

    # Campo de sobrenome
    last_name = forms.CharField(
        widget=forms.TextInput(
            attrs={
                "placeholder": "Sobrenome",
                "class": "form-control"
            }
        )
    )

    # Campo de nome de usuário
    username = forms.CharField(
        widget=forms.TextInput(
            attrs={
                "placeholder": "Nome de usuário",
                "class": "form-control"
            }
        )
    )

    # Campo de email
    email = forms.EmailField(
        widget=forms.EmailInput(
            attrs={
                "placeholder": "Email",
                "class": "form-control"
            }
        )
    )

    # Campo de senha
    password1 = forms.CharField(
        widget=forms.PasswordInput(
            attrs={
                "placeholder": "Senha",
                "class": "form-control"
            }
        )
    )

    # Campo de confirmação de senha
    password2 = forms.CharField(
        widget=forms.PasswordInput(
            attrs={
                "placeholder": "Confirmação de senha",
                "class": "form-control"
            }
        )
    )

    class Meta:
        model = User
        fields = ('first_name', 'last_name', 'username', 'email', 'password1', 'password2')



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

