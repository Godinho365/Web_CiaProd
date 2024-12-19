import geopandas as gpd
from sqlalchemy import create_engine
import matplotlib.pyplot as plt
from shapely.geometry import Point

# Função para estabelecer a conexão com o banco de dados
def get_db_engine():
    db_url = "postgresql+psycopg2://postgres:postgres@10.67.199.139:5432/projetos_dgeo"
    engine = create_engine(db_url)
    return engine

# Função para consultar dados geoespaciais e retornar um GeoDataFrame
def get_geospatial_data():
    engine = get_db_engine()
    query = 'SELECT * FROM public."Projetos_5CGEO_2021"'  # Carregar todos os dados
    gdf = gpd.read_postgis(query, con=engine)  # Carregar dados como texto

    # Converter a coluna de WKT para geometria
    gdf['geometry'] = gpd.GeoSeries.from_wkt(gdf['geom'])  # 'geom' é o nome da coluna WKT
    gdf.set_geometry('geometry', inplace=True)  # Definir a coluna de geometria
    
    # Verificar se as geometrias foram convertidas corretamente
    print(gdf['geometry'].head())
    
    return gdf

# Função para visualizar o polígono
def plot_geospatial_data():
    gdf = get_geospatial_data()  # Carregar os dados geoespaciais
    
    # Plotar o GeoDataFrame
    ax = gdf.plot()  # Plotar as geometrias
    ax.set_title("Visualização de Polígonos Geoespaciais")  # Título do gráfico
    plt.show()  # Exibir o gráfico

# Chamar a função de plotagem
plot_geospatial_data()
