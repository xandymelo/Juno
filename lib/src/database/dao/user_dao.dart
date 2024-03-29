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
      `DataDeNascimento` TEXT,
      `ImageUrl` TEXT,
      `HasAccount` INTEGER NOT NULL,
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
  static const _dataDeNascimento = 'DataDeNascimento';
  static const _imageUrl = 'ImageUrl';
  static const _hasAccount = 'HasAccount';

  static Future<List<User>> getUsers(List<int> userIds) async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      _tablename,
      where: '$_id IN (${userIds.map((id) => '?').join(',')})',
      whereArgs: userIds,
    );

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
        dataNascimento: row[_dataDeNascimento],
        imageUrl: row[_imageUrl],
        hasAccount: row[_hasAccount] == 1 ? true : false,
      );
      users.add(user);
    }
    return users;
  }

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
      _dataDeNascimento: user.dataNascimento,
      _imageUrl: user.imageUrl,
      _hasAccount: user.hasAccount ? 1 : 0, // Convert bool to integer (1 or 0)
    };
    return db.insert(_tablename, userMap);
  }

  static Future<int?> getUserIdByCPF(String cpf) async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      _tablename,
      columns: [_id],
      where: '$_cpf = ?',
      whereArgs: [cpf],
    );

    if (result.isNotEmpty) {
      final Map<String, dynamic> row = result.first;
      final int userId = row[_id];
      return userId;
    } else {
      return null;
    }
  }

  static Future<User> getUserById(int userId) async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      _tablename,
      where: '$_id = ?',
      whereArgs: [userId],
    );
    if (result.isNotEmpty) {
      final Map<String, dynamic> row = result.first;
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
        dataNascimento: row[_dataDeNascimento],
        imageUrl: row[_imageUrl],
        hasAccount: row[_hasAccount] == 1 ? true : false,
      );
      return user;
    } else {
      return User(
          cpf: 'notFound',
          email: 'notFound',
          enderecoId: -1,
          id: -1,
          nome: 'Not Found',
          senha: 'not Found',
          sigaaId: -1,
          sobrenome: 'not Found',
          telefone: 'not Found',
          imageUrl: "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
          hasAccount: false);
    }
  }

  static Future<bool> verifyCpfAndPasswordExists(String cpf, String password) async {
    final Database db = await createDatabase();

    final List<Map<String, dynamic>> result = await db.query(
      _tablename,
      where: '$_cpf = ? AND $_senha = ? AND $_hasAccount = 1',
      whereArgs: [cpf, password],
    );

    return result.isNotEmpty;
  }

  static Future<User?> getUserByCPF(String cpf) async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      _tablename,
      where: '$_cpf = ?',
      whereArgs: [cpf],
    );

    if (result.isNotEmpty) {
      final Map<String, dynamic> row = result.first;
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
        dataNascimento: row[_dataDeNascimento],
        imageUrl: row[_imageUrl],
        hasAccount: row[_hasAccount] == 1,
      );
      return user;
    } else {
      return null;
    }
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
        dataNascimento: row[_dataDeNascimento],
        imageUrl: row[_imageUrl],
        hasAccount: row[_hasAccount],
      );
      users.add(user);
    }
    return users;
  }

  static Future<int> update(User user) async {
    final db = await createDatabase();
    return db.update(
      _tablename,
      {
        _sigaaId: user.sigaaId,
        _enderecoId: user.enderecoId,
        _nome: user.nome,
        _sobrenome: user.sobrenome,
        _cpf: user.cpf,
        _senha: user.senha,
        _telefone: user.telefone,
        _email: user.email,
        _dataDeNascimento: user.dataNascimento,
      },
      where: '$_id = ?',
      whereArgs: [user.id],
    );
  }

  static Future<int> updateHasAccount(int userId, bool hasAccount) async {
    final db = await createDatabase();
    return db.update(
      _tablename,
      {
        _hasAccount: hasAccount ? 1 : 0, // Convert bool to integer (1 or 0)
      },
      where: '$_id = ?',
      whereArgs: [userId],
    );
  }

  static Future<int> updatePassword(int userId, String newPassword) async {
    final db = await createDatabase();
    return db.update(
      _tablename,
      {
        _senha: newPassword,
      },
      where: '$_id = ?',
      whereArgs: [userId],
    );
  }
}
