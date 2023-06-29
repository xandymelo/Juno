import 'package:sqflite/sqflite.dart';
import '../../models/veiculo.dart';
import '../app_database.dart';

class VeiculoDAO {
  static const createTable = '''
    CREATE TABLE `veiculo` (
      `Id` INTEGER NOT NULL,
      `UsuarioID` INTEGER NOT NULL,
      `Tipo` INTEGER DEFAULT NULL,
      `Placa` TEXT DEFAULT NULL,
      `Marca` TEXT DEFAULT NULL,
      `Modelo` TEXT DEFAULT NULL,
      `Cor` TEXT DEFAULT NULL,
      `QtdPassageiros` INTEGER NOT NULL,
      PRIMARY KEY (`Id`),
      FOREIGN KEY (`UsuarioID`) REFERENCES `user` (`Id`)
    )
  ''';

  static const _tablename = 'veiculo';
  static const _id = 'Id';
  static const _usuarioId = 'UsuarioID';
  static const _tipo = 'Tipo';
  static const _placa = 'Placa';
  static const _marca = 'Marca';
  static const _modelo = 'Modelo';
  static const _cor = 'Cor';
  static const _qtdPassageiros = 'QtdPassageiros';

  static Future<int> save(Veiculo veiculo) async {
    final Database db = await createDatabase();
    final Map<String, dynamic> veiculoMap = {
      _id: veiculo.id,
      _usuarioId: veiculo.usuarioId,
      _tipo: veiculo.tipo,
      _placa: veiculo.placa,
      _marca: veiculo.marca,
      _modelo: veiculo.modelo,
      _cor: veiculo.cor,
      _qtdPassageiros: veiculo.qtdPassageiros,
    };
    return db.insert(_tablename, veiculoMap);
  }

  static Future<List<Veiculo>> findAll() async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tablename);
    final List<Veiculo> veiculos = [];
    for (Map<String, dynamic> row in result) {
      final Veiculo veiculo = Veiculo(
        id: row[_id],
        usuarioId: row[_usuarioId],
        tipo: row[_tipo],
        placa: row[_placa],
        marca: row[_marca],
        modelo: row[_modelo],
        cor: row[_cor],
        qtdPassageiros: row[_qtdPassageiros],
      );
      veiculos.add(veiculo);
    }
    return veiculos;
  }
}
