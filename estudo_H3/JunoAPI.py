from fastapi import FastAPI
from H3_PythonScript import encontrarCaronas, encontrarCoordenadas

Juno = FastAPI()

# DATABASE_URL = "mysql+mysqlconnector://root:abilio2012@localhost:3306/junodwpopulado"

# database = databases.Database(DATABASE_URL)

@Juno.on_event("startup")
def startup():
    return "começou"

@Juno.on_event("shutdown")
def shutdown():
     return "acabou"

@Juno.get("/")
def home():
    return "API Juno"

@Juno.get("/bairrosAoRedor/{bairroPartida}/{bairroDestino}")
def bairros_ao_redor(bairroPartida: str, bairroDestino: str):
    info_locais = encontrarCoordenadas(bairroPartida, bairroDestino)
    lista_bairros_proximos, lista_bairros_proximos_ordenados = encontrarCaronas(info_locais)
    return lista_bairros_proximos_ordenados

# @Juno.get("/alunos")
# async def read_alunos():
#     # consulta
#     query = text("SELECT aluno_id, nome, sobrenome, cpf FROM dimaluno")
#     alunos = await database.fetch_all(query=query)
#     return alunos

# teste de consulta
# @Juno.get("/aluno")
# async def read_aluno(aluno_id: int):
#     print("Valor de aluno_id:", aluno_id)
#     query = text("SELECT aluno_id, nome, sobrenome, cpf FROM dimaluno WHERE aluno_id = :aluno_id")
#     aluno = await database.fetch_all(query=query, values={"aluno_id": aluno_id})
#     return aluno



