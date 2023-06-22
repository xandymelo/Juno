import datetime
import random
import string
import pandas as pd
from enums.Cursos import cursos
from faker import Faker
from mock.municipiosBairros import municipios_pe, bairros_por_municipio


def generateCursoData():
    cursoId = list(range(1, len(cursos) + 1))
    turno = [random.randint(1,2) for _ in range(len(cursos))]
    dataCursos = {
        'Id': cursoId,
        'Nome': cursos,
        'Turno': turno
    }
    dfCursos = pd.DataFrame(dataCursos)
    dfCursos.to_csv('TabelaCursos.csv', index=False)

def generateSigaaData(QTD_DADOS):
    sigaaID = list(range(1, QTD_DADOS + 1))
    matricula = [str(random.randint(QTD_DADOS, 999999999)) for _ in range(QTD_DADOS)]
    cursoId = [
        random.randint(1, len(cursos)) for _ in range(QTD_DADOS)]
    periodo = [random.randint(1, 12) for _ in range(QTD_DADOS)]
    dataSigaa = {
        'SigaaID': sigaaID,
        'Matricula': matricula,
        'CursoId': cursoId,
        'Periodo': periodo
        }
    dfSigaa = pd.DataFrame(dataSigaa)
    dfSigaa.to_csv('TabelaSigaa.csv', index=False)

def generateEnderecoData(QTD_DADOS):
    fake = Faker('pt_BR')
    id = list(range(1, QTD_DADOS + 1))
    municipio = [random.choice(municipios_pe)for _ in range(QTD_DADOS)]
    bairro = [random.choice(bairros_por_municipio[m])for m in municipio]
    rua = [fake.street_name() for _ in range(QTD_DADOS)]
    numero = [random.randint(1, 9999) for _ in range(QTD_DADOS)]
    complemento = [random.choice(["casa", "apartamento"])for _ in range(QTD_DADOS)]

    dataEndereco = {
        "Id": id,
        "Municipio": municipio,
        "Bairro": bairro,
        "Rua": rua,
        "Numero": numero,
        "Complemento": complemento
        }
    dfEndereco = pd.DataFrame(dataEndereco)
    dfEndereco.to_csv("TabelaEndereco.csv", index=False)

def generateUsuarioData(QTD_DADOS_USUARIO, QTD_DADOS_ENDERECO):
    fake = Faker('pt_BR')
    usuarioID = list(range(1, QTD_DADOS_USUARIO + 1))
    sigaaID = list(range(1, QTD_DADOS_USUARIO + 1))
    enderecoID = list(range(1, QTD_DADOS_ENDERECO + 1))
    nome = [fake.name() for _ in range(QTD_DADOS_USUARIO)]
    sobrenome = [fake.last_name() for _ in range(QTD_DADOS_USUARIO)] 
    cpf = [fake.cpf() for _ in range(QTD_DADOS_USUARIO)]
    senha = [fake.password() for _ in range(QTD_DADOS_USUARIO)]
    telefone = ['81' + fake.numerify('#######') for _ in range(QTD_DADOS_USUARIO)]  # Gera telefones fictícios com DDD 81
    email = [f"{n.lower().replace(' ', '')}.{s.lower().replace(' ', '')}@ufrpe.br" for n, s in zip(nome, sobrenome)]  # Gera emails fictícios
    nascimento = [fake.date_of_birth(minimum_age=17, maximum_age=70).strftime('%Y-%m-%d 00:00:00') for _ in range(QTD_DADOS_USUARIO)]  # Gera datas de nascimento fictícias com pelo menos 17 anos

    data = {
        'ID': usuarioID,
        'SigaaID': sigaaID,
        'EnderecoID': enderecoID,
        'Nome': nome,
        'Sobrenome': sobrenome,
        'Cpf': cpf,
        'Senha': senha,
        'Telefone': telefone,
        'Email': email,
        'Data de Nascimento': nascimento
    }
    # Criar um DataFrame
    dfUsuarios = pd.DataFrame(data)

    # Exportar o dataframe para um arquivo excel
    dfUsuarios.to_csv('TabelaUsuarios.csv', index=False)

def generate_license_plate():
    letters = random.choices(string.ascii_uppercase, k=3)
    numbers = random.choices(string.digits, k=4)
    return ''.join(letters) + '-' + ''.join(numbers)

def generateVeiculoData(QTD_DADOS, QTD_DADOS_USUARIO):
    veiculoID = list(range(1, QTD_DADOS_USUARIO + 1))
    usuariosIds = list(range(1, QTD_DADOS_USUARIO + 1))
    usuarioID = [random.choice(usuariosIds) for _ in range(QTD_DADOS)] 
    tipo = [random.randint(1,2) for _ in range(QTD_DADOS)]
    placa = [generate_license_plate() for _ in range(QTD_DADOS)]
    marcas = ["Ford", "Chevrolet", "Volkswagen", "Toyota", "Honda", "Hyundai", "Nissan", "Renault", "BMW", "Mercedes-Benz"]
    marca = [random.choice(marcas) for _ in range(QTD_DADOS)]
    modelos = ["Gol", "Onix", "Corolla", "Civic", "HB20", "Renegade", "Uno", "Palio", "Fiesta", "Cruze"]
    modelo = [random.choice(modelos) for _ in range(QTD_DADOS)]
    cores = ["Preto", "Branco", "Prata", "Cinza", "Azul", "Vermelho", "Verde", "Amarelo"]
    cor = [random.choice(cores) for _ in range(QTD_DADOS)]
    passageiros = [random.randint(1, 4) for _ in range(QTD_DADOS)]
    dataVeiculos = {
        'VeiculoID': veiculoID,
        'UsuarioID': usuarioID,
        'Tipo': tipo,
        'Placa': placa,
        'Marca': marca,
        'Modelo': modelo,
        'Cor': cor,
        'Passageiros': passageiros
    }
    dfVeiculos = pd.DataFrame(dataVeiculos)
    dfVeiculos.to_csv('TabelaVeiculos.csv', index=False)

def generateDeslocamentosData(QTD_DADOS, QTD_DADOS_ENDERECO, QTD_DADOS_VEICULO):
    id = list(range(1, QTD_DADOS + 1))
    veiculoIds = list(range(1, QTD_DADOS_VEICULO+ 1))
    veiculoID = [random.choice(veiculoIds) for _ in range(QTD_DADOS)]
    horaSaida = [f'{random.randint(0, 24)}:{random.randint(0, 60)}:00' for _ in range(QTD_DADOS)]
    enderecoIds = list(range(1, QTD_DADOS_ENDERECO + 1))
    origem = [random.choice(enderecoIds) for _ in range(QTD_DADOS)]
    destino = [random.choice(enderecoIds) for _ in range(QTD_DADOS)]
    status = [random.randint(1,2) for _ in range(QTD_DADOS)]
    vagasDisponiveis = [random.randint(0,4) for _ in range(QTD_DADOS)]
    dataDeslocamento = {
        "id": id,
        "VeiculoID": veiculoID,
        "HoraSaida": horaSaida,
        "Origem": origem,
        "Destino": destino,
        "Status": status,
        "VagasDisponiveis": vagasDisponiveis
    }
    dfDeslocamento = pd.DataFrame(dataDeslocamento)
    dfDeslocamento.to_csv('TabelaDeslocamentos.csv', index=False)

def generatePassageirosData(QTD_DADOS, QTD_DADOS_USUARIO, QTD_DADOS_DESLOCAMENTOS):
    id = list(range(1, QTD_DADOS + 1))
    usuarioIds = list(range(1, QTD_DADOS_USUARIO + 1))
    usuarioId = [random.choice(usuarioIds) for _ in range(QTD_DADOS)]
    deslocamentoIds = list(range(1, QTD_DADOS_DESLOCAMENTOS + 1))
    deslocamentoId = [random.choice(deslocamentoIds) for _ in range(QTD_DADOS)]
    tipo = [random.randint(1,2) for _ in range(QTD_DADOS)]
    dataPassageiros = {
        'id': id,
        'usuarioId': usuarioId,
        'deslocamentoId': deslocamentoId,
        'tipo': tipo
    }
    dfPassageiros = pd.DataFrame(dataPassageiros)
    dfPassageiros.to_csv('TabelaPassageiros.csv', index=False)



if __name__ == '__main__':
    qtd_dados_usuario = int(input('Escolha a quantidade de Usuários:'))
    qtd_dados_endereco = int(input('Escolha a quantidade de Endereços:'))
    qtd_dados_veiculos = int(input('Escolha a quantidade de Veiculos:'))
    qtd_dados_deslocamento = int(input('Escolha a quantidade de deslocamentos:'))
    generateCursoData()
    generateEnderecoData(qtd_dados_endereco)
    generateSigaaData(qtd_dados_usuario)
    generateUsuarioData(qtd_dados_usuario, qtd_dados_endereco)
    generateVeiculoData(QTD_DADOS=qtd_dados_veiculos, QTD_DADOS_USUARIO=qtd_dados_usuario)
    generateDeslocamentosData(QTD_DADOS=qtd_dados_deslocamento, QTD_DADOS_ENDERECO=qtd_dados_endereco, QTD_DADOS_VEICULO=qtd_dados_veiculos)
    generatePassageirosData(QTD_DADOS=qtd_dados_deslocamento, QTD_DADOS_USUARIO= qtd_dados_usuario, QTD_DADOS_DESLOCAMENTOS=qtd_dados_deslocamento)
