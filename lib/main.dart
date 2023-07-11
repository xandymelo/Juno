import 'package:flutter/material.dart';
import 'package:juno/src/database/app_database.dart';
import 'package:juno/src/database/dao/cursos_dao.dart';
import 'package:juno/src/database/dao/deslocamentos_dao.dart';
import 'package:juno/src/database/dao/endereco_dao.dart';
import 'package:juno/src/database/dao/passageiros_deslocamento_dao.dart';
import 'package:juno/src/database/dao/sigaa_dao.dart';
import 'package:juno/src/database/dao/user_dao.dart';
import 'package:juno/src/database/dao/veiculo_dao.dart';
import 'package:juno/src/models/cursos.dart';
import 'package:juno/src/models/deslocamento.dart';
import 'package:juno/src/models/endereco.dart';
import 'package:juno/src/models/passageiros_deslocamento.dart';
import 'package:juno/src/models/sigaa.dart';
import 'package:juno/src/models/user.dart';
import 'package:juno/src/models/veiculo.dart';
import 'src/app/app_initialization.dart';
import 'src/app/app_widget.dart';

void main() async {
  AppInitialization.init();
  await deleteDatabaseFile();
  await createDatabase();
  await createDefaultData();

  runApp(const MyApp());
}

Future<void> createDefaultData() async {
  final endereco = Endereco(
      bairro: 'candeias',
      id: 1,
      complemento: 'Casa A',
      municipio: 'Jaboatão dos Guararapes',
      numero: 7535,
      rua: 'rua Padre Nestor de Alencar');
  await EnderecoDAO.save(endereco);
  // EnderecoDAO.findAll().then((value) => print(value));
  final curso = Curso(
    id: 1,
    nome: 'Bacharelado em Sistemas da Informação',
    turno: 0,
  );
  await CursosDAO.save(curso);
  // CursosDAO.findAll().then((value) => print(value));
  final sigaa = Sigaa(id: 1, cursoId: 1, matricula: 12312312123, periodo: 6);
  await SigaaDAO.save(sigaa);
  // SigaaDAO.findAll().then((value) => print(value));
  final usuario = User(
      cpf: '09788296467',
      id: 1,
      nome: 'Alexandre',
      sigaaId: 1,
      enderecoId: 1,
      email: 'xandymelo@outlook.com.br',
      senha: 'teste123',
      sobrenome: 'Melo',
      telefone: '81997570531',
      dataNascimento: '1998-03-30');
  await UserDAO.save(usuario);
  // UserDAO.findAll().then((value) => print(value));
  final veiculo = Veiculo(
      id: 1,
      cor: 'branco',
      marca: 'Hyundai',
      modelo: 'HB20',
      placa: 'PCM9F00',
      qtdPassageiros: 4,
      tipo: 0,
      usuarioId: 1);
  await VeiculoDAO.save(veiculo);
  // VeiculoDAO.findAll().then((value) => print(value));
  final deslocamento = Deslocamento(
      destinoId: 1,
      horaSaida: "13:00",
      id: 1,
      origemId: 1,
      status: 0,
      vagasDisponiveis: 4,
      veiculoId: 1);
  DeslocamentoDAO.save(deslocamento);
  // DeslocamentoDAO.findAll().then((value) => print(value));
  final passageirosDeslocamento =
      PassageirosDeslocamento(id: 1, usuarioId: 1, deslocamentoId: 1, tipo: 1);
  PassageirosDeslocamentoDAO.save(passageirosDeslocamento);
  // PassageirosDeslocamentoDAO.findAll().then((value) => print(value));
}
