from fastapi import FastAPI, HTTPException
from sqlalchemy.sql import text
import databases

Juno = FastAPI()

DATABASE_URL = "mysql+mysqlconnector://root:abilio2012@localhost:3306/junodwpopulado"

# database = databases.Database(DATABASE_URL)

# @Juno.on_event("startup")
# async def startup():
#     await database.connect()

# @Juno.on_event("shutdown")
# async def shutdown():
#      await database.disconnect()

@Juno.get("/")
def home():
    return "API Juno"

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



