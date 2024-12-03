# -*- encoding: utf-8 -*-
"""
Copyright (c) 2019 - present AppSeed.us
"""

# Create your views here.
from django.shortcuts import get_object_or_404
from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login

from apps.doc.models import Section
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
                msg = 'Credenciais inválidas'
        else:
            msg = 'Erro ao validar o formulário'

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


from django.contrib import messages
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.models import Group
from django.contrib.auth.decorators import user_passes_test
from .forms import GroupForm

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

            # Adicionar mensagem de sucesso
            if group:
                messages.success(request, f'O grupo "{group.name}" foi atualizado com sucesso.')
            else:
                messages.success(request, 'O novo grupo foi criado com sucesso.')

            return redirect('list_groups')  # Redireciona para a lista de grupos após salvar
        else:
            # Adicionar mensagem de erro se o formulário não for válido
            messages.error(request, 'Erro ao salvar o grupo. Verifique os campos e tente novamente.')

    else:
        form = GroupForm(instance=group)  # Preenche o formulário com os dados do grupo se for edição, ou com dados vazios para criação

    return render(request, 'accounts/FormGroup.html', {'form': form, 'group': group})



@user_passes_test(lambda u: u.is_superuser)
def list_groups(request):
    # Obtém ou cria o grupo Admin
    admin_group, created = Group.objects.get_or_create(name="Admin")
    
    # Adiciona todos os superusuários ao grupo Admin
    superusers = User.objects.filter(is_superuser=True)
    for superuser in superusers:
        if superuser not in admin_group.user_set.all():
            admin_group.user_set.add(superuser)

    # Garante que todos os usuários do grupo Admin são superusuários e tem 'is_staff' como True
    admin_users = admin_group.user_set.all()
    for user in admin_users:
        if not user.is_superuser:
            user.is_superuser = True
        if not user.is_staff:
            user.is_staff = True
        user.save()

    # Calcula os dados para a listagem dos grupos
    groups = Group.objects.all()
    total_users = User.objects.count()

    group_data = []
    for group in groups:
        group_users_count = group.user_set.count()
        group_percentage = (group_users_count / total_users * 100) if total_users > 0 else 0
        
        group_data.append({
            'group': group,
            'user_count': group_users_count,
            'percentage': group_percentage,
        })
    
    return render(request, 'accounts/ListGroup.html', {
        'group_data': group_data,
        'total_users': total_users,
    })

from django.contrib import messages


@user_passes_test(lambda u: u.is_superuser)
def delete_group(request, group_id):
    group = get_object_or_404(Group, id=group_id)
    
    # Excluir o grupo
    group.delete()
    
    # Adicionar uma mensagem de sucesso
    messages.success(request, f'O grupo "{group.name}" foi excluído com sucesso.')
    
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

    # Se o método não for POST, redireciona para a lista de usuários
    return redirect('list_users')


from django.core.exceptions import ValidationError

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
            # Verificando se o email já está cadastrado, mas não o do próprio usuário
            email = form.cleaned_data['email']
            if User.objects.filter(email=email).exclude(id=user_id).exists():
                form.add_error('email', 'Este e-mail já está cadastrado.')
                return render(request, 'accounts/FormUser.html', {'form': form, 'user': user})

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

    # Obtém as seções com as categorias, subcategorias, tópicos, subtópicos e instruções
    sections = Section.objects.prefetch_related( 
        'categories__subcategories__topics__subtopics__instructions'
    )

    # Passa o formulário e as seções para o contexto do template
    return render(request, 'home/profile.html', {'form': form, 'sections': sections})


from django.contrib.auth.views import PasswordResetView
from django.shortcuts import redirect
from django.urls import reverse

class CustomPasswordResetView(PasswordResetView):
    template_name = 'accounts/password_reset_form.html'
    
    def form_valid(self, form):
        # Depois que o formulário for validado, enviamos o e-mail de recuperação
        response = super().form_valid(form)

        # Definir a mensagem de sucesso
        success_message = "O e-mail de recuperação de senha foi enviado com sucesso!"
        
        # Redireciona para a página de login com a mensagem de sucesso como parâmetro
        return redirect(f"{reverse('login')}?success_message={success_message}")






    