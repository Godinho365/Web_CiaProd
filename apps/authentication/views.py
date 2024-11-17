# -*- encoding: utf-8 -*-
"""
Copyright (c) 2019 - present AppSeed.us
"""

# Create your views here.
from django.shortcuts import get_object_or_404
from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from .forms import LoginForm, SignUpForm, GroupForm
from django.contrib import messages
from django.contrib.auth.decorators import user_passes_test
from django.contrib.auth.models import Group
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from .forms import UserForm 
from datetime import datetime
from .models import UserActivity



def login_view(request):
    form = LoginForm(request.POST or None)
    msg = None

    if request.method == "POST":
        if form.is_valid():
            username = form.cleaned_data.get("username")
            password = form.cleaned_data.get("password")
            user = authenticate(username=username, password=password)
            if user is not None:
                login(request, user)
                # Registra a atividade de login do usuário
                UserActivity.objects.create(user=user, login_time=datetime.now())
                return redirect("/")
            else:
                msg = 'Invalid credentials'
        else:
            msg = 'Error validating the form'

    return render(request, "accounts/login.html", {"form": form, "msg": msg})


def register_user(request):
    msg = None
    success = False

    if request.method == "POST":
        form = SignUpForm(request.POST)
        if form.is_valid():
            # Salva o usuário criado
            user = form.save()

            # Obtém ou cria o grupo "Visitante"
            visitante_group, created = Group.objects.get_or_create(name='Visitante')

            # Adiciona o usuário ao grupo "Visitante"
            user.groups.add(visitante_group)

            # Autentica o usuário
            username = form.cleaned_data.get("username")
            raw_password = form.cleaned_data.get("password1")
            user = authenticate(username=username, password=raw_password)

            msg = 'Usuário criado - por favor, faça <a href="/login">login</a>.'
            success = True

            # Opcionalmente, você pode redirecionar após a criação do usuário
            # return redirect("/login/")

        else:
            msg = 'O formulário não é válido'
    else:
        form = SignUpForm()

    return render(request, "accounts/register.html", {"form": form, "msg": msg, "success": success})

# Função para garantir que o usuário é superuser
def is_superuser(user):
    return user.is_superuser


@user_passes_test(lambda u: u.is_superuser)
def create_or_edit_group(request, group_id=None):
    """
    Cria um novo grupo ou edita um grupo existente, dependendo da presença do 'group_id'.
    """
    if group_id:
        # Se 'group_id' for fornecido, tentamos recuperar o grupo para edição
        group = get_object_or_404(Group, id=group_id)
    else:
        # Caso contrário, criamos um novo grupo
        group = None

    if request.method == 'POST':
        form = GroupForm(request.POST, instance=group)  # Preenche o formulário com o grupo para edição, se existir
        if form.is_valid():
            form.save()
            return redirect('list_groups')  # Redireciona para uma página de grupos ou onde você quiser
    else:
        form = GroupForm(instance=group)  # Preenche o formulário com os dados do grupo se for edição, ou com dados vazios para criação

    return render(request, 'accounts/FormGroup.html', {'form': form, 'group': group})

@user_passes_test(lambda u: u.is_superuser)
def list_groups(request):
    groups = Group.objects.all()  # Pega todos os grupos
    
    # Conta o total de usuários no sistema
    total_users = User.objects.count()

    # Lista para armazenar os dados dos grupos com a quantidade de usuários e a porcentagem
    group_data = []
    for group in groups:
        # Conta o número de usuários associados ao grupo
        group_users_count = group.user_set.count()
        
        # Calcula a porcentagem de usuários no grupo em relação ao total de usuários
        group_percentage = (group_users_count / total_users * 100) if total_users > 0 else 0
        
        group_data.append({
            'group': group,
            'user_count': group_users_count,
            'percentage': group_percentage
        })
    
    return render(request, 'accounts/ListGroup.html', {'group_data': group_data, 'total_users': total_users})

@user_passes_test(lambda u: u.is_superuser)
def delete_group(request, group_id):
    group = get_object_or_404(Group, id=group_id)
    
    # Excluir o grupo
    group.delete()
    
    # Redirecionar para a lista de grupos após a exclusão
    return redirect('list_groups')

@login_required
def list_users(request):
    # Verificando se o usuário logado é um superusuário
    if not request.user.is_superuser:
        return redirect('home')  # Redireciona para a página inicial se não for superusuário

    # Obtendo todos os usuários do banco de dados
    users = User.objects.all()

    # Renderizando o template passando a lista de usuários
    return render(request, 'accounts/ListUser.html', {'users': users})

@login_required
def delete_user(request, user_id):
    # Verificando se o usuário é um superusuário
    if not request.user.is_superuser:
        return redirect('home')  # Redireciona para a página de erro se não for superusuário

    # Obtendo o usuário a ser deletado
    user = get_object_or_404(User, pk=user_id)

    if request.method == 'POST':
        # Exclui o usuário
        user.delete()
        messages.success(request, 'Usuário excluído com sucesso!')
        return redirect('list_users')  # Redireciona para a lista de usuários após a exclusão

    return render(request, '', {'user': user})


def create_or_edit_user(request, user_id=None):
    # Verificando se o usuário é um superusuário
    if not request.user.is_superuser:
        return redirect('access_denied')  # Redireciona para a página de erro se não for superusuário

    if user_id:
        # Se houver user_id, significa que estamos editando um usuário
        user = get_object_or_404(User, pk=user_id)
    else:
        # Se não houver user_id, estamos criando um novo usuário
        user = None

    if request.method == 'POST':
        form = UserForm(request.POST, instance=user)
        if form.is_valid():
            user = form.save(commit=False)  # Não salva imediatamente para podermos manipular antes
            
            # Atualiza o grupo selecionado
            if 'group' in form.cleaned_data:
                user.groups.set([form.cleaned_data['group']])  # Passa o grupo como uma lista

            user.save()

            if user_id:
                messages.success(request, 'Usuário atualizado com sucesso!')
            else:
                messages.success(request, 'Usuário criado com sucesso!')
            return redirect('list_users')  # Redireciona para a lista de usuários após a criação ou edição
    else:
        form = UserForm(instance=user)

    return render(request, 'accounts/FormUser.html', {'form': form, 'user': user})

from django.db.models import Count
from django.db.models.functions import TruncDate
from django.shortcuts import render
import json
from .models import UserActivity

def daily_login_activity(request):
    # Coletando as entradas por dia
    activities = UserActivity.objects.annotate(
        day=TruncDate('login_time')
    ).values('day').annotate(
        entries=Count('id'),
    ).order_by('day')

    # Preparando os dados para o gráfico
    days = [activity['day'].strftime('%Y-%m-%d') for activity in activities]
    entries = [activity['entries'] for activity in activities]

    # Coletando os usuários e suas entradas por dia
    users_per_day = {}
    for activity in activities:
        day_str = activity['day'].strftime('%Y-%m-%d')
        
        # Buscando os usuários para o dia
        users = UserActivity.objects.filter(login_time__date=activity['day']).distinct('user')
        
        # Contabilizando as entradas por usuário
        user_entries = {}
        for user in users:
            user_entries[user.user.username] = UserActivity.objects.filter(
                login_time__date=activity['day'],
                user=user.user
            ).count()
        
        users_per_day[day_str] = user_entries

    # Passando os dados para o contexto
    context = {
        'days': json.dumps(days),  # Convertendo para JSON
        'entries': json.dumps(entries),  # Convertendo para JSON
        'users_per_day': json.dumps(users_per_day)  # Usuários por dia
    }

    return render(request, 'chart/UserOnline.html', context)



@login_required
def my_profile(request):
    if request.method == 'POST':
        form = UserForm(request.POST, instance=request.user)
        if form.is_valid():
            form.save()
            return redirect('my_profile')  # Substitua 'profile' pelo nome da URL para onde deseja redirecionar.
    else:
        form = UserForm(instance=request.user)

    # Remove o campo 'group' do formulário para evitar que seja editado.
    form.fields['group'].widget.attrs['readonly'] = True  # Tornando o campo somente leitura

    return render(request, 'home/profile.html', {'form': form})







    