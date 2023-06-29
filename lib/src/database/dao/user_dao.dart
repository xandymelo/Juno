import 'package:sqflite/sqflite.dart';
import '../../models/user.dart';
import '../app_database.dart';

class UserDAO {
  static const createTable = '''
    CREATE TABLE `user` (
      `Id` INTEGER NOT NULL,
      `SigaaID` INTEGER NOT NULL,
      `EnderecoId` INTEGER NOT NULL,
      `Nome` TEXT NOT NULL,
      `Sobrenome` TEXT NOT NULL,
      `Cpf` TEXT NOT NULL,
      `Senha` TEXT NOT NULL,
      `Telefone` TEXT NOT NULL,
      `Email` TEXT NOT NULL,
      `Data de Nascimento` TEXT NOT NULL,
      PRIMARY KEY (`Id`),
      FOREIGN KEY (`SigaaID`) REFERENCES `sigaa` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
      FOREIGN KEY (`EnderecoId`) REFERENCES `endereco` (`id`)
    )
  ''';

  static const _tablename = 'user';
  static const _id = 'Id';
  static const _sigaaId = 'SigaaID';
  static const _enderecoId = 'EnderecoId';
  static const _nome = 'Nome';
  static const _sobrenome = 'Sobrenome';
  static const _cpf = 'Cpf';
  static const _senha = 'Senha';
  static const _telefone = 'Telefone';
  static const _email = 'Email';
  static const _dataNascimento = 'Data de Nascimento';

  static Future<int> save(User user) async {
    final Database db = await createDatabase();
    final Map<String, dynamic> userMap = {
      _id: user.id,
      _sigaaId: user.sigaaId,
      _enderecoId: user.enderecoId,
      _nome: user.nome,
      _sobrenome: user.sobrenome,
      _cpf: user.cpf,
      _senha: user.senha,
      _telefone: user.telefone,
      _email: user.email,
      _dataNascimento: user.dataNascimento.toIso8601String(),
    };
    return db.insert(_tablename, userMap);
  }

  static Future<List<User>> findAll() async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tablename);
    final List<User> users = [];
    for (Map<String, dynamic> row in result) {
      final User user = User(
        id: row[_id],
        sigaaId: row[_sigaaId],
        enderecoId: row[_enderecoId],
        nome: row[_nome],
        sobrenome: row[_sobrenome],
        cpf: row[_cpf],
        senha: row[_senha],
        telefone: row[_telefone],
        email: row[_email],
        dataNascimento: DateTime.parse(row[_dataNascimento]),
      );
      users.add(user);
    }
    return users;
  }
}
