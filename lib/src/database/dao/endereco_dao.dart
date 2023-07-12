import 'package:sqflite/sqflite.dart';
import '../../models/endereco.dart';
import '../app_database.dart';

class EnderecoDAO {
  static const createTable = '''
    CREATE TABLE endereco (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      Municipio TEXT,
      Bairro TEXT,
      Rua TEXT,
      Numero INTEGER,
      Complemento TEXT
    )
  ''';

  static const _tablename = 'endereco';
  static const _id = 'id';
  static const _municipio = 'Municipio';
  static const _bairro = 'Bairro';
  static const _rua = 'Rua';
  static const _numero = 'Numero';
  static const _complemento = 'Complemento';

  static Future<int> save(Endereco contact) async {
    final Database db = await createDatabase();
    final Map<String, dynamic> contactMap = {
      _municipio: contact.municipio,
      _bairro: contact.bairro,
      _rua: contact.rua,
      _numero: contact.numero,
      _complemento: contact.complemento,
    };
    return db.insert(_tablename, contactMap);
  }

  static Future<Endereco> findByIndex(int id) async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      _tablename,
      where: '$_id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (result.isNotEmpty) {
      final Map<String, dynamic> row = result.first;
      final Endereco contact = Endereco(
        id: row[_id],
        municipio: row[_municipio],
        bairro: row[_bairro],
        rua: row[_rua],
        numero: row[_numero],
        complemento: row[_complemento],
      );
      return contact;
    }
    return Endereco(
        bairro: 'bairro',
        complemento: 'complemento',
        id: -1,
        municipio: 'municipio',
        numero: 1,
        rua: 'rua');
  }

  static Future<List<Endereco>> findAll() async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tablename);
    final List<Endereco> contacts = [];
    for (Map<String, dynamic> row in result) {
      final Endereco contact = Endereco(
        id: row[_id],
        municipio: row[_municipio],
        bairro: row[_bairro],
        rua: row[_rua],
        numero: row[_numero],
        complemento: row[_complemento],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}
