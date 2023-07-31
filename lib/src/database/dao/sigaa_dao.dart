import 'package:sqflite/sqflite.dart';
import '../../models/sigaa.dart';
import '../app_database.dart';

class SigaaDAO {
  static const createTable = '''
    CREATE TABLE sigaa (
      Id INTEGER PRIMARY KEY AUTOINCREMENT,
      Matricula INTEGER,
      CursoId INTEGER,
      Periodo INTEGER,
      FOREIGN KEY (CursoId) REFERENCES cursos (Id)
    )
  ''';

  static const _tablename = 'sigaa';
  static const _id = 'Id';
  static const _matricula = 'Matricula';
  static const _cursoId = 'CursoId';
  static const _periodo = 'Periodo';

  static Future<int> save(Sigaa sigaa) async {
    final Database db = await createDatabase();
    final Map<String, dynamic> sigaaMap = {
      _matricula: sigaa.matricula,
      _cursoId: sigaa.cursoId,
      _periodo: sigaa.periodo,
    };
    return db.insert(_tablename, sigaaMap);
  }

  static Future<List<Sigaa>> findAll() async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tablename);
    final List<Sigaa> sigaas = [];
    for (Map<String, dynamic> row in result) {
      final Sigaa sigaa = Sigaa(
        id: row[_id],
        matricula: row[_matricula],
        cursoId: row[_cursoId],
        periodo: row[_periodo],
      );
      sigaas.add(sigaa);
    }
    return sigaas;
  }

  static Future<Sigaa?> getSigaaDataByUserId(int userId) async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      _tablename,
      where: '$_id = ?',
      whereArgs: [userId],
    );

    if (result.isEmpty) {
      return null; // Retorna null caso o sigaaId não seja encontrado
    }

    // Obtenha os dados da tabela sigaa
    final Map<String, dynamic> row = result.first;
    final Sigaa sigaaData = Sigaa(
      id: row[_id],
      matricula: row[_matricula],
      cursoId: row[_cursoId],
      periodo: row[_periodo],
    );

    return sigaaData;
  }
}
