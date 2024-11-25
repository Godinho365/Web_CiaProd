# -*- encoding: utf-8 -*-
"""
Copyright (c) 2019 - present AppSeed.us
"""

from django.urls import path
from .views import login_view, register_user, create_or_edit_group, list_groups, delete_group, list_users, create_or_edit_user, delete_user, daily_login_activity, my_profile
from django.contrib.auth.views import LogoutView
from django.contrib.auth import views as auth_views
from .views import CustomPasswordResetView

urlpatterns = [
    path('login/', login_view, name='login'),
    path('register/', register_user, name='register'),
    path('logout/', LogoutView.as_view(), name='logout'),
    path('criar-grupo/', create_or_edit_group, name='create_group'),
    path('editar-grupo/<int:group_id>/', create_or_edit_group, name='edit_group'),
    path('grupo/excluir/<int:group_id>/', delete_group, name='delete_group'),
    path('listar-grupos/', list_groups, name='list_groups'),  
    path('usuarios/', list_users, name='list_users'),
    path('usuarios/editar/<int:user_id>/', create_or_edit_user, name='edit_user'),
    path('usuarios/excluir/<int:user_id>/', delete_user, name='delete_user'),
    path('daily-login-activity/', daily_login_activity, name='daily_login_activity'),
    path('profile/', my_profile, name='my_profile'),

    path('recuperar-senha/', CustomPasswordResetView.as_view(), name='custom_password_reset'),
    path('recuperar-senha/enviado/', auth_views.PasswordResetDoneView.as_view(), name='password_reset_done'),
    path('reset/<uidb64>/<token>/', auth_views.PasswordResetConfirmView.as_view(template_name='accounts/password_reset_confirm.html'),  name='password_reset_confirm'),
    path('reset/done/', auth_views.PasswordResetCompleteView.as_view(template_name='accounts/password_reset_complete.html'), name='password_reset_complete'),
]

