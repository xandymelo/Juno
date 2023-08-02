import '../../../models/veiculo.dart';
import '../ui/widgets/displacement_tile.dart';

class DisplacementModel {
  final ActionType actionType;
  final VehicleType vehicleType;
  final String hour;
  final String locationName;
  final String personName;
  final String personAvatarUrl;
  final int vacancies;
  final Veiculo? veiculo;
  final String municipioOrigem;
  final String municipioDestino;
  final String CriadorCaronaUserName;
  final int DeslocamentoId;
  final int QuantidadeVagas;
  final int QuantidadeVagasDisponiveis;

  DisplacementModel(
      {required this.actionType,
      required this.vehicleType,
      required this.hour,
      required this.locationName,
      required this.personName,
      required this.personAvatarUrl,
      required this.vacancies,
      required this.veiculo,
      required this.municipioOrigem,
      required this.municipioDestino,
      required this.CriadorCaronaUserName,
      required this.DeslocamentoId,
      required this.QuantidadeVagas,
      required this.QuantidadeVagasDisponiveis});
}
