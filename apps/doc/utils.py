from django.shortcuts import get_object_or_404

def increment_view_count(model, pk):
    """
    Função para incrementar o contador de visualizações de um objeto de um modelo.
    """
    try:
        # Recupera o objeto pelo ID (pk)
        obj = get_object_or_404(model, pk=pk)
        
        # Incrementa o contador de visualizações
        obj.view_count += 1
        
        # Salva as alterações no banco de dados
        obj.save()
        
        return obj.view_count
    except model.DoesNotExist:
        return None
