import folium
import geopandas as gpd
from sqlalchemy import create_engine
from shapely.geometry import Polygon
from django.shortcuts import render
import streamlit as st

# Função para estabelecer a conexão com o banco de dados
def get_db_engine():
    db_url = "postgresql+psycopg2://postgres:postgres@10.67.199.139:5432/projetos_dgeo"
    engine = create_engine(db_url)
    return engine

# Função para consultar dados geoespaciais e retornar um GeoDataFrame
def get_geospatial_data():
    engine = get_db_engine()
    query = 'SELECT * FROM public."Projetos_5CGEO_2021"'  # Carregar todos os dados
    gdf = gpd.read_postgis(query, con=engine)  # Carregar dados diretamente como geometrias

    # Garantir que a coluna de geometria seja corretamente definida
    gdf.set_geometry('geom', inplace=True)  # Ajuste conforme o nome da coluna de geometria

    return gdf

# Função para gerar o mapa com os polígonos e checkboxes
def create_map(request):
    gdf = get_geospatial_data()  # Carregar os dados geoespaciais

    # Criar o mapa base (OpenStreetMap)
    m = folium.Map(location=[-23.550520, -46.633308], zoom_start=12)  # Posição inicial do mapa (São Paulo)

    # Dicionário para armazenar camadas de projetos e contagem de IDs únicos por projeto
    project_layers = {}
    project_counts = {}  # Para contar o número de IDs únicos por projeto

    # Seletor de filtros (interativo, caso esteja usando Streamlit)
    st.sidebar.subheader("Filtros de Projetos")

    projetos = gdf['projeto'].dropna().unique()  # Obter projetos disponíveis
    projeto_selecionado = st.sidebar.selectbox("Selecione o Projeto:", ["Todos"] + list(projetos))

    # Adicionar os polígonos ao mapa organizados por projeto
    for _, row in gdf.iterrows():
        geom = row['geom']
        projeto = row.get('projeto', None)  # Nome do projeto
        id_projeto = row.get('id', None)  # ID do projeto (ou qualquer identificador único)

        if geom is not None and geom.geom_type == 'Polygon' and (projeto_selecionado == "Todos" or projeto == projeto_selecionado):
            # Criar popup com atributos
            popup_content = f"""
            <strong>ID:</strong> {id_projeto}<br>
            <strong>PIT:</strong> {row.get('pit', 'N/A')}<br>
            <strong>Meta:</strong> {row.get('meta', 'N/A')}<br>
            <strong>Projeto:</strong> {projeto}<br>
            """
            popup = folium.Popup(popup_content, max_width=300)

            # Contar o número de IDs únicos por projeto
            if projeto not in project_counts:
                project_counts[projeto] = set()  # Usando set para garantir que os IDs sejam únicos
            project_counts[projeto].add(id_projeto)  # Adiciona o ID ao set (garante unicidade)

            # Adicionar camada para o projeto, se não existir
            if projeto not in project_layers:
                project_layers[projeto] = folium.FeatureGroup(name=f"{projeto} ({len(project_counts[projeto])})")
                m.add_child(project_layers[projeto])  # Adicionar ao mapa

            # Atualizar o nome da camada com a contagem de IDs únicos de 'projeto'
            project_layers[projeto].name = f"{projeto} ({len(project_counts[projeto])})"

            # Estilo de cor para os polígonos
            style = {
                'fillColor': '#ff7800',  # Cor de preenchimento do polígono
                'color': '#000000',  # Cor da borda
                'weight': 2,  # Peso da borda
                'opacity': 0.5  # Opacidade da borda
            }

            # Adicionar o polígono à camada correspondente
            folium.GeoJson(
                geom.__geo_interface__,
                popup=popup,
                style_function=lambda x: style
            ).add_to(project_layers[projeto])

    # Adicionar o controle de camadas (checkboxes) com a contagem de projetos
    folium.LayerControl(collapsed=False).add_to(m)

    # Gerar o mapa como uma string HTML
    map_html = m._repr_html_()  # Método para obter o HTML gerado

    # Incluir o script JavaScript para desmarcar todos os checkboxes

    return map_html

# View para renderizar o mapa no navegador
def nearby_locations(request):
    # Criar o mapa com os polígonos
    map_html = create_map(request)
    
    # Renderizar o mapa no template
    return render(request, 'geoproj/proj.html', {'map_html': map_html})
