import 'package:sqflite/sqflite.dart';
import '../../models/passageiros_deslocamento.dart';
import '../app_database.dart';

class PassageirosDeslocamentoDAO {
  static const createTable = '''
    CREATE TABLE `PassageirosDeslocamento` (
      `Id` INTEGER PRIMARY KEY AUTOINCREMENT,
      `UsuarioID` INTEGER NOT NULL,
      `DeslocamentoId` INTEGER NOT NULL,
      `Tipo` INTEGER NOT NULL,
      FOREIGN KEY (`UsuarioID`) REFERENCES `user` (`Id`),
      FOREIGN KEY (`DeslocamentoId`) REFERENCES `deslocamento` (`Id`)
    )
  ''';

  static const _tablename = 'PassageirosDeslocamento';
  static const _id = 'Id';
  static const _usuarioId = 'UsuarioID';
  static const _deslocamentoId = 'DeslocamentoId';
  static const _tipo = 'Tipo';

  static Future<int> save(
      PassageirosDeslocamento passageirosDeslocamento) async {
    final Database db = await createDatabase();
    final Map<String, dynamic> passageirosDeslocamentoMap = {
      _usuarioId: passageirosDeslocamento.usuarioId,
      _deslocamentoId: passageirosDeslocamento.deslocamentoId,
      _tipo: passageirosDeslocamento.tipo,
    };
    return db.insert(_tablename, passageirosDeslocamentoMap);
  }

  static Future<List<PassageirosDeslocamento>> findAll() async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tablename);
    final List<PassageirosDeslocamento> passageirosDeslocamentos = [];
    for (Map<String, dynamic> row in result) {
      final PassageirosDeslocamento passageirosDeslocamento =
          PassageirosDeslocamento(
        id: row[_id],
        usuarioId: row[_usuarioId],
        deslocamentoId: row[_deslocamentoId],
        tipo: row[_tipo],
      );
      passageirosDeslocamentos.add(passageirosDeslocamento);
    }
    return passageirosDeslocamentos;
  }
}
