# Generated by Django 3.2.6 on 2024-10-28 21:48

import ckeditor.fields
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('doc', '0004_auto_20241027_1434'),
    ]

    operations = [
        migrations.CreateModel(
            name='Topic',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('content', ckeditor.fields.RichTextField(blank=True, null=True)),
                ('order', models.PositiveIntegerField(default=0)),
                ('imagem', models.ImageField(blank=True, null=True, upload_to='topic_imagens/')),
                ('category', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='topics', to='doc.category')),
                ('section', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='topics', to='doc.section')),
                ('subcategory', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='topics', to='doc.subcategory')),
            ],
            options={
                'ordering': ['order'],
            },
        ),
        migrations.AddField(
            model_name='instruction',
            name='topic',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, related_name='instructions', to='doc.topic'),
            preserve_default=False,
        ),
    ]
