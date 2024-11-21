from dis import Instruction
from pyexpat.errors import messages
from venv import logger
from django.contrib import messages
from django.shortcuts import get_object_or_404, render, redirect
from .forms import CategoryForm, InstructionForm, OrderInstructionsForm, SectionForm, SubcategoryForm, TopicForm, SubtopicForm
from .models import Category, Section, Subcategory, Instruction, Topic, Subtopic
from django.core.paginator import Paginator
from django.db.models import Count
from .models import Section, Category, Subcategory, Instruction, Topic, Subtopic
import reversion
from reversion.models import Version
from datetime import datetime
from django.db import transaction
from django.contrib.auth.decorators import login_required
from reversion.models import Revision
from django.contrib.contenttypes.models import ContentType


def list_section(request):
    # Obtém o termo de busca da query string (se houver)
    search_query = request.GET.get('q', None)
    
    # Obtém todas as seções
    sections = Section.objects.all()
    
    # Aplica o filtro de busca, se houver um termo de busca
    if search_query:
        sections = sections.filter(title__icontains=search_query)  # Filtra pelo título da seção
    
    # Adiciona a paginação
    paginator = Paginator(sections, 3)  # 3 seções por página
    page_number = request.GET.get('page')  # Obtém o número da página da URL
    page_obj = paginator.get_page(page_number)  # Obtém as seções para a página atual

    return render(request, 'section/list.html', {
        'page_obj': page_obj,  # Passa o objeto paginado para o template
        'search_query': search_query,  # Passa a consulta de busca para o template
    })

@reversion.create_revision()  # Inicia o contexto de versão para a criação
def create_section(request):
    if request.method == 'POST':
        form = SectionForm(request.POST, request.FILES)  
        if form.is_valid():
            # Inicia a transação de revisão
            section = form.save(commit=False)  # Salva a instância sem persistir ainda
            reversion.set_user(request.user)  # Registra o usuário que está criando
            reversion.set_comment(f'Seção "{section.title}" criada por {request.user.username}.')  # Comentário sobre a criação
            
            # Salva a instância e adiciona à revisão
            section.save()
            reversion.add_to_revision(section)  # Adiciona a instância à revisão
            
            messages.success(request, f'A seção "{section.title}" foi criada com sucesso!')
            return redirect('list_section')  # Redireciona para a lista de seções após a criação
    else:
        form = SectionForm()

    # Passando None para section na criação
    return render(request, 'section/form.html', {'form': form, 'section': None})

@reversion.create_revision()  # Inicia o contexto de versão
def update_section(request, id):
    section = get_object_or_404(Section, id=id)  
    
    if request.method == 'POST':
        form = SectionForm(request.POST, request.FILES, instance=section)
        if form.is_valid():
            # Salva a versão anterior do objeto
            form.save()

            # Registra o usuário que fez a modificação
            reversion.set_user(request.user)  # Registra o usuário que fez a modificação
            reversion.set_comment(f'Seção "{section.title}" atualizada por {request.user.username}.')  # Comentário com o nome do usuário

            # Mensagem de sucesso
            messages.success(request, 'Seção atualizada com sucesso!')
            return redirect('list_section')  # Redireciona para a lista de seções

    else:
        form = SectionForm(instance=section)
    
    # Passando a seção encontrada para edição
    return render(request, 'section/form.html', {'form': form, 'section': section})

@reversion.create_revision()  # Inicia o contexto de revisão
def delete_section(request, id):
    section = get_object_or_404(Section, id=id)

    if request.method == 'POST':
        with transaction.atomic():  # Garante que todas as operações sejam atômicas
            try:
                # Verificar se a seção está associada a categorias ou subcategorias
                if section.categories.exists():  # Verifica se há categorias associadas
                    messages.warning(request, f'A seção "{section.title}" não pode ser deletada, pois há categorias associadas.')
                    return redirect('list_section')
                
                
                # Registrar o objeto no Reversion antes de excluí-lo
                reversion.set_user(request.user)  # Define o usuário responsável
                reversion.set_comment(f'Seção "{section.title}" deletada.')  # Adiciona um comentário

                section.save()  # Salva o objeto para registrar sua revisão


                # Excluir o objeto após confirmar que a revisão foi salva
                section.delete()

                # Mensagem de sucesso
                messages.success(request, f'A seção "{section.title}" foi deletada com sucesso!')
                return redirect('list_section')

            except Exception as e:
                # Lidar com falhas
                messages.error(request, f"Erro ao deletar a seção: {e}")
                return redirect('list_section')

    return render(request, 'section/delete.html', {'section': section})


def list_category(request, section_id):
    # Obtém a seção com base no ID
    section = get_object_or_404(Section, id=section_id)
    
    # Obtém o termo de busca da query string (se houver)
    search_query = request.GET.get('q', None)
    
    # Obtém as categorias associadas a essa seção
    categories = Category.objects.filter(section=section)
    
    # Aplica o filtro de busca, se houver um termo de busca
    if search_query:
        categories = categories.filter(name__icontains=search_query)  # Filtra pelo nome da categoria
    
    # Adiciona a paginação
    paginator = Paginator(categories, 3)  # 3 categorias por página
    page_number = request.GET.get('page')  # Obtém o número da página da URL
    page_obj = paginator.get_page(page_number)  # Obtém as categorias para a página atual

    return render(request, 'category/list.html', {
        'categories': page_obj,  # Passa o objeto paginado para o template
        'section': section,  # Adiciona a seção ao contexto
        'search_query': search_query,  # Passa a consulta de busca para o template
    })

@login_required
def create_category(request, section_id):
    section = get_object_or_404(Section, id=section_id)  # Obtém a seção com o ID fornecido
    if request.method == 'POST':
        form = CategoryForm(request.POST, request.FILES)
        if form.is_valid():
            category = form.save(commit=False)
            category.section = section  # Associa a categoria à seção
            category.author = request.user  # Associa o autor à categoria
            category.save()
            messages.success(request, f'A seção "{category.name}" foi criada com sucesso!')
            return redirect('list_category', section_id=section.id)  # Redireciona para a lista de categorias
    else:
        form = CategoryForm(section_instance=section)  # Passa a seção como argumento

    return render(request, 'category/form.html', {'form': form, 'section': section})  # Passa a seção para o template

def update_category(request, section_id, id):
    # Obtenha a seção associada ao section_id
    section = get_object_or_404(Section, id=section_id)
    # Obtenha a categoria associada ao id e à seção
    category = get_object_or_404(Category, id=id, section=section)

    if request.method == 'POST':
        form = CategoryForm(request.POST, request.FILES, instance=category)
        if form.is_valid():
            form.save()
            messages.success(request, 'Categoria atualizada com sucesso!')
            # Redirecione para a lista de categorias da seção
            return redirect('list_category', section_id=section.id)
    else:
        form = CategoryForm(instance=category)

    return render(
        request,
        'category/form.html',
        {
            'form': form,
            'category': category,
            'section': section,
        }
    )


@reversion.create_revision()  # Inicia o contexto de revisão
def delete_category(request, id):
    category = get_object_or_404(Category, id=id)
    section_id = category.section.id  # Obtém o ID da seção associada à categoria

    if request.method == 'POST':
        with transaction.atomic():  # Garante que todas as operações sejam atômicas
            try:
                # Verificar se a categoria está associada a subcategorias
                if category.subcategories.exists():  # Use o related_name definido no modelo
                    messages.warning(
                        request,
                        f'A categoria "{category.name}" não pode ser deletada, pois há subcategorias associadas.'
                    )
                    return redirect('list_category', section_id=section_id)
                
                # Registrar o objeto no Reversion antes de excluí-lo
                reversion.set_user(request.user)  # Define o usuário responsável
                reversion.set_comment(f'Categoria "{category.name}" deletada.')  # Adiciona um comentário

                # Excluir a categoria
                category.delete()

                # Mensagem de sucesso
                messages.success(
                    request,
                    f'A categoria "{category.name}" foi deletada com sucesso!'
                )
                return redirect('list_category', section_id=section_id)

            except Exception as e:
                # Lidar com falhas
                messages.error(
                    request,
                    f"Erro ao deletar a categoria: {e.__class__.__name__} - {e}"
                )
                return redirect('list_category', section_id=section_id)

    # Renderiza a página de confirmação de exclusão
    return render(request, 'category/delete.html', {'category': category})


 
def view_category(request, category_id):
    # Obtendo a categoria pelo ID
    category = get_object_or_404(Category, id=category_id)

    # Incrementando o contador de visualizações
    category.view_count += 1
    category.save()

    # Obtendo a seção associada à categoria
    section = category.section

    # Preparando o contexto para o template
    context = {
        'category': category,  # Adicionando a categoria ao contexto
        'section': section,  # Adicionando a seção ao contexto
        'content': category.content,  # Presumindo que haja um campo 'content' no modelo Category
    }

    # Renderizando o template com o contexto
    return render(request, 'category/view.html', context)

def list_subcategory(request, section_id, category_id):
    # Obtém a seção com base no ID
    section = get_object_or_404(Section, id=section_id)
    
    # Obtém a categoria com base no ID
    category = get_object_or_404(Category, id=category_id, section=section)
    
    # Obtém o termo de busca da query string (se houver)
    search_query = request.GET.get('q', None)
    
    # Obtém as subcategorias associadas à categoria
    subcategories_list = Subcategory.objects.filter(category=category)
    
    # Aplica o filtro de busca, se houver um termo de busca
    if search_query:
        subcategories_list = subcategories_list.filter(name__icontains=search_query)  # Filtra pelo nome da subcategoria
    
    # Paginação
    paginator = Paginator(subcategories_list, 3)  # Mostra 3 subcategorias por página
    page_number = request.GET.get('page')
    subcategories = paginator.get_page(page_number)

    return render(request, 'subcategory/list.html', {
        'subcategories': subcategories,
        'category': category,  # Adiciona a categoria ao contexto
        'section': section,    # Adiciona a seção ao contexto (opcional, se precisar)
        'search_query': search_query,  # Passa a consulta de busca para o template
    })

@login_required
def create_subcategory(request, section_id, category_id):
    # Obtém a categoria com o ID fornecido
    category = get_object_or_404(Category, id=category_id)
    # Obtém a seção correspondente
    section = get_object_or_404(Section, id=section_id)

    if request.method == 'POST':
        # Cria o formulário com os dados enviados, passando a categoria e a seção
        form = SubcategoryForm(request.POST, request.FILES, category=category, section=section)
        if form.is_valid():
            subcategory = form.save(commit=False)
            subcategory.category = category  # Associa a subcategoria à categoria
            subcategory.section = section  # Associa a subcategoria à seção
            subcategory.author = request.user  # Associa o autor à subcategoria
            subcategory.save()
            messages.success(request, 'Subcategoria criada com sucesso!')
            # Redireciona para a lista de subcategorias usando a categoria
            return redirect('list_subcategory', section_id=section.id, category_id=category.id)
    else:
        # Inicializa o formulário com a categoria e a seção
        form = SubcategoryForm(category=category, section=section)

    return render(request, 'subcategory/form.html', {'form': form, 'category': category, 'section': section})

def update_subcategory(request, id):
    subcategory = get_object_or_404(Subcategory, id=id)
    
    # Obtém a categoria e a seção associadas à subcategoria
    category = subcategory.category
    section = category.section

    if request.method == 'POST':
        form = SubcategoryForm(request.POST, request.FILES, instance=subcategory)
        if form.is_valid():
            form.save()
            messages.success(request, 'Subcategoria atualizada com sucesso!')
            # Redireciona para a lista de subcategorias usando os IDs da seção e da categoria
            return redirect('list_subcategory', section_id=section.id, category_id=category.id)
    else:
        # Passa a categoria e a seção para o formulário
        form = SubcategoryForm(instance=subcategory, category=category, section=section)

    return render(request, 'subcategory/form.html', {
        'form': form,
        'subcategory': subcategory,
        'category': category,  # Passa a categoria para o template
        'section': section     # Passa a seção para o template
    })

@reversion.create_revision()
def delete_subcategory(request, section_id, category_id, id):
    # Buscar a subcategoria pelo ID
    subcategory = get_object_or_404(Subcategory, id=id)

    # Verificar se a subcategoria está associada a algum conteúdo, como uma instrução
    if subcategory.topics.exists():  # Substitua 'instructions' pelo campo que referencia 'Subcategory'
        messages.warning(request, f'A subcategoria "{subcategory.name}" não pode ser deletada, pois está associada a instruções.')
        return redirect('list_subcategory', section_id=section_id, category_id=category_id)

    # Se for uma requisição POST, prossegue com a exclusão
    if request.method == 'POST':
        with transaction.atomic():  # Usando transação atômica para garantir integridade
            # Registra o usuário e o comentário para a revisão
            reversion.set_user(request.user)
            reversion.set_comment('Subcategoria deletada.')
            
            # Exclui a subcategoria
            subcategory.delete()
            
            # Mensagem de sucesso
            messages.success(request, 'Subcategoria deletada com sucesso!')
            return redirect('list_subcategory', section_id=section_id, category_id=category_id)

    # Caso contrário, redireciona diretamente para a lista de subcategorias
    return redirect('list_subcategory', section_id=section_id, category_id=category_id)



def view_subcategory(request, subcategory_id):
    # Obtendo a subcategoria pelo ID
    subcategory = get_object_or_404(Subcategory, id=subcategory_id)

    # Incrementando o contador de visualizações
    subcategory.view_count += 1
    subcategory.save()

    # Obtendo a categoria e a seção associadas à subcategoria
    section = subcategory.category.section
    category = subcategory.category

    # Preparando o contexto para o template
    context = {
        'subcategory': subcategory,  # Adicionando a subcategoria ao contexto
        'section': section,  # Adicionando a seção ao contexto
        'category': category,  # Adicionando a categoria ao contexto
        'content': subcategory.content,  # Conteúdo do CKEditor
    }

    # Renderizando o template com o contexto
    return render(request, 'subcategory/view.html', context)

def list_instruction(request, section_id, category_id, subcategory_id, topic_id, subtopic_id):
    # Obtém os objetos Section, Category, Subcategory, Topic e Subtopic
    section = get_object_or_404(Section, id=section_id)
    category = get_object_or_404(Category, id=category_id)
    subcategory = get_object_or_404(Subcategory, id=subcategory_id)
    topic = get_object_or_404(Topic, id=topic_id)
    subtopic = get_object_or_404(Subtopic, id=subtopic_id)

    # Obtém o filtro de subfase da query string (se existir)
    subfase_filter = request.GET.get('subfase', None)
    search_query = request.GET.get('q', None)  # Obtém a consulta de busca

    # Filtra as instruções pela subcategoria e subtópico
    instructions = Instruction.objects.filter(subcategory=subcategory, subtopic=subtopic)

    # Aplica o filtro de subfase, se especificado
    if subfase_filter:
        instructions = instructions.filter(subfase=subfase_filter)

    # Aplica a busca, se uma consulta for fornecida
    if search_query:
        instructions = instructions.filter(title__icontains=search_query)  # Filtra por título

    # Obtém as subfases únicas associadas a esta subcategoria e subtópico
    subfases = Instruction.objects.filter(subcategory=subcategory, subtopic=subtopic).values_list('subfase', flat=True).distinct()

    # Adiciona paginação
    paginator = Paginator(instructions, 7)  # 7 instruções por página
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    return render(request, 'instruction/list.html', {
        'section': section,
        'category': category,
        'subcategory': subcategory,
        'topic': topic,  # Passa o tópico para o template, se necessário
        'subtopic': subtopic,  # Passa o subtópico para o template, se necessário
        'instructions': page_obj,
        'subfase_filter': subfase_filter,
        'subfases': subfases,  # Passa as subfases únicas para o template
        'search_query': search_query,  # Passa a consulta de busca para o template
    })


@login_required
def create_instruction(request, section_id, category_id, subcategory_id, topic_id, subtopic_id):
    # Obtém os objetos relacionados diretamente dos IDs fornecidos
    section = get_object_or_404(Section, id=section_id)
    category = get_object_or_404(Category, id=category_id)
    subcategory = get_object_or_404(Subcategory, id=subcategory_id)
    topic = get_object_or_404(Topic, id=topic_id)
    subtopic = get_object_or_404(Subtopic, id=subtopic_id)

    if request.method == 'POST':
        form = InstructionForm(request.POST, request.FILES)
        if form.is_valid():
            instruction = form.save(commit=False)
            # Atribui os objetos relacionados ao novo Instruction
            instruction.section = section
            instruction.category = category
            instruction.subcategory = subcategory
            instruction.topic = topic
            instruction.subtopic = subtopic
            instruction.author = request.user  # Define o autor
            instruction.save()
            messages.success(request, 'Instrução criada com sucesso!')
            return redirect('list_instruction', 
                            section_id=section.id, 
                            category_id=category.id, 
                            subcategory_id=subcategory.id, 
                            topic_id=topic.id, 
                            subtopic_id=subtopic.id)  # Passa os IDs corretamente
    else:
        # Inicializa o formulário com os objetos relacionados
        form = InstructionForm(initial={
            'section': section,
            'category': category,
            'subcategory': subcategory,
            'topic': topic,
            'subtopic': subtopic
        })

    return render(request, 'instruction/form.html', {
        'form': form,
        'instruction': None,  # Para indicar que estamos criando uma nova instrução
        'section': section,  # Passa o objeto Section para o template
        'category': category,
        'subcategory': subcategory,
        'topic': topic,
        'subtopic': subtopic,
    })

    return render(request, 'instruction/form.html', context)

def update_instruction(request, section_id, category_id, subcategory_id, topic_id, subtopic_id, id):
    instruction = get_object_or_404(Instruction, id=id)
    
    # Obtém os objetos relacionados (se necessário para o contexto)
    section = get_object_or_404(Section, id=section_id)
    category = get_object_or_404(Category, id=category_id)
    subcategory = get_object_or_404(Subcategory, id=subcategory_id)
    topic = get_object_or_404(Topic, id=topic_id)
    subtopic = get_object_or_404(Subtopic, id=subtopic_id)

    if request.method == 'POST':
        form = InstructionForm(request.POST, request.FILES, instance=instruction)
        if form.is_valid():
            form.save()
            messages.success(request, 'Instrução atualizada com sucesso!')
            return redirect('list_instruction', 
                            section_id=section_id, 
                            category_id=category_id, 
                            subcategory_id=subcategory_id, 
                            topic_id=topic_id, 
                            subtopic_id=subtopic_id)
    else:
        form = InstructionForm(instance=instruction)

    return render(request, 'instruction/form.html', {
        'form': form,
        'instruction': instruction,
        'section_id': section_id,
        'category_id': category_id,
        'subcategory_id': subcategory_id,
        'topic_id': topic_id,
        'subtopic_id': subtopic_id,
        'section': section,
        'category': category,
        'subcategory': subcategory,
        'topic': topic,
        'subtopic': subtopic,
    })

def delete_instruction(request, section_id, category_id, subcategory_id, topic_id, subtopic_id, id):
    instruction = get_object_or_404(Instruction, id=id)
    if request.method == 'POST':
        instruction.delete()
        messages.success(request, 'Instrução deletada com sucesso!')
        # Redireciona para a lista de instruções, incluindo todos os parâmetros necessários
        return redirect('list_instruction', section_id=section_id, category_id=category_id, subcategory_id=subcategory_id, topic_id=topic_id, subtopic_id=subtopic_id)
    
    # Renderiza o template de confirmação de exclusão
    return render(request, 'instruction/delete.html', {
        'instruction': instruction,
        'section_id': section_id,
        'category_id': category_id,
        'subcategory_id': subcategory_id,
        'topic_id': topic_id,  # Mantido
        'subtopic_id': subtopic_id  # Mantido
    })

def view_instruction(request, section_id, category_id, subcategory_id, topic_id, subtopic_id, instruction_id):
    # Busca a instrução com base no ID
    instruction = get_object_or_404(Instruction, id=instruction_id)

    # Incrementa o contador de visualizações da instrução
    instruction.view_count += 1
    instruction.save()

    # Busca a seção, categoria e subcategoria relacionadas
    section = get_object_or_404(Section, id=section_id)
    category = get_object_or_404(Category, id=category_id, section=section)
    subcategory = get_object_or_404(Subcategory, id=subcategory_id, category=category)

    # Busca o tópico e subtópico relacionados, se existir
    topic = get_object_or_404(Topic, id=topic_id, subcategory=subcategory) if topic_id else None
    subtopic = get_object_or_404(Subtopic, id=subtopic_id, topic=topic) if subtopic_id else None

    # Renderiza o template com os dados da instrução, tópico, subtópico e IDs necessários
    return render(request, 'instruction/view.html', {
        'instruction': instruction,
        'topic': topic,              # Adiciona o tópico ao contexto
        'subtopic': subtopic,        # Adiciona o subtópico ao contexto
        'section': section,          # Adiciona a seção ao contexto
        'category': category,        # Adiciona a categoria ao contexto
        'subcategory': subcategory,  # Adiciona a subcategoria ao contexto
    })

def order_instructions(request, section_id, category_id, subcategory_id, topic_id=None, subtopic_id=None):
    # Filtra as instruções com base em todos os IDs fornecidos
    instructions = Instruction.objects.filter(
        section_id=section_id,
        category_id=category_id,
        subcategory_id=subcategory_id,
        topic_id=topic_id,  # Adicionado para filtrar por tópico
        subtopic_id=subtopic_id  # Adicionado para filtrar por sub-tópico
    ).order_by('order')  # Adicionei a ordenação para garantir que as instruções apareçam na ordem correta.

    if request.method == 'POST':
        # Captura os IDs das instruções na nova ordem
        instruction_ids = request.POST.get('instruction_ids', '').split(',')
        
        # Filtra IDs vazios
        instruction_ids = [id for id in instruction_ids if id.strip()]  # Remove entradas vazias

        if instruction_ids:  # Verifica se a lista não está vazia
            for i, instruction_id in enumerate(instruction_ids):
                try:
                    instruction = Instruction.objects.get(id=instruction_id)
                    instruction.order = i + 1  # Define a ordem a partir de 1
                    instruction.save()
                except Instruction.DoesNotExist:
                    continue  # Ignora caso a instrução não exista
            
            messages.success(request, "A ordem das instruções foi atualizada com sucesso.")
        else:
            messages.error(request, "Nenhuma instrução foi selecionada para atualizar.")

        # Redireciona para a lista de instruções, incluindo todos os IDs necessários
        return redirect('list_instruction', section_id=section_id, category_id=category_id, 
                        subcategory_id=subcategory_id, topic_id=topic_id, subtopic_id=subtopic_id)

    return render(request, 'instruction/order.html', {
        'instructions': instructions,
        'section_id': section_id,
        'category_id': category_id,
        'subcategory_id': subcategory_id,
        'topic_id': topic_id,
        'subtopic_id': subtopic_id
    })

def list_topic(request, section_id, category_id, subcategory_id):
    section = get_object_or_404(Section, id=section_id)
    category = get_object_or_404(Category, id=category_id)
    subcategory = get_object_or_404(Subcategory, id=subcategory_id)

    print(f"Section: {section.id}, Category: {category.id}, Subcategory: {subcategory.id}")

    search_query = request.GET.get('q', None)  # Obtém a consulta de busca
    topics = Topic.objects.filter(subcategory=subcategory)

    # Aplica a busca se uma consulta for fornecida
    if search_query:
        topics = topics.filter(name__icontains=search_query)

    # Adiciona paginação
    paginator = Paginator(topics, 3)  # 3 tópicos por página
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    return render(request, 'topic/list.html', {
        'section': section,
        'category': category,
        'subcategory': subcategory,
        'topics': page_obj,
        'search_query': search_query,
    })


@login_required
def create_topic(request, section_id, category_id, subcategory_id):
    section = get_object_or_404(Section, id=section_id)
    category = get_object_or_404(Category, id=category_id)
    subcategory = get_object_or_404(Subcategory, id=subcategory_id)
    
    if request.method == 'POST':
        form = TopicForm(request.POST, request.FILES)
        if form.is_valid():
            topic = form.save(commit=False)
            topic.section = section
            topic.category = category
            topic.subcategory = subcategory
            topic.author = request.user  # Define o autor como o usuário logado
            topic.save()
            messages.success(request, 'Tópico criado com sucesso!')
            return redirect('list_topic', section_id=section_id, category_id=category_id, subcategory_id=subcategory_id)
        else:
            print(form.errors)  # Para depuração dos erros do formulário
    else:
        initial_data = {
            'section': section,
            'category': category,
            'subcategory': subcategory,
        }
        form = TopicForm(initial=initial_data)

    return render(request, 'topic/form.html', {
        'form': form,
        'topic': None,
        'section': section,
        'category': category,
        'subcategory': subcategory,
    })

def update_topic(request, section_id, category_id, subcategory_id, id):
    topic = get_object_or_404(Topic, id=id)

    # Busca as instâncias de Section, Category e Subcategory
    section = get_object_or_404(Section, id=section_id)
    category = get_object_or_404(Category, id=category_id)
    subcategory = get_object_or_404(Subcategory, id=subcategory_id)
    
    if request.method == 'POST':
        form = TopicForm(request.POST, request.FILES, instance=topic)
        if form.is_valid():
            form.save()
            messages.success(request, 'Tópico atualizado com sucesso!')
            return redirect('list_topic', section_id=section_id, category_id=category_id, subcategory_id=subcategory_id)
    else:
        form = TopicForm(instance=topic)

    return render(request, 'topic/form.html', {
        'form': form,
        'topic': topic,
        'section': section,  # Adicionando a seção
        'category': category,  # Adicionando a categoria
        'subcategory': subcategory,  # Adicionando a subcategoria
    })

# Deletar Tópico

def delete_topic(request, section_id, category_id, subcategory_id, id):
    # Buscar o tópico pelo ID
    topic = get_object_or_404(Topic, id=id)
    
    # Verificar se o tópico está associado a subitens (subtópicos)
    if topic.subtopics.exists():  # Usando o relacionamento inverso para acessar subtópicos relacionados
        messages.warning(request, f'O tópico "{topic.name}" não pode ser deletado, pois está associado a subtópicos.')
        return redirect('list_topic', section_id=section_id, category_id=category_id, subcategory_id=subcategory_id)
    
    # Verificar se a requisição é do tipo POST (enviado o formulário de exclusão)
    if request.method == 'POST':
        topic.delete()  # Deleta o tópico
        messages.success(request, 'Tópico deletado com sucesso!')
        return redirect('list_topic', section_id=section_id, category_id=category_id, subcategory_id=subcategory_id)
    
    # Caso contrário, renderiza a página de confirmação de exclusão
    return render(request, 'topic/delete.html', {
        'topic': topic,
        'section_id': section_id,
        'category_id': category_id,
        'subcategory_id': subcategory_id
    })

# Visualizar Tópico
def view_topic(request, topic_id):
    # Recupera o tópico com base no ID
    topic = get_object_or_404(Topic, id=topic_id)

    # Incrementa o contador de visualizações do tópico
    topic.view_count += 1
    topic.save()

    # Recupera a subcategoria, categoria e seção relacionadas
    subcategory = topic.subcategory  # Supondo que Topic tem um campo subcategory
    category = subcategory.category  # Supondo que Subcategory tem um campo category
    section = category.section      # Supondo que Category tem um campo section

    # Contexto para passar os dados para o template
    context = {
        'topic': topic,
        'subcategory': subcategory,
        'category': category,
        'section': section,
    }

    return render(request, 'topic/view.html', context)


@login_required
def create_subtopic(request, section_id, category_id, subcategory_id, topic_id):
    section = get_object_or_404(Section, id=section_id)
    category = get_object_or_404(Category, id=category_id)
    subcategory = get_object_or_404(Subcategory, id=subcategory_id)
    topic = get_object_or_404(Topic, id=topic_id)

    if request.method == 'POST':
        form = SubtopicForm(request.POST, request.FILES)
        if form.is_valid():
            subtopic = form.save(commit=False)
            subtopic.section = section
            subtopic.category = category
            subtopic.subcategory = subcategory
            subtopic.topic = topic
            subtopic.author = request.user  # Define o autor como o usuário logado
            subtopic.save()
            messages.success(request, 'Subtópico criado com sucesso!')
            return redirect('list_subtopic', section_id=section_id, category_id=category_id, subcategory_id=subcategory_id, topic_id=topic_id)
    else:
        initial_data = {
            'section': section,
            'category': category,
            'subcategory': subcategory,
            'topic': topic,
        }
        form = SubtopicForm(initial=initial_data)

    return render(request, 'subtopic/form.html', {
        'form': form,
        'subtopic': None,
        'section': section,
        'category': category,
        'subcategory': subcategory,
        'topic': topic,
    })

@reversion.create_revision()  # Inicia o contexto de versão
def update_subtopic(request, section_id, category_id, subcategory_id, topic_id, id):
    subtopic = get_object_or_404(Subtopic, id=id)
    section = get_object_or_404(Section, id=section_id)
    category = get_object_or_404(Category, id=category_id)
    subcategory = get_object_or_404(Subcategory, id=subcategory_id)
    topic = get_object_or_404(Topic, id=topic_id)

    if request.method == 'POST':
        form = SubtopicForm(request.POST, request.FILES, instance=subtopic)
        if form.is_valid():
            # Salva a versão anterior do objeto
            form.save()

            # Registra o usuário que fez a modificação
            reversion.set_user(request.user)
            reversion.set_comment('Subtópico atualizado.')  # Comenta a alteração

            messages.success(request, 'Subtópico atualizado com sucesso!')
            return redirect('list_subtopic', section_id=section_id, category_id=category_id, subcategory_id=subcategory_id, topic_id=topic_id)
    else:
        form = SubtopicForm(instance=subtopic)

    return render(request, 'subtopic/form.html', {
        'form': form,
        'subtopic': subtopic,
        'section': section,
        'category': category,
        'subcategory': subcategory,
        'topic': topic,
    })

@reversion.create_revision()
def delete_subtopic(request, section_id, category_id, subcategory_id, topic_id, id):
    # Buscar o subtópico pelo ID
    subtopic = get_object_or_404(Subtopic, id=id)

    # Verificar se o subtópico está associado a algum conteúdo, como uma instrução
    if subtopic.instructions.exists():  # Substitua 'instructions' pelo campo que referencia 'Subtopic'
        messages.warning(request, f'O subtópico "{subtopic.name}" não pode ser deletado, pois está associado a instruções.')
        return redirect('list_subtopic', section_id=section_id, category_id=category_id, subcategory_id=subcategory_id, topic_id=topic_id)

    # Se for uma requisição POST, prossegue com a exclusão
    if request.method == 'POST':
        with transaction.atomic():  # Usando transação atômica para garantir integridade
            # Registra o usuário e o comentário para a revisão
            reversion.set_user(request.user)
            reversion.set_comment('Subtópico deletado.')
            
            # Exclui o subtópico
            subtopic.delete()
            
            # Mensagem de sucesso
            messages.success(request, 'Subtópico deletado com sucesso!')
            return redirect('list_subtopic', section_id=section_id, category_id=category_id, subcategory_id=subcategory_id, topic_id=topic_id)

    # Caso contrário, redireciona diretamente para a lista de subtópicos
    return redirect('list_subtopic', section_id=section_id, category_id=category_id, subcategory_id=subcategory_id, topic_id=topic_id)

def list_subtopic(request, section_id, category_id, subcategory_id, topic_id):
    topic = get_object_or_404(Topic, id=topic_id)
    subtopics = Subtopic.objects.filter(topic=topic)

    # Carregando as seções, categorias e subcategorias
    section = get_object_or_404(Section, id=section_id)
    category = get_object_or_404(Category, id=category_id)
    subcategory = get_object_or_404(Subcategory, id=subcategory_id)

    # Obter o termo de busca da query string
    search_query = request.GET.get('q', None)

    # Se houver um termo de busca, filtramos os subtópicos pelo nome
    if search_query:
        subtopics = subtopics.filter(name__icontains=search_query)

    # Paginando os subtópicos
    paginator = Paginator(subtopics, 3)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    # Obtendo as versões válidas do subtópico
    subtopic_versions = []
    for subtopic in subtopics:
        versions = reversion.models.Version.objects.get_for_object(subtopic)
        for version in versions:
            if version.object_id:  # Garantir que o subtópico está associado à versão
                subtopic_versions.append(version)

    return render(request, 'subtopic/list.html', {
        'subtopics': page_obj,
        'topic': topic,
        'section': section,
        'category': category,
        'subcategory': subcategory,
        'section_id': section_id,
        'category_id': category_id,
        'subcategory_id': subcategory_id,
        'search_query': search_query,
        'subtopic_versions': subtopic_versions,  # Passa as versões para o template
    })


def view_subtopic(request, section_id, category_id, subcategory_id, topic_id, subtopic_id):
    # Recupera a seção, categoria, subcategoria, tópico e subtópico com base nos IDs
    section = get_object_or_404(Section, id=section_id)
    category = get_object_or_404(Category, id=category_id)
    subcategory = get_object_or_404(Subcategory, id=subcategory_id)
    topic = get_object_or_404(Topic, id=topic_id)
    subtopic = get_object_or_404(Subtopic, id=subtopic_id)

    # Incrementa o contador de visualizações do subtópico
    subtopic.view_count += 1
    subtopic.save()

    # Obter o histórico de versões do subtópico
    versions = Version.objects.get_for_object(subtopic)

    # Verifica se há filtros de data
    start_date = request.GET.get('start_date')
    end_date = request.GET.get('end_date')

    # Filtro para a data inicial (start_date)
    if start_date:
        try:
            start_date = datetime.strptime(start_date, '%Y-%m-%d')  # Converte a data para datetime
            versions = versions.filter(revision__date_created__gte=start_date)  # Filtro para data inicial
        except ValueError:
            versions = versions.none()  # Caso a data esteja no formato incorreto

    # Filtro para a data final (end_date)
    if end_date:
        try:
            end_date = datetime.strptime(end_date, '%Y-%m-%d')  # Converte a data para datetime
            versions = versions.filter(revision__date_created__lte=end_date)  # Filtro para data final
        except ValueError:
            versions = versions.none()  # Caso a data esteja no formato incorreto

    # Paginação: configura o Paginator e obtém a página atual
    paginator = Paginator(versions, 3)  # 3 versões por página (ajuste conforme necessário)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    # Renderiza o template com as variáveis necessárias
    return render(request, 'subtopic/view.html', {
        'section': section,
        'category': category,
        'subcategory': subcategory,
        'topic': topic,
        'subtopic': subtopic,
        'page_obj': page_obj,  # Passa o objeto de página com as versões paginadas
    })

@reversion.create_revision()
def restore_subtopic(request, subtopic_id, version_id):
    print(f"Metodo da requisição: {request.method}")  # Adicione isso
    subtopic = get_object_or_404(Subtopic, id=subtopic_id)

    if request.method == 'GET':
        # Executa restauração
        try:
            version = reversion.models.Version.objects.get(id=version_id, object_id=subtopic.id)
            print(f"Versão encontrada: {version}")
        except reversion.models.Version.DoesNotExist:
            messages.error(request, 'Versão não encontrada.')
            return redirect('view_subtopic', subtopic_id=subtopic_id)

        # Restaura a versão
        version.revision.revert()
        reversion.set_user(request.user)
        reversion.set_comment('Versão restaurada.')
        messages.success(request, 'Versão restaurada com sucesso!')

        return redirect('view_subtopic', 
                         section_id=subtopic.topic.category.section.id, 
                         category_id=subtopic.topic.category.id,
                         subcategory_id=subtopic.topic.subcategory.id,
                         topic_id=subtopic.topic.id,
                         subtopic_id=subtopic.id)

    # Se o método não for POST, redireciona para a lista de subtópicos
    return redirect('list_subtopic', 
                    section_id=subtopic.topic.category.section.id, 
                    category_id=subtopic.topic.category.id,
                    subcategory_id=subtopic.topic.subcategory.id,
                    topic_id=subtopic.topic.id)







