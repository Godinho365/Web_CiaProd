# Generated by Django 3.2.6 on 2024-10-27 17:34

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('doc', '0003_instruction_subfase'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='instruction',
            options={'ordering': ['order']},
        ),
        migrations.AddField(
            model_name='instruction',
            name='order',
            field=models.IntegerField(default=0),
        ),
    ]
