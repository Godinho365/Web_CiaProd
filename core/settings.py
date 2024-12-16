# -*- encoding: utf-8 -*-
"""
Copyright (c) 2019 - present AppSeed.us
"""

import os
from decouple import config
from unipath import Path

import sys
sys.path.append('apps/scripts')

# Exemplo de configuração com Gmail (pode ser ajustado conforme seu provedor de e-mail)
EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_PORT = 587
EMAIL_USE_TLS = True
EMAIL_HOST_USER = 'god.rafa365@gmail.com'  # Seu e-mail
EMAIL_HOST_PASSWORD = 'sxnf pnsm qshl atjm'  # Sua senha de aplicativo do Gmail (não sua senha de login)
DEFAULT_FROM_EMAIL = EMAIL_HOST_USER



# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = Path(__file__).parent
CORE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = config('SECRET_KEY', default='S#perS3crEt_1122')

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = config('DEBUG', default=True, cast=bool)

# Load production server from .env
ALLOWED_HOSTS = ['*']

# Application definition
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'apps.home',  # Enable the inner home (home)
    'apps.doc',
    'ckeditor',
    'guardian',
    'apps.scripts',
    'apps.authentication',
    'reversion',
    'django.contrib.gis'
    
    
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'whitenoise.middleware.WhiteNoiseMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'reversion.middleware.RevisionMiddleware',
]

ROOT_URLCONF = 'core.urls'
LOGIN_REDIRECT_URL = "home"  # Route defined in home/urls.py
LOGOUT_REDIRECT_URL = 'login'  # Route defined in home/urls.py

# Define TEMPLATE_DIR correctly
TEMPLATE_DIR = os.path.join(CORE_DIR, "apps/templates")  

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [TEMPLATE_DIR],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                'apps.context_processors.sidenav_view'
                
                
                
            ],
        },
    },
]

WSGI_APPLICATION = 'core.wsgi.application'

# Database configuration
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'web_ciaprod',
        'USER': 'postgres',
        'PASSWORD': 'postgres',
        'HOST': '10.67.199.139',
        'PORT': '5432',
    },
    'geospatial_db': {
        'ENGINE': 'django.contrib.gis.db.backends.postgis',  # Banco de dados geoespacial
        'NAME': 'projetos_dgeo',
        'USER': 'postgres',
        'PASSWORD': 'postgres',
        'HOST': '10.67.199.196',
        'PORT': '5432',
    }
}

# Password validation
AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

# Internationalization settings
LANGUAGE_CODE = 'pt-br'
TIME_ZONE = 'America/Sao_Paulo'
USE_I18N = True
USE_L10N = True
USE_TZ = True

# Static files (CSS, JavaScript, Images)
STATIC_ROOT = os.path.join(CORE_DIR, 'staticfiles')
STATIC_URL = '/static/'

MEDIA_ROOT = os.path.join(BASE_DIR, 'media')
MEDIA_URL = '/media/'

# Extra places for collectstatic to find static files.
STATICFILES_DIRS = (
    os.path.join(CORE_DIR, 'apps/static'),
)

# settings.py

AUTHENTICATION_BACKENDS = (
    'django.contrib.auth.backends.ModelBackend',  # Backend padrão de autenticação
    'guardian.backends.ObjectPermissionBackend',  # Permissões do Guardian
)

CKEDITOR_CONFIGS = {
    'default': {
        'toolbar': 'full',
        'height': 500,  # Ajuste para a altura desejada (em pixels)
        'width': 1060,   # Define uma largura fixa em pixels
    },
}


