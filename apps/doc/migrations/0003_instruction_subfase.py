# Generated by Django 3.2.6 on 2024-10-27 15:22

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('doc', '0002_auto_20241026_1751'),
    ]

    operations = [
        migrations.AddField(
            model_name='instruction',
            name='subfase',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
    ]
