import 'package:juno/src/database/dao/passageiros_deslocamento_dao.dart';
import 'package:juno/src/database/dao/veiculo_dao.dart';
import 'package:sqflite/sqflite.dart';
import '../../models/deslocamento.dart';
import '../../models/endereco.dart';
import '../../models/passageiros_deslocamento.dart';
import '../../models/veiculo.dart';
import '../app_database.dart';
import 'endereco_dao.dart';

class DeslocamentoDAO {
  static const createTable = '''
    CREATE TABLE `deslocamento` (
      `Id` INTEGER PRIMARY KEY AUTOINCREMENT,
      `VeiculoID` INTEGER DEFAULT NULL,
      `HoraSaida` TEXT DEFAULT NULL,
      `Origemid` INTEGER NOT NULL,
      `DestinoId` INTEGER NOT NULL,
      `Status` INTEGER NOT NULL,
      `VagasDisponiveis` INTEGER DEFAULT NULL,
      `Vagas` INTEGER DEFAULT NULL,
      FOREIGN KEY (`VeiculoID`) REFERENCES `veiculo` (`Id`),
      FOREIGN KEY (`DestinoId`) REFERENCES `endereco` (`id`),
      FOREIGN KEY (`Origemid`) REFERENCES `endereco` (`id`)
    )
  ''';

  static const _tablename = 'deslocamento';
  static const _id = 'Id';
  static const _veiculoId = 'VeiculoID';
  static const _horaSaida = 'HoraSaida';
  static const _origemId = 'Origemid';
  static const _destinoId = 'DestinoId';
  static const _status = 'Status';
  static const _vagasDisponiveis = 'VagasDisponiveis';
  static const _vagas = 'Vagas';

  static Future<int> save(Deslocamento deslocamento) async {
    final Database db = await createDatabase();
    final Map<String, dynamic> deslocamentoMap = {
      _veiculoId: deslocamento.veiculoId,
      _horaSaida: deslocamento.horaSaida,
      _origemId: deslocamento.origemId,
      _destinoId: deslocamento.destinoId,
      _status: deslocamento.status,
      _vagasDisponiveis: deslocamento.vagasDisponiveis,
      _vagas: deslocamento.vagas,
    };
    return db.insert(_tablename, deslocamentoMap);
  }

  static Future<int> delete(int deslocamentoId) async {
    final Database db = await createDatabase();
    return await db.delete(
      _tablename,
      where: '$_id = ?',
      whereArgs: [deslocamentoId],
    );
  }

  static Future<int?> getDeslocamentoId(Deslocamento deslocamento) async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      _tablename,
      where: '$_veiculoId = ? AND $_horaSaida = ? AND $_origemId = ? AND $_destinoId = ? AND $_status = ? AND $_vagasDisponiveis = ? AND $_vagas = ?',
      whereArgs: [
        deslocamento.veiculoId,
        deslocamento.horaSaida,
        deslocamento.origemId,
        deslocamento.destinoId,
        deslocamento.status,
        deslocamento.vagasDisponiveis,
        deslocamento.vagas,
      ],
      limit: 1,
    );

    if (result.isNotEmpty) {
      final Map<String, dynamic> row = result.first;
      final int id = row[_id];
      return id;
    }

    return null;
  }

  static Future<List<Deslocamento>> findDeslocamentosByFilters(List<int> tipoVeiculos, int usuarioId, bool meusDeslocamentos, {List<String>? bairros}) async {
    print("bairros: ${bairros}");
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tablename);
    final List<Deslocamento> deslocamentos = [];
    for (Map<String, dynamic> row in result) {
      final Veiculo? veiculo = await VeiculoDAO.findById(row[_veiculoId]);

      // Recupere os endereços de origem e destino com base em origemId e destinoId
      final Endereco? origem = await EnderecoDAO.findByIndex(row[_origemId]);
      final Endereco? destino = await EnderecoDAO.findByIndex(row[_destinoId]);

      if ((veiculo != null && tipoVeiculos.contains(veiculo.tipo)) || (row[_veiculoId] == null && tipoVeiculos.contains(2))) {
        final Deslocamento deslocamento = Deslocamento(
          id: row[_id],
          veiculoId: row[_veiculoId],
          horaSaida: row[_horaSaida],
          origemId: row[_origemId],
          destinoId: row[_destinoId],
          status: row[_status],
          vagasDisponiveis: row[_vagasDisponiveis],
          vagas: row[_vagas],
        );

        if (meusDeslocamentos) {
          final PassageirosDeslocamento? passageiroDeslocamento = await PassageirosDeslocamentoDAO.findByDeslocamentoIdAndUserId(deslocamento.id ?? 0, usuarioId);
          if (passageiroDeslocamento == null) {
            continue;
          }
        }

        // Verifique se a partida ou a origem está em um dos bairros especificados, se a lista de bairros for fornecida.
        if (bairros == null || bairros.contains(origem?.bairro) || bairros.contains(destino?.bairro)) {
          deslocamentos.add(deslocamento);
        }
      }
    }
    return deslocamentos;
  }

  static Future<List<Deslocamento>> findAll() async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tablename);
    final List<Deslocamento> deslocamentos = [];
    for (Map<String, dynamic> row in result) {
      final Deslocamento deslocamento = Deslocamento(
        id: row[_id],
        veiculoId: row[_veiculoId],
        horaSaida: row[_horaSaida],
        origemId: row[_origemId],
        destinoId: row[_destinoId],
        status: row[_status],
        vagasDisponiveis: row[_vagasDisponiveis],
        vagas: row[_vagas],
      );
      deslocamentos.add(deslocamento);
    }
    return deslocamentos;
  }
}
