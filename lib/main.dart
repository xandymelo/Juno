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
import "package:juno/src/screens/Onboarding/OnboardingWelcomeScreen.dart";

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
    return MaterialApp(home: OnboardingWelcomeScreen());
  }
}

Future<void> createDefaultData() async {
  final endereco = Endereco(bairro: 'CANDEIAS', id: 1, complemento: 'Casa', municipio: 'Jaboatão dos Guararapes', numero: 7535, rua: 'rua Padre Nestor de Alencar');
  await EnderecoDAO.save(endereco);
  final endereco2 = Endereco(bairro: 'PRADO', id: 2, complemento: 'Prédio', municipio: 'Recife', numero: 7535, rua: 'rua Padre Nestor de Alencar');
  await EnderecoDAO.save(endereco2);
  final endereco3 = Endereco(bairro: 'TORROES', id: 3, complemento: 'Prédio', municipio: 'Recife', numero: 7535, rua: 'rua Padre Nestor de Alencar');
  await EnderecoDAO.save(endereco3);
  final endereco4 = Endereco(bairro: 'CANDEIAS', id: 4, complemento: 'Casa', municipio: 'Jaboatão dos Guararapes', numero: 7535, rua: 'rua Padre Nestor de Alencar');
  await EnderecoDAO.save(endereco4);
  final endereco5 = Endereco(bairro: 'BOA VIAGEM', id: 5, complemento: 'Prédio', municipio: 'Recife', numero: 7535, rua: 'rua Padre Nestor de Alencar');
  await EnderecoDAO.save(endereco5);
  final endereco6 = Endereco(bairro: 'IPSEP', id: 6, complemento: 'Prédio', municipio: 'Recife', numero: 7535, rua: 'rua Padre Nestor de Alencar');
  await EnderecoDAO.save(endereco6);
  final endereco7 = Endereco(bairro: 'CANDEIAS', id: 7, complemento: 'Casa', municipio: 'Jaboatão dos Guararapes', numero: 7535, rua: 'rua Padre Nestor de Alencar');
  await EnderecoDAO.save(endereco7);
  final endereco8 = Endereco(bairro: 'BONGI', id: 8, complemento: 'Casa', municipio: 'Jaboatão dos Guararapes', numero: 7535, rua: 'rua Padre Nestor de Alencar');
  await EnderecoDAO.save(endereco8);

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
      nome: 'Roberta',
      sigaaId: 1,
      enderecoId: 1,
      email: ' roberya.brito@outlook.com.br',
      senha: 'teste123',
      sobrenome: 'Brito',
      telefone: '81997570531',
      dataNascimento: '1998-03-30',
      imageUrl: 'https://i.ibb.co/qNSSN87/fotor-ai-20230905202730.jpg',
      hasAccount: false);
  await UserDAO.save(usuario);
  final segundoUsuario = User(
      cpf: '124.785.954-68',
      id: 2,
      nome: 'Maria Eliza',
      sigaaId: 2,
      enderecoId: 2,
      email: 'mariaeliza@outlook.com.br',
      senha: 'senhasegura123',
      sobrenome: 'Melo',
      telefone: '81997570531',
      dataNascimento: '2000-03-20',
      imageUrl: 'https://i.ibb.co/r3bJZDR/profile1.jpg',
      hasAccount: true);
  await UserDAO.save(segundoUsuario);
    final terceiroUsuario = User(
      cpf: '155.865.975-68',
      id: 3,
      nome: 'Talita',
      sigaaId: 3,
      enderecoId: 3,
      email: 'talitapereira@outlook.com.br',
      senha: 'minhasenhasecreta123',
      sobrenome: 'Pereira',
      telefone: '81997570531',
      dataNascimento: '1997-04-30',
      imageUrl: 'https://i.ibb.co/5WDcVfv/profile-picture1.jpg',
      hasAccount: true);
  await UserDAO.save(terceiroUsuario);
    final quartoUsuario = User(
      cpf: '875.954.354-68',
      id: 4,
      nome: 'Morgana',
      sigaaId: 4,
      enderecoId: 4,
      email: 'mariaeliza@outlook.com.br',
      senha: 'teste123',
      sobrenome: 'Gouveia',
      telefone: '81997570531',
      dataNascimento: '1998-03-14',
      imageUrl: 'https://i.ibb.co/r3bJZDR/profile1.jpg',
      hasAccount: true);
  await UserDAO.save(quartoUsuario);
  // UserDAO.findAll().then((value) => print(value));
  // VeiculoDAO.findAll().then((value) => print(value));

  // DeslocamentoDAO.findAll().then((value) => print(value));

  final veiculo = Veiculo(id: 1, cor: 'Branco', marca: 'Hyundai', modelo: 'HB20', placa: 'PCM9F00', qtdPassageiros: 4, tipo: 0, usuarioId: 1);
  await VeiculoDAO.save(veiculo);
  final segundoVeiculo = Veiculo(id: 2, cor: 'Preto', marca: 'Volkswagen', modelo: 'Gol', placa: 'YGD9F23', qtdPassageiros: 4, tipo: 0, usuarioId: 1);
  await VeiculoDAO.save(segundoVeiculo);
  final terceiroVeiculo = Veiculo(id: 2, cor: 'Prata', marca: 'Fiat', modelo: 'Uno', placa: 'TDS9T32', qtdPassageiros: 4, tipo: 0, usuarioId: 1);
  await VeiculoDAO.save(terceiroVeiculo);

  final deslocamento = Deslocamento(destinoId: 1, horaSaida: "13:00", id: 1, origemId: 1, status: 0, vagasDisponiveis: 4, veiculoId: 1, vagas: 4);
  DeslocamentoDAO.save(deslocamento);
  final segundoDeslocamento = Deslocamento(destinoId: 2, horaSaida: "14:00", id: 2, origemId: 1, status: 0, vagasDisponiveis: 1, veiculoId: 2, vagas: 1);
  DeslocamentoDAO.save(segundoDeslocamento);
 final terceiroDeslocamento = Deslocamento(destinoId: 3, horaSaida: "14:00", id: 3, origemId: 1, status: 0, vagasDisponiveis: 4, veiculoId: 3, vagas: 4);
  DeslocamentoDAO.save(terceiroDeslocamento);
 final quartoDeslocamento = Deslocamento(destinoId: 4, horaSaida: "21:00", id: 4, origemId: 1, status: 0, vagasDisponiveis: 4, veiculoId: 1, vagas: 4);
  DeslocamentoDAO.save(quartoDeslocamento);
 final quintoDeslocamento = Deslocamento(destinoId: 5, horaSaida: "12:00", id: 5, origemId: 1, status: 0, vagasDisponiveis: 4, veiculoId: 2, vagas: 4);
  DeslocamentoDAO.save(quintoDeslocamento);
 final sextoDeslocamento = Deslocamento(destinoId: 6, horaSaida: "11:00", id: 6, origemId: 1, status: 0, vagasDisponiveis: 4, veiculoId: 3, vagas: 4);
  DeslocamentoDAO.save(sextoDeslocamento);
final setimoDeslocamento = Deslocamento(destinoId: 7, horaSaida: "13:00", id: 7, origemId: 3, status: 0, vagasDisponiveis: 4, veiculoId: 1, vagas: 4);
  DeslocamentoDAO.save(setimoDeslocamento);
final oitavoDeslocamento = Deslocamento(destinoId: 8, horaSaida: "08:00", id: 8, origemId: 3, status: 0, vagasDisponiveis: 4, veiculoId: 2, vagas: 4);
  DeslocamentoDAO.save(oitavoDeslocamento);

  final passageirosDeslocamento = PassageirosDeslocamento(id: 1, usuarioId: 1, deslocamentoId: 1, tipo: 1);
  PassageirosDeslocamentoDAO.save(passageirosDeslocamento);
  final segundoPassageirosDeslocamento = PassageirosDeslocamento(id: 2, usuarioId: 2, deslocamentoId: 2, tipo: 1);
  PassageirosDeslocamentoDAO.save(segundoPassageirosDeslocamento);
  final terceiroPassageirosDeslocamento = PassageirosDeslocamento(id: 3, usuarioId: 3, deslocamentoId: 3, tipo: 1);
  PassageirosDeslocamentoDAO.save(terceiroPassageirosDeslocamento);
  final quartoPassageirosDeslocamento = PassageirosDeslocamento(id: 4, usuarioId: 4, deslocamentoId: 4, tipo: 1);
  PassageirosDeslocamentoDAO.save(quartoPassageirosDeslocamento);
  final quintoPassageirosDeslocamento = PassageirosDeslocamento(id: 5, usuarioId: 4, deslocamentoId: 5, tipo: 1);
  PassageirosDeslocamentoDAO.save(quintoPassageirosDeslocamento);
  final sextoPassageirosDeslocamento = PassageirosDeslocamento(id: 6, usuarioId: 2, deslocamentoId: 6, tipo: 1);
  PassageirosDeslocamentoDAO.save(sextoPassageirosDeslocamento);
  final setimoPassageirosDeslocamento = PassageirosDeslocamento(id: 7, usuarioId: 3, deslocamentoId: 7, tipo: 1);
  PassageirosDeslocamentoDAO.save(setimoPassageirosDeslocamento);
  final oitavoPassageirosDeslocamento = PassageirosDeslocamento(id: 8, usuarioId: 1, deslocamentoId: 8, tipo: 1);
  PassageirosDeslocamentoDAO.save(oitavoPassageirosDeslocamento);

  // DeslocamentoDAO.findAll().then((value) => print(value));
  // PassageirosDeslocamentoDAO.findAll().then((value) => print(value));
}
