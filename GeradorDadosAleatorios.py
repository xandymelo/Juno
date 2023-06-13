from faker import Faker
import random
import pandas as pd
from datetime import datetime, timedelta
import string

fake = Faker('pt_BR')

# Geraçao de dados aletorios para cada campo da tabela usuario

usuarioID = [str(random.randint(10000, 999999)) for _ in range(100000)]  # Gerando 1000 IDs únicos
sigaaID = [str(random.randint(100000, 999999)) for _ in range(100000)] 
enderecoID = [str(random.randint(100000, 999999))for _ in range(100000)]
nome = [fake.name() for _ in range(100000)]
sobrenome = [fake.last_name() for _ in range(100000)]  # Gera sobrenomes fictícios
cpf = [fake.cpf() for _ in range(100000)]
senha = [fake.password() for _ in range(100000)]
vinculo = [random.choice(["estudante", "colaborador"]) for _ in range(100000)]
telefone = ['81' + fake.numerify('#######') for _ in range(100000)]  # Gera telefones fictícios com DDD 81
email = [f"{n.lower().replace(' ', '')}.{s.lower().replace(' ', '')}@ufrpe.br" for n, s in zip(nome, sobrenome)]  # Gera emails fictícios
nascimento = [fake.date_of_birth(minimum_age=17, maximum_age=70).strftime('%d/%m/%Y') for _ in range(100000)]  # Gera datas de nascimento fictícias com pelo menos 17 anos

data = {
    'UserID': usuarioID,
    'SigaaID': sigaaID,
    'EnderecoID': enderecoID,
    'Nome': nome,
    'Sobrenome': sobrenome,
    'Cpf': cpf,
    'Senha': senha,
    'Vinculo': vinculo,
    'Telefone': telefone,
    'Email': email,
    'Data de Nascimento': nascimento
}

# Criar um DataFrame
dfUsuarios = pd.DataFrame(data)

# Exportar o dataframe para um arquivo excel
dfUsuarios.to_excel('TabelaUsuarios.xlsx', index=False)

def generate_license_plate():
    letters = random.choices(string.ascii_uppercase, k=3)
    numbers = random.choices(string.digits, k=4)
    return ''.join(letters) + '-' + ''.join(numbers)

# Geraçao de dados para acada campo da tabela veiculo:
veiculoID = veiculoID = [str(random.randint(100000, 999999)) for _ in range(100000)]
usuarioID_veiculo = [random.choice(usuarioID) if random.random() < 0.8 else '-' for _ in range(100000)]  # Atribuindo IDs de usuários aleatoriamente aos veículos (80% de chance de ter um usuário)
tipo = [random.choice(['carro', 'moto']) for _ in range(100000)]
placa = [generate_license_plate() for _ in range(100000)]
marcas = ["Ford", "Chevrolet", "Volkswagen", "Toyota", "Honda", "Hyundai", "Nissan", "Renault", "BMW", "Mercedes-Benz"]
marca = [random.choice(marcas) for _ in range(100000)]
modelos = ["Gol", "Onix", "Corolla", "Civic", "HB20", "Renegade", "Uno", "Palio", "Fiesta", "Cruze"]
modelo = [random.choice(modelos) for _ in range(100000)]
cores = ["Preto", "Branco", "Prata", "Cinza", "Azul", "Vermelho", "Verde", "Amarelo"]
cor = [random.choice(cores) for _ in range(100000)]
passageiros = [random.randint(1, 4) for _ in range(100000)]

dataVeiculos = {
    'VeiculoID': veiculoID,
    'UsuarioID': usuarioID_veiculo,
    'Tipo': tipo,
    'Placa': placa,
    'Marca': marca,
    'Modelo': modelo,
    'Cor': cor,
    'Passageiros': passageiros
    }

# Criar um DataFrame
dfVeiculos = pd.DataFrame(dataVeiculos)

# Exportar o dataframe para um arquivo excel
dfVeiculos.to_excel('TabelaVeiculos.xlsx', index=False)


# Geracao de daos para cada camapo da tabela sigaa

# coluna de sigaaID com os mesmos dados de antes:
sigaaID = sigaaID
matricula = [str(random.randint(100000000, 999999999)) for _ in range(100000)]
curso = [
    random.choice([
        "Administracao"
        "Administracao UAST"
        "Agronomia"
        "Agronomia UAST"
        "Bacharelado em Agroecologia"
        "Bacharelado em Ciencia da Computacao"
        "Bacharelado em Ciencias Biologicas"
        "Bacharelado em Ciencias Biologicas - UAST"
        "Bacharelado em Ciencias do Consumo"
        "Bacharelado em Ciencias Economicas"
        "Bacharelado em Ciencias Economicas - UAST"
        "Bacharelado em Ciencias Sociais"
        "Bacharelado em Gastronomia"
        "Bacharelado em Sistemas da Informacao"
        "Bacharelado em Sistemas da Informacao - UAST"
        "Economia Domestica"
        "Engenharia Agricola e Ambiental"
        "Engenharia Ambiental"
        "Engenharia Civil - UACSA"
        "Engenharia da Computacao - Belo Jardim"
        "Engenharia de Controle e Automacao - Belo Jardim"
        "Engenharia de Materiais- UACSA"
        "Engenharia de Pesca"
        "Engenharia de Pesca - UAST"
        "Engenharia Eletrica - UACSA"
        "Engenharia Eletronica - UACSA"
        "Engenharia Florestal"
        "Engenharia Hidrica - Belo Jardim"
        "Engenharia Mecanica - UACSA"
        "Engenharia Quimica - Belo Jardim"
        "Licenciatura em Ciencias Biologicas"
        "Licenciatura em Computacao"
        "Licenciatura em Educacao Fisica"
        "Licenciatura em Fisica"
        "Licenciatura em Historia"
        "Licenciatura em Letras (Portugues e Espanhol)"
        "Licenciatura em Matematica"
        "Licenciatura em Pedagogia"
        "Licenciatura em Quimica"
        "Licenciatura em Quimica - UAST"
        "Medicina Veterinaria"
        "Tecnologia em Aquicultura"
        "Zootecnia"
        "Zootecnia - UAST"
    ]) for _ in range(100000)]
turno = [random.choice(["Matutino", "Vespertino"]) for _ in range(100000)]
periodo = [random.randint(1, 10) for _ in range(100000)]

dataSigaa = {
    'SigaaID': sigaaID,
    'Matricula': matricula,
    'Curso': curso,
    'Turno': turno,
    'Periodo': periodo
    }

dfSigaa = pd.DataFrame(dataSigaa)

dfSigaa.to_excel('TabelaSigaa.xlsx', index=False)


# Geracao de dados para cada campo da tabela endereco
usuarioID = usuarioID
municipios_pe = ["Recife",
                "Jaboatão dos Guararapes",
                "Olinda",
                "Caruaru",
                "Paulista",
                "Cabo de Santo Agostinho",
                "Camaragibe",
                "Garanhuns",
                "Vitória de Santo Antão",
                "Igarassu",
                "São Lourenço da Mata",
                "Abreu e Lima",
                "Santa Cruz do Capibaribe", 
                "Ipojuca",
                "Serra Talhada",
                "Araripina",
                "Gravatá",
                "Carpina",
                "Goiana",
                "Belo Jardim",
                "Arcoverde",
                "Ouricuri",
                "Escada",
                "Pesqueira",
                "Surubim",
                "Palmares",
                "Bezerros",
                "Moreno",
                "Timbaúba",
                "Bom Conselho",
                "Buíque",
                "Bodocó",
                "São Bento do Una",
                "São José do Egito",
                "Toritama",
                "Lajedo",
                "Custódia",
                "Brejo da Madre de Deus",
                "Bonito",
                "Águas Belas"]

municipio = [random.choice(municipios_pe) for _ in range(100000)]

bairros_por_municipio = {
    "Recife": ["Aflitos",
	"Afogados",
	"Ågua Fria",
	"Alto do Mandu",
	"Alto José Bonifacio",
	"Alto José do Pinho",
	"Alto Santa Terezinha",
	"Apipucos",
	"Areias",
	"Arruda"
],
"Jaboatão dos Guararapes": [ "Barra de Jangada",
	"Bulhões",
	"Cajueiro Seco",
	"Candeias",
	"Cavaleiro",
	"Centro",
	"Comportas",
	"Curado",
	"Dois Carneiros",
	"Engenho Velho",
	"Floriano",
	"Guararapes",
	"Jardim Jordão",
	"Manassu",
	"Marcos Freire",
	"Muribeca",
	"Muribeca dos Guararapes",
	"Muribequinha",
	"Piedade",
	"Prazeres",
	"Santana",
	"Santo Aleixo",
	"Socorro",
	"Sucupira",
	"Vargem Fria",
	"Vila Rica",
	"Vista Alegre",
	"Zumbi do Pacheco"
],

"Olinda": [ "Águas Compridas",
               "Aguazinha",
                "Alto da Bondade",
                "Alto da Conquista",
                "Alto da Nação",
                "Alto Sol Nascente",
                "Amaro Branco",
                "Amparo",
                "Área Rural de Olinda",
                "Bairro Novo",
                "Bonsucesso",
                "Bultrins",
                "Caixa DÁgua",
                "Carmo",
                "Casa Caiada",
                "Fragoso",
                "Guadalupe",
                "Jardim Atlântico",
                "Jardim Brasil",
                "Monte",
                "Ouro Preto",
                "Passarinho",
                "Peixinhos",
                "Rio Doce",
                "Salgadinho",
                "Santa Tereza",
                "São Benedito",
                "Sapucaia",
                "Sítio Novo",
                "Tabajara",
                "Umuarama",
                "Varadouro",
                "Vila Popular"
],

"Caruaru": [ "Agamenon Magalhães",
    "Alto do Moura",
    "Área Rural de Caruaru",
    "Boa Vista",
    "Caiuca",
    "Cedro",
    "Centenário",
    "Cidade Alta",
    "Cidade Jardim",
    "Deputado José Antônio Liberato",
    "Distrito Industrial",
    "Divinópolis",
    "Indianópolis",
    "Jardim Panorama",
    "João Mota",
    "José Carlos de Oliveira",
    "Kennedy",
    "Luiz Gonzaga",
    "Manoel Bezerra Lopes",
    "Maria Auxiliadora",
    "Maurício de Nassau",
    "Morro do Bom Jesus",
    "Nossa Senhora das Dores",
    "Nossa Senhora das Graças",
    "Nova Caruaru",
    "Petrópolis",
    "Rendeiras",
    "Riachão",
    "Salgado",
    "Santa Rosa",
    "São Francisco",
    "São João da Escócia",
    "São José",
    "Serras do Vale",
    "Universitário",
    "Vassoural"
],

"Paulista": ["Arthur Lundgren I",
                 "Arthur Lundgren II",
                    "Centro",
                    "Engenho Maranguape",
                    "Fragoso",
                    "Jaguarana",
                    "Jaguaribe",
                    "Janga",
                    "Jardim Maranguape",
                    "Jardim Paulista",
                    "Maranguape I",
                    "Maranguape II",
                    "Maria Farinha",
                    "Mirueira",
                    "Nobre",
                    "Nossa Senhora da Conceição",
                    "Nossa Senhora do Ó",
                    "Paratibe",
                    "Pau Amarelo",
                    "Poty",
                    "Tabajara",
                    "Vila Torres Galvão"
],
"Cabo de Santo Agostinho": ["Centro",
                "Ponte dos Carvalhos",
                "Gaibu",
                "Suape",
                "Calhetas",
                "Itapuama",
                "Vila de Nazaré",
                "Charnequinha",
                "Charneca",
                "Jardim Santo Inácio",
                "Garapu",
                "Nossa Senhora do Ó",
                "Muro Alto"
],

"Camaragibe": ["Timbi",
            "Tabatinga",
            "Santana",
            "Alberto Maia",
            "Jardim Primavera",
            "Vila da Fábrica",
            "Cidade dos Pinheiros",
            "Vila da Paz",
            "Dois Unidos",
            "São João da Escócia",
            "Timbi",
            "São Pedro",
            "Vale das Pedreiras",
            "Santa Mônica",
            "Maria Farinha"
],

"Garanhuns": ["Heliópolis",
            "Cohab II",
            "Magano",
            "Boa Vista",
            "São José",
            "Aloísio Pinto",
            "Indiano",
            "Brasília",
            "São Miguel",
            "São Pedro",
            "Severiano Moraes Filho",
            "Centro",
            "Brasílio Dorneles",
            "Francisco Figueira",
            "Parque Fênix"
],

"Vitória de Santo Antão": ["Centro",
"Matriz",
"Redenção",
"Livramento",
"Bela Vista",
"Maués",
"Jardim Ipiranga",
"Lídia Queiroz",
"Cajá",
"Jardim Mariana",
"Santana",
"Loteamento Real",
"Jardim Vitória",
"Jardim Santo Ivo",
"Jardim Planalto"
],

"Igarassu": ["Centro",
"Cruz de Rebouças",
"Nova Cruz",
"Mangueira",
"Três Ladeiras",
"Monjope",
"Nova Olinda",
"Saramandaia",
"Pau Amarelo",
"Santa Tereza",
"Itapessoca",
"Igarassu Velho"],

"São Lourenço da Mata": ["Tiúma",
"Muribara",
"Pixete",
"Lajes",
"Vila Popular",
"Chã da Tábua",
"Matriz da Luz",
"Penedo",
"Parque Capibaribe",
"Coqueiral",
"Dois Carneiros",
"Engenho Maranguape"],

"Abreu e Lima": ["Centro",
"Caetés",
"Matinha",
"Timbó",
"Desterro",
"Jardim Brasil",
"Monte",
"Guararapes",
"Frei Damião",
"Alto Santo Antônio",
"Vila Fênix",
"Planalto"],

"Santa Cruz do Capibaribe": ["Centro",
"Bela Vista",
"Dona Lica",
"Nova Santa Cruz",
"Malaquias Cardoso",
"Oscarzão",
"Palestina",
"São Cristóvão",
"Rio Verde",
"Santo Agostinho",
"São José",
"Malhada do Meio"],

"Ipojuca": ["Porto de Galinhas",
"Nossa Senhora do Ó",
"Centro",
"Camela",
"Suape",
"Serrambi",
"Merepe I",
"Ipojuca-Sede",
"Engenho Coca-Cola",
"Muro Alto",
"Praia de Toquinho",
"Praia do Cupe"],

"Serra Talhada": ["Centro",
"AABB",
"IPSEP",
"Bom Jesus",
"Vila Bela",
"Mutirão",
"Borborema",
"Cohab",
"São Cristóvão",
"Malhada Cortada",
"Cagep",
"Nossa Senhora da Conceição"],

"Araripina": ["Centro",
"Alto da Boa Vista",
"Cavalete I e II",
"Cohab",
"Lagoa Maria Timóteo",
"Alto da Conceição",
"Santa Maria",
"Vila Santa Maria",
"Zé Martins",
"Cohab II",
"Zé Pereira",
"Cavalete III"],

"Gravatá": ["Centro",
"Alpes Suíços",
"Maria Auxiliadora",
"Aldeia",
"Nossa Senhora das Graças",
"Nossa Senhora de Fátima",
"Prado",
"Riacho do Mel",
"Cruzeiro",
"Porta Florada",
"Jucá Ferrado",
"Russinhas"],

"Carpina": ["Santo Antônio",
        "Centro",
        "Caixa D'água",
        "Engenho Maranguape",
        "Santa Cruz",
        "São José",
        "Cruzeiro",
        "Jardim Neópolis",
        "Indianópolis",
        "Maria Auxiliadora",
        "Bairro Novo",
        "Encanto"],

"Goiana": ["Centro",
"São José",
"Nova Goiana",
"Carne de Vaca",
"Tejucupapo",
"Pontas de Pedra",
"Cidade das Pedras",
"Povoação",
"Guadalajara",
"Santa Rita",
"Planalto",
"Nova Liberdade"],

"Belo Jardim": ["Centro",
"São Pedro",
"Boa Vista",
"Cohab I",
"Santo Antônio",
"São Pedro II",
"Maria Cristina",
"Cohab II",
"São Pedro III",
"Loteamento Frei Damião",
"São Pedro IV",
"São Pedro V"],

"Arcoverde": ["Centro",
"São Cristóvão",
"Sucupira",
"Cohab I",
"São Geraldo",
"São Miguel",
"Cohab II",
"São Luiz",
"Cavaleiro",
"São José",
"São Miguel II",
"Jardim da Serra"],

"Ouricuri": ["Centro",
"Santa Maria",
"Nossa Senhora de Fátima",
"Capela de São Braz",
"Nossa Senhora do Carmo",
"São Sebastião",
"São Gonçalo",
"Loteamento Tiúma",
"Loteamento Petrolina",
"Loteamento Eucalipto",
"Loteamento São Francisco",
"Loteamento Santa Rita"],

"Escada": ["Centro",
"São Francisco",
"Santo Antônio",
"Riacho do Navio",
"Jaguaribe",
"Nova Cidade",
"São Cristóvão",
"Vila Matias",
"Riacho do Meio",
"Timbó",
"Cohab",
"Nova Descoberta"],

"Pesqueira": ["Centro",
"Prado",
"Jureminha",
"Cohab",
"AABB",
"Petrópolis",
"Cruzeiro",
"Tiradentes",
"Baixa Grande",
"Santo Antônio",
"João de Deus",
"Bairro Novo"],

"Surubim": ["Centro",
"São José",
"Cohab",
"São Sebastião",
"Santo Antônio",
"Bela Vista",
"Frei Damião",
"Nova Morada",
"Zé Rocha",
"Loteamento Parque das Cidades",
"Jardim Panorama",
"Cohab II"],

"Palmares": ["Centro",
"Santo Antônio",
"São Sebastião",
"Newton Carneiro",
"Santa Rosa",
"Caiucá",
"São José",
"José Lacerda",
"Cohab",
"Loteamento Maria Silvia",
"Quilombo dos Palmares",
"Cohab II"],

"Bezerros": ["Centro",
"Santo Antônio",
"São Sebastião",
"Nossa Senhora Aparecida",
"Cohab",
"São Pedro",
"Santo Amaro",
"São Rafael",
"Encruzilhada de São João",
"Serra Negra",
"Loteamento Gameleira",
"Encanto"],

"Moreno": ["Centro",
"Vila Nova",
"Bonança",
"Loteamento Nossa Senhora de Fátima",
"Bultrins",
"Muribara",
"Nossa Senhora do Carmo",
"Zumbi",
"José Rufino",
"Santana",
"Loteamento Nossa Senhora do Rosário",
"Alto da Bela Vista"],

"Timbaúba": ["Centro",
"Timbaubinha",
"Sapucaia",
"Mocós",
"Alto do Cruzeiro",
"Ferreiros",
"Campo Grande",
"Jardim Guarani",
"Vila Operária",
"Alto Santa Terezinha",
"Vila dos Trezentos",
"Três Cocos"],

"Bom Conselho": ["Centro",
"São José",
"Bairro Novo",
"Santo Antônio",
"Cohab",
"Vila Popular",
"Nossa Senhora de Fátima",
"Alto do Cruzeiro",
"Vila Kennedy",
"São Francisco",
"Alto do Padeiro",
"Vila Marília"],

"Buíque": ["Centro",
    "Frei Damião",
    "Alto do Cruzeiro",
    "Vila do Carmo",
    "Alto do Ginásio",
    "São José",
    "São Félix",
    "Vila dos Remédios",
    "Vila Nova",
    "Alto do Catimbau",
    "Riachão",
    "Boa Vista"],

"Bodocó": ["Centro",
"São Francisco",
"Alto da Esperança",
"Vila Nova",
"Boa Vista",
"Alto do Cristo",
"Santa Luzia",
"Vila Sipaúba",
"São José",
"Vila Padre Cícero",
"Vila Serrânea",
"Nossa Senhora das Dores"],

"São Bento do Una": ["Centro",
"Santo Afonso",
"Santo Antônio",
"São Pedro",
"Cohab",
"Bairro Novo",
"Alto São Vicente",
"Alto da Balança",
"Iraque",
"Loteamento Neves",
"Santa Tereza",
"Vila Kennedy"],

"São José do Egito": ["Centro",
"Planalto",
"Planalto I",
"Jardim Henrique Didier",
"Morada Nova",
"Jardim Iracema",
"São João",
"Loteamento José Guilherme",
"Vila do Aeroporto",
"Alto do Cemitério",
"Antônio Marinho",
"Jardim Brasil"],

"Toritama": ["Centro",
"Independente",
"Planalto",
"Santa Maria",
"Areal",
"Cohab",
"Deus é Fiel",
"Valentim",
"Novo Coqueiral",
"Coqueiral",
"Vila Canaã",
"Morada Nova"],

"Lajedo": ["Centro",
"São Cristóvão",
"Santo Antônio",
"Bom Jesus",
"Alto do Magano",
"Morada Nova",
"Frei Damião",
"Vila da Paz",
"Mariano",
"Vila São Miguel",
"Vila Kennedy",
"Loteamento Maria de Fátima"],

"Custódia": ["Centro",
"Nossa Senhora da Conceição",
"São José",
"Bela Vista",
"Alto do Rio Branco",
"Jardim Iracema",
"Jardim da Cidade",
"Vila Canaã",
"Vila Piauí",
"Vila Serrânea",
"Loteamento São Domingos",
"Cohab"],

"Brejo da Madre de Deus": ["Centro",
"Boa Esperança",
"Fazenda Nova",
"Mandaçaia",
"Santa Cruz",
"Serra dos Ventos",
"Lagoa de Pedra",
"Barra do Farias",
"Tabocas",
"Cacimba de Pedro",
"Mimoso",
"São Domingos"],

"Bonito": ["Centro",
"Santo Antônio",
"Cohab",
"Boa Esperança",
"Vila do Sul",
"Vila dos Remédios",
"Sítio Cachoeirinha",
"Cachoeirinha",
"Bom Conselho",
"Cacimba do Bolão",
"Vila do Cajueiro",
"Serra Negra"],

"Águas Belas": ["Centro",
"São Sebastião",
"Nossa Senhora de Lourdes",
"Capela",
"Cohab",
"Vila Nova",
"São José",
"Bom Jesus",
"Fazenda Nova",
"Vila dos Remédios",
"Jardim Iracema",
"Loteamento Santa Helena"]    
}

# Geraçao de dados para cada campo da tabela Endereco
municipio = [random.choice(municipios_pe)for _ in range(100000)]
bairro = [random.choice(bairros_por_municipio[m])for m in municipio]
rua = [fake.street_name() for _ in range(100000)]
numero = [random.randint(1, 9999) for _ in range(100000)]
complemento = [random.choice(["casa", "apartamento"])for _ in range(100000)]

dataEndereco = {
    "Municipio": municipio,
    "Bairro": bairro,
    "Rua": rua,
    "Numero": numero,
    "Complemento": complemento
    }

dfEndereco = pd.DataFrame(dataEndereco)

dfEndereco.to_excel("TabelaEndereco.xlsx", index=False)


# Geração de dados para cada campo da tabela deslocamento

usuarioID = usuarioID
veiculoID = veiculoID
horaSaida = [(datetime.strptime("4:30", "%H:%M") + timedelta(minutes=random.randint(0, 1050))).strftime("%H:%M:%S") for _ in range(100000)]
origem = [random.choice(municipio) + ", " + random.choice(bairro) + ", " + random.choice(rua) + ", " + str(random.choice(numero)) + ", " + str(random.choice(complemento)) for _ in range(100000)]
status = [random.choice(["Ocorrendo", "ocorreu", "Ocorrerá"]) for _ in range(100000)]
vagasDisponiveis = []
for s in status:
    if s == "Ocorrerá":
        vagasDisponiveis.append(random.randint(1, 4))
    else:
        vagasDisponiveis.append(0)
# O destino deve ser a UFRPE
departamentos = ["Departamento de Zootecnia", "CEGOE", "Departamento de Educação Física", "Biblioteca Setorial",  "DMV", "EspaçoTec", "Reitoria",
                 "Departamento de Física", "Restaurante Universitário", "Biblioteca Central", "Departamento de Medicina Veterinária", "CEAGRE I",
                 "CEAGRE II"]
destino = [random.choice(departamentos) for _ in range(100000)]

dataDeslocamento = {
    "UsuarioID": usuarioID,
    "VeiculoID": veiculoID,
    "HoraSaida": horaSaida,
    "Origem": origem,
    "Destino": destino,
    "Status": status,
    "VagasDisponiveis": vagasDisponiveis
}

dfDeslocamento = pd.DataFrame(dataDeslocamento)
