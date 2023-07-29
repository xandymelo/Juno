import 'package:sqflite/sqflite.dart';
import '../../models/cursos.dart';
import '../app_database.dart';

class CursosDAO {
  static const createTable = '''
    CREATE TABLE cursos (
      Id INTEGER PRIMARY KEY AUTOINCREMENT,
      Nome TEXT,
      Turno INTEGER
    )
  ''';

  static const _tablename = 'cursos';
  static const _id = 'Id';
  static const _nome = 'Nome';
  static const _turno = 'Turno';

  static Future<int> save(Curso curso) async {
    final Database db = await createDatabase();
    final Map<String, dynamic> cursoMap = {
      _nome: curso.nome,
      _turno: curso.turno,
    };
    return db.insert(_tablename, cursoMap);
  }

  static Future<List<Curso>> findAll() async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tablename);
    final List<Curso> cursos = [];
    for (Map<String, dynamic> row in result) {
      final Curso curso = Curso(
        id: row[_id],
        nome: row[_nome],
        turno: row[_turno],
      );
      cursos.add(curso);
    }
    return cursos;
  }

  static Future<Curso?> getCursoById(int cursoId) async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tablename, where: '$_id = ?', whereArgs: [cursoId]);
    if (result.isNotEmpty) {
      return Curso(
        id: result[0][_id],
        nome: result[0][_nome],
        turno: result[0][_turno],
      );
    }
    return null;
  }

  static String mapTurnoToString(int turno) {
    switch (turno) {
      case 0:
        return 'Matutino';
      case 1:
        return 'Vespertino';
      case 2:
        return 'Noturno';
      default:
        return 'N/A';
    }
  }
}
