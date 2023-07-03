import 'dart:async';
import 'package:juno/src/database/dao/cursos_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'dao/deslocamentos_dao.dart';
import 'dao/endereco_dao.dart';
import 'dao/passageiros_deslocamento_dao.dart';
import 'dao/sigaa_dao.dart';
import 'dao/user_dao.dart';
import 'dao/veiculo_dao.dart';

Future<Database> createDatabase() async {
  final String dbPath = join(await getDatabasesPath(), 'juno.db');
  print(await getDatabasesPath());
  return openDatabase(
    dbPath,
    onCreate: (db, version) {
      db.execute(EnderecoDAO.createTable);
      db.execute(CursosDAO.createTable);
      db.execute(SigaaDAO.createTable);
      db.execute(UserDAO.createTable);
      db.execute(VeiculoDAO.createTable);
      db.execute(DeslocamentoDAO.createTable);
      db.execute(PassageirosDeslocamentoDAO.createTable);
    },
    version: 1,
    // onDowngrade: onDatabaseDowngradeDelete,
  );
}
