import 'package:flutter/material.dart';
import 'package:juno/src/app/app_initialization.dart';
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
import 'package:juno/src/screens/Onboarding/LogoScreen.dart';

void main() async {
  AppInitialization.init();
  await deleteDatabaseFile();
  await createDatabase();
  await createDefaultData();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LogoScreen());
  }
}

Future<void> createDefaultData() async {
  final endereco = Endereco(bairro: 'candeias', id: 1, complemento: 'Casa A', municipio: 'Jaboatão dos Guararapes', numero: 7535, rua: 'rua Padre Nestor de Alencar');
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
      cpf: '097.882.964-67',
      id: 1,
      nome: 'Alexandre',
      sigaaId: 1,
      enderecoId: 1,
      email: 'xandymelo@outlook.com.br',
      senha: 'teste123',
      sobrenome: 'Melo',
      telefone: '81997570531',
      dataNascimento: '1998-03-30',
      imageUrl: 'https://comidainvisivelstorage.blob.core.windows.net/comidainvisivelpublic/quem-somos/alexandre-melo.png',
      hasAccount: true);
  await UserDAO.save(usuario);
  final segundoUsuario = User(
      cpf: '097.882.964-68',
      id: 2,
      nome: 'Eliza',
      sigaaId: 1,
      enderecoId: 1,
      email: 'mariaeliza@outlook.com.br',
      senha: 'teste123',
      sobrenome: 'Melo',
      telefone: '81997570531',
      dataNascimento: '1998-03-30',
      imageUrl: 'https://comidainvisivelstorage.blob.core.windows.net/comidainvisivelpublic/quem-somos/ana-wirthmann.jpeg',
      hasAccount: false);
  await UserDAO.save(segundoUsuario);
  // UserDAO.findAll().then((value) => print(value));
  final veiculo = Veiculo(id: 1, cor: 'branco', marca: 'Hyundai', modelo: 'HB20', placa: 'PCM9F00', qtdPassageiros: 4, tipo: 0, usuarioId: 1);
  await VeiculoDAO.save(veiculo);
  // VeiculoDAO.findAll().then((value) => print(value));
  final deslocamento = Deslocamento(destinoId: 1, horaSaida: "13:00", id: 1, origemId: 1, status: 0, vagasDisponiveis: 4, veiculoId: 1, vagas: 4);
  DeslocamentoDAO.save(deslocamento);
  // DeslocamentoDAO.findAll().then((value) => print(value));
  final passageirosDeslocamento = PassageirosDeslocamento(id: 1, usuarioId: 1, deslocamentoId: 1, tipo: 1);
  PassageirosDeslocamentoDAO.save(passageirosDeslocamento);
  final segundoVeiculo = Veiculo(id: 2, cor: 'preto', marca: 'SHINERAY', modelo: 'jet50', placa: 'PCM9F01', qtdPassageiros: 1, tipo: 1, usuarioId: 1);
  await VeiculoDAO.save(segundoVeiculo);

  final segundoDeslocamento = Deslocamento(destinoId: 1, horaSaida: "14:00", id: 2, origemId: 1, status: 0, vagasDisponiveis: 1, veiculoId: 2, vagas: 1);
  DeslocamentoDAO.save(segundoDeslocamento);
  final segundoPassageirosDeslocamento = PassageirosDeslocamento(id: 2, usuarioId: 1, deslocamentoId: 2, tipo: 1);
  PassageirosDeslocamentoDAO.save(segundoPassageirosDeslocamento);
  final terceiroDeslocamento = Deslocamento(destinoId: 1, horaSaida: "14:00", id: 3, origemId: 1, status: 0, vagasDisponiveis: 10, veiculoId: null, vagas: 10);
  DeslocamentoDAO.save(terceiroDeslocamento);
  final terceiroPassageirosDeslocamento = PassageirosDeslocamento(id: 3, usuarioId: 2, deslocamentoId: 3, tipo: 1);
  PassageirosDeslocamentoDAO.save(terceiroPassageirosDeslocamento);
  // DeslocamentoDAO.findAll().then((value) => print(value));
  // PassageirosDeslocamentoDAO.findAll().then((value) => print(value));
}
