import json
import folium
import h3
import geopandas as gpd
import os
from shapely.geometry import Point, Polygon
from geopy.geocoders import Nominatim
from geopy.exc import GeocoderTimedOut
from geopy.distance import geodesic as GD
from operator import itemgetter

# Célula Final! 

# Limite do Recife
latitude_min = -8.157051
latitude_max = -7.926227
longitude_min = -35.017505
longitude_max = -34.862642

# Definir resolução H3 (nível de detalhe)
resolucao_h3 = 7

# Gerar hexágonos H3 para a cidade de Recife
hexagonos = h3.polyfill_polygon(
    [[longitude_min, latitude_min],
     [longitude_min, latitude_max],
     [longitude_max, latitude_max],
     [longitude_max, latitude_min],
     [longitude_min, latitude_min]],
    resolucao_h3
)

# Criar o mapa centrado em Recife
mapa = folium.Map(location=[(latitude_min + latitude_max) / 2, (longitude_min + longitude_max) / 2], zoom_start=12)

# Adicionar camada de mapa base do OpenStreetMap
folium.TileLayer('openstreetmap').add_to(mapa)

# Converter os hexágonos H3 em GeoJSON
hexagonos_geojson = {'type': 'FeatureCollection', 'features': []}
for hexagono in hexagonos:
    coordenadas_hexagono = h3.h3_to_geo_boundary(hexagono)
    hexagono_geojson = {'type': 'Feature', 'geometry': {'type': 'Polygon', 'coordinates': [coordenadas_hexagono]}}
    hexagonos_geojson['features'].append(hexagono_geojson)

# Função para ajustar o tamanho dos hexágonos de acordo com o nível de zoom
def ajustar_tamanho_hexagonos(e):
    zoom = e['target'].options['zoom']
    escala = zoom / 12  # Ajuste o valor para controlar o tamanho dos hexágonos
    for feature in mapa.get_root().find_all('path'):
        feature['stroke-width'] = escala

# Adicionar manipulador de evento de zoom
mapa.add_child(folium.features.MacroElement().add_to(mapa))
mapa.get_root().html.add_child(folium.Element('<script>{map_name}.on("zoomend", function(e) {{ ajustar_tamanho_hexagonos(e); }});</script>'.format(map_name=mapa.get_name())))

# caminho_pasta = "H3" 

# os.chdir(caminho_pasta)

with open('bairros_recife.geojson', encoding='utf-8') as f:
    data = json.load(f)

gdf = gpd.read_file('bairros_recife.geojson', encoding='utf-8')

folium.GeoJson(hexagonos_geojson,
               style_function=lambda x: {'color': 'blue', 'fillColor': 'blue', 'fillOpacity': 0.2},
               highlight_function=lambda x: {'weight': 3, 'color': 'black'}).add_to(mapa)

# Leitura do arquivo geojson dos bairros
with open('bairros_recife.geojson', encoding='utf-8') as f:
    data = json.load(f)

# Extrair as coordenadas dos bairros
bairros = data['features']
coordenadas_bairros = []
for bairro in bairros:
    coordenadas = bairro['geometry']['coordinates'][0][0]
    coordenadas_bairros.append(coordenadas)

# Função que coleta as informações (latitude e longitude) sobre determinado bairro
def geoLocalizador(bairro):
    
    geoLocalizador = Nominatim(user_agent="my_user_agent")
    localizacao = bairro + ", Recife, Pernambuco, Brasil"

    try:

        dadosEndereco = geoLocalizador.geocode(localizacao, timeout=None)
        return dadosEndereco

    except GeocoderTimedOut as e:
        
        print("Erro: Geocode falhou no input %s com a mensagem %s"%(localizacao, e.message))

# Função para calcular a distância entre duas coordenadas
def calcularDistancia(lat1, lon1, lat2, lon2):
    
    distancia = round(GD([lat1, lon1],[lat2, lon2]).km, 3)

    return distancia

# Função para solicitar a carona
def encontrarCoordenadas(partidaLocal, destinoLocal):

    # Salvar os dados do ponto de partida    
    dadosPartida = geoLocalizador(partidaLocal)

    # Salvar a latitude do ponto de partida
    partidaLatitude = dadosPartida.latitude
    # Salvar a longitude do ponto de partida
    partidaLongitude = dadosPartida.longitude

    # Exibir a localização de partida
    print("Localização do Local de Partida:", partidaLatitude, partidaLongitude)
    
    # Salvar os dados do ponto de destino
    dadosDestino = geoLocalizador(destinoLocal)

    # Salvar a latitude do ponto de destino
    destinoLatitude = dadosDestino.latitude
    # Salvar a longitude do ponto de partida
    destinoLongitude = dadosDestino.longitude

    # Exibir a localização de destino
    print("Localização do Local de Destino:", destinoLatitude, destinoLongitude)

    # Chamar a função marcarMapa(), responsável por marcar as coordenadas de partida e destino no mapa, além de traçar uma linha entre elas
    # marcarMapa(partidaLatitude, partidaLongitude, destinoLatitude, destinoLongitude)

    # Salvar uma lista de listas contendo o local, a latitude e a longitude de partida e de destino
    resultado = [[partidaLocal,partidaLatitude, partidaLongitude],
                 [destinoLocal,destinoLatitude, destinoLongitude]]

    # Retornar a lista de listas contendo as informações sobre os pontos de partida e destino
    return resultado

#Marca os pontos no mapa e traça uma linha entre eles
def marcarMapa(partidaLatitude, partidaLongitude, destinoLatitude, destinoLongitude):

    # Criar marcador para a localização de partida
    folium.Marker(
        location=[partidaLatitude, partidaLongitude],
        icon=folium.Icon(color='blue', icon='user')
    ).add_to(mapa)

    # Criar marcador para a localização de destino
    folium.Marker(
        location=[destinoLatitude, destinoLongitude],
        icon=folium.Icon(color='purple', icon='car')
    ).add_to(mapa)

    # Criar uma linha vermelha entre o ponto de partida e destino
    folium.PolyLine(
        locations=[[destinoLatitude, destinoLongitude], [partidaLatitude, partidaLongitude]],
        color='red',
        weight=2
    ).add_to(mapa)

# Função para marcar no mapa o destino inserido pelo usuário
def encontrarCaronas(infoLocais):

    # Geração de hexágono do bairro de destino        
    hexagon_dest = h3.geo_to_h3(infoLocais[1][1], infoLocais[1][2], 7)

    # Conversão dos vértices do hexágono para pontos geográficos no mapa (latitude e longitude)
    hex_converted = h3.h3_to_geo_boundary(hexagon_dest , geo_json=True)

    hex_conv_geoj =  {'type': 'Feature', 'geometry': {'type': 'Polygon', 'coordinates': [hex_converted]}}
    folium.GeoJson(hex_conv_geoj,
               style_function=lambda x: {'color': 'yellow', 'fillColor': 'yellow', 'fillOpacity': 0.4},
               highlight_function=lambda x: {'weight': 3, 'color': 'black'}).add_to(mapa)
    
    # Conversão das coordenadas que vieram invertidas no GeoJSON
    bairros_converted = data['features']
    coordenadas_bairros = []
    for bairro in bairros_converted:
        nomes = bairro['properties']['bairro_nome_ca']
        coordenada_x = bairro['geometry']['coordinates'][0][0][0] 
        coordenada_y = bairro['geometry']['coordinates'][0][0][1]
        coordenadas_bairros.append([nomes, coordenada_y, coordenada_x])
    coords_corrigidas = []

    for coord in hex_converted:
        coords_corrigidas.append((coord[1], coord[0]))

    # Geração de polígono com vértices do héxagono do bairro de destino
    poly = Polygon(coords_corrigidas)

    # Variável que armazena bairros encontrados ao redor do bairro de destino
    bairros_na_area = []

    # Adicionar o bairro de destino na lista de bairros próximos
    bairros_na_area.append([infoLocais[1][0], 0.000])

    # Encontrar bairros próximos ao bairro de destino
    for bairro in coordenadas_bairros:
        p1 = Point(bairro[1], bairro[2])
        if p1.within(poly) == True:
            
            # Calcular a distância entre o bairro encontrado e o ponto de destino
            distancia = calcularDistancia(bairro[1], bairro[2], infoLocais[1][1], infoLocais[1][2])
            
            # Incluir o bairro encontrado e a distância dele ao destino na lista de bairros próximos 
            bairros_na_area.append([bairro[0], distancia])


    # Ordenar a lista de bairros próximos do mais próximo ao mais distante
    bairro_na_area_ord = sorted(bairros_na_area, key=itemgetter(1))
    
    # Retornar a lista de bairros próximos desordenada e a lista de bairros próximos ordenada
    return bairros_na_area, bairro_na_area_ord

# Solicitar o nome do bairro de partida
partidaLocal = input("Digite o nome do bairro de partida da corrida: ").upper()

# Solicitar o nome do bairro de destino
destinoLocal = input("Digite o nome do bairro de destino da corrida: ").upper()

#Guardar as informações dos pontos de partida e chegada
infoLocais = encontrarCoordenadas(partidaLocal, destinoLocal)

# Exemplo de uso: Ao pressionar o botão "encontrarCaronas"
listaBairrosProx, listaBairrosProxOrd = encontrarCaronas(infoLocais)

# Imprimir os bairros próximos ao local de destino
print("Bairros na Área: ")
print(listaBairrosProx)

# Imprimir os bairros próximos ao local de destino do mais próximo ao mais distante
print("Bairros na Área (MAIS PRÓXIMO AO MAIS DISTANTE): ")
print(listaBairrosProxOrd)

#Apresenta o mapa
#display (mapa)