from dis import Instruction
from pyexpat.errors import messages
from django.contrib import messages
from django.shortcuts import get_object_or_404, render, redirect
from .forms import CategoryForm, InstructionForm, OrderInstructionsForm, SectionForm, SubcategoryForm, TopicForm, SubtopicForm
from .models import Category, Section, Subcategory, Instruction, Topic, Subtopic
from django.core.paginator import Paginator
from django.db.models import Count
from .models import Section, Category, Subcategory, Instruction, Topic, Subtopic



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

def create_section(request):
    if request.method == 'POST':
        form = SectionForm(request.POST, request.FILES)  
        if form.is_valid():
            form.save()
            return redirect('list_section')  
    else:
        form = SectionForm()
    
    # Passando None para section na criação
    return render(request, 'section/form.html', {'form': form, 'section': None})

def update_section(request, id):
    section = get_object_or_404(Section, id=id)  
    if request.method == 'POST':
        form = SectionForm(request.POST, request.FILES, instance=section)
        if form.is_valid():
            form.save()
            return redirect('list_section')
    else:
        form = SectionForm(instance=section)
    
    # Passando a seção encontrada para edição
    return render(request, 'section/form.html', {'form': form, 'section': section})

def delete_section(request, id):
    section = get_object_or_404(Section, id=id)
    if request.method == 'POST':
        section.delete()
        messages.success(request, f'A seção "{section.title}" foi deletada com sucesso!')
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

def create_category(request, section_id):
    section = get_object_or_404(Section, id=section_id)  # Obtém a seção com o ID fornecido
    if request.method == 'POST':
        form = CategoryForm(request.POST, request.FILES)
        if form.is_valid():
            category = form.save(commit=False)
            category.section = section  # Associa a categoria à seção
            category.save()
            return redirect('list_category', section_id=section.id)  # Redireciona para a lista de categorias
    else:
        form = CategoryForm(section_instance=section)  # Passa a seção como argumento

    return render(request, 'category/form.html', {'form': form, 'section': section})  # Passa a seção para o template

def update_category(request, id):
    category = get_object_or_404(Category, id=id)
    if request.method == 'POST':
        form = CategoryForm(request.POST, request.FILES, instance=category)
        if form.is_valid():
            form.save()
            messages.success(request, 'Categoria atualizada com sucesso!')
            # Certifique-se de passar o ID da seção associada à categoria
            return redirect('list_category', section_id=category.section.id)
    else:
        form = CategoryForm(instance=category)

    return render(request, 'category/form.html', {'form': form, 'category': category})

def delete_category(request, id):
    category = get_object_or_404(Category, id=id)
    section_id = category.section.id  # Obtém o ID da seção associada à categoria

    if request.method == 'POST':
        category.delete()  # Exclui a categoria
        return redirect('list_category', section_id=section_id)  # Redireciona para a lista de categorias da seção

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

def delete_subcategory(request, id):
    subcategory = get_object_or_404(Subcategory, id=id)
    category_id = subcategory.category.id  # Obtém o ID da categoria associada à subcategoria
    section_id = subcategory.category.section.id  # Obtém o ID da seção associada à categoria

    if request.method == 'POST':
        subcategory.delete()  # Exclui a subcategoria
        messages.success(request, 'Subcategoria excluída com sucesso!')
        return redirect('list_subcategory', section_id=section_id, category_id=category_id)  # Redireciona para a lista de subcategorias da categoria

    return render(request, 'subcategory/delete.html', {'subcategory': subcategory})  # Passa a subcategoria para o template

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


def create_instruction(request, section_id, category_id, subcategory_id, topic_id=None, subtopic_id=None):
    # Obtém os objetos correspondentes a partir dos IDs fornecidos
    section = get_object_or_404(Section, id=section_id)
    category = get_object_or_404(Category, id=category_id)
    subcategory = get_object_or_404(Subcategory, id=subcategory_id)
    topic = get_object_or_404(Topic, id=topic_id) if topic_id else None
    subtopic = get_object_or_404(Subtopic, id=subtopic_id) if subtopic_id else None
    
    if request.method == 'POST':
        form = InstructionForm(request.POST, request.FILES)
        if form.is_valid():
            instruction = form.save(commit=False)
            # Atribui os objetos relacionados ao novo Instruction
            instruction.section = section
            instruction.category = category
            instruction.subcategory = subcategory
            instruction.topic = topic  # Certifique-se de que o modelo Instruction tenha este campo
            instruction.subtopic = subtopic  # E este campo também
            instruction.author = request.user
            instruction.save()
            # Redireciona para a lista de instruções, incluindo todos os parâmetros necessários
            return redirect('list_instruction', 
                            section_id=section_id, 
                            category_id=category_id, 
                            subcategory_id=subcategory_id, 
                            topic_id=topic_id, 
                            subtopic_id=subtopic_id)
    else:
        # Preencher os campos automaticamente no formulário
        initial_data = {
            'section': section,
            'category': category,
            'subcategory': subcategory,
            'topic': topic,
            'subtopic': subtopic,
        }
        form = InstructionForm(initial=initial_data)

    context = {
        'form': form,
        'instruction': None,  # Esta variável é None porque estamos criando uma nova instrução
        'section_id': section.id,
        'category_id': category.id,
        'subcategory_id': subcategory.id,
        'topic_id': topic.id if topic else None,
        'subtopic_id': subtopic.id if subtopic else None,
    }

    return render(request, 'instruction/form.html', context)

def update_instruction(request, section_id, category_id, subcategory_id, topic_id, subtopic_id, id):
    instruction = get_object_or_404(Instruction, id=id)
    
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
        'subtopic_id': subtopic_id
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


# Criar Tópico
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
    topic = get_object_or_404(Topic, id=id)
    
    if request.method == 'POST':
        topic.delete()
        messages.success(request, 'Tópico deletado com sucesso!')
        return redirect('list_topic', section_id=section_id, category_id=category_id, subcategory_id=subcategory_id)
    
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

def update_subtopic(request, section_id, category_id, subcategory_id, topic_id, id):
    subtopic = get_object_or_404(Subtopic, id=id)
    section = get_object_or_404(Section, id=section_id)
    category = get_object_or_404(Category, id=category_id)
    subcategory = get_object_or_404(Subcategory, id=subcategory_id)
    topic = get_object_or_404(Topic, id=topic_id)

    if request.method == 'POST':
        form = SubtopicForm(request.POST, request.FILES, instance=subtopic)
        if form.is_valid():
            form.save()
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

def delete_subtopic(request, section_id, category_id, subcategory_id, topic_id, id):
    subtopic = get_object_or_404(Subtopic, id=id)

    if request.method == 'POST':
        subtopic.delete()
        messages.success(request, 'Subtópico deletado com sucesso!')
        return redirect('list_subtopic', section_id=section_id, category_id=category_id, subcategory_id=subcategory_id, topic_id=topic_id)

    return render(request, 'subtopic_confirm_delete.html', {
        'subtopic': subtopic,
        'section_id': section_id,
        'category_id': category_id,
        'subcategory_id': subcategory_id,
        'topic_id': topic_id,
    })

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
        subtopics = subtopics.filter(name__icontains=search_query)  # Filtra pelo nome do subtópico

    # Adiciona paginação
    paginator = Paginator(subtopics, 3)  # 3 subtópicos por página
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    return render(request, 'subtopic/list.html', {
        'subtopics': page_obj,  # Passa os subtópicos paginados
        'topic': topic,
        'section': section,
        'category': category,
        'subcategory': subcategory,
        'section_id': section_id,
        'category_id': category_id,
        'subcategory_id': subcategory_id,
        'search_query': search_query,  # Passa o termo de busca para o template
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

    # Renderiza o template com as variáveis necessárias
    return render(request, 'subtopic/view.html', {
        'section': section,
        'category': category,
        'subcategory': subcategory,
        'topic': topic,
        'subtopic': subtopic,
    })





