import 'package:juno/src/database/dao/passageiros_deslocamento_dao.dart';
import 'package:juno/src/database/dao/veiculo_dao.dart';
import 'package:juno/src/screens/rides_and_companies/ui/widgets/displacement_tile.dart';
import 'package:sqflite/sqflite.dart';
import '../../models/deslocamento.dart';
import '../../models/passageiros_deslocamento.dart';
import '../../models/veiculo.dart';
import '../app_database.dart';

class DeslocamentoDAO {
  static const createTable = '''
    CREATE TABLE `deslocamento` (
      `Id` INTEGER NOT NULL,
      `VeiculoID` INTEGER DEFAULT NULL,
      `HoraSaida` TEXT DEFAULT NULL,
      `Origemid` INTEGER NOT NULL,
      `DestinoId` INTEGER NOT NULL,
      `Status` INTEGER NOT NULL,
      `VagasDisponiveis` INTEGER DEFAULT NULL,
      PRIMARY KEY (`Id`),
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

  static Future<int> save(Deslocamento deslocamento) async {
    final Database db = await createDatabase();
    final Map<String, dynamic> deslocamentoMap = {
      _id: deslocamento.id,
      _veiculoId: deslocamento.veiculoId,
      _horaSaida: deslocamento.horaSaida,
      _origemId: deslocamento.origemId,
      _destinoId: deslocamento.destinoId,
      _status: deslocamento.status,
      _vagasDisponiveis: deslocamento.vagasDisponiveis,
    };
    return db.insert(_tablename, deslocamentoMap);
  }

  static Future<List<Deslocamento>> findDeslocamentosByFilters(
      List<int> tipoVeiculos, int usuarioId, bool meusDeslocamentos) async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tablename);
    final List<Deslocamento> deslocamentos = [];
    for (Map<String, dynamic> row in result) {
      final Veiculo? veiculo = await VeiculoDAO.findById(row[_veiculoId]);
      if ((veiculo != null && tipoVeiculos.contains(veiculo.tipo)) ||
          (row[_veiculoId] == null && tipoVeiculos.contains(2))) {
        final Deslocamento deslocamento = Deslocamento(
          id: row[_id],
          veiculoId: row[_veiculoId],
          horaSaida: row[_horaSaida],
          origemId: row[_origemId],
          destinoId: row[_destinoId],
          status: row[_status],
          vagasDisponiveis: row[_vagasDisponiveis],
        );

        if (meusDeslocamentos) {
          final PassageirosDeslocamento? passageiroDeslocamento =
              await PassageirosDeslocamentoDAO.findByDeslocamentoIdAndUserId(
                  deslocamento.id, usuarioId);
          if (passageiroDeslocamento == null) {
            continue;
          }
        }
        deslocamentos.add(deslocamento);
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
      );
      deslocamentos.add(deslocamento);
    }
    return deslocamentos;
  }
}
