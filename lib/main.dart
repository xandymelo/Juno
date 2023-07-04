import 'package:flutter/material.dart';
import 'package:juno/src/database/app_database.dart';
import 'package:juno/src/database/dao/cursos_dao.dart';
import 'package:juno/src/database/dao/endereco_dao.dart';
import 'package:juno/src/models/cursos.dart';
import 'package:juno/src/models/endereco.dart';

import 'src/app/app_initialization.dart';
import 'src/app/app_widget.dart';

void main() async {
  AppInitialization.init();
  await deleteDatabaseFile();
  await createDefaultData();
  // await createDatabase();

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
  EnderecoDAO.findAll().then((value) => print(value));
}
