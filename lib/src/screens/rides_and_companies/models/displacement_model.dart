import '../ui/widgets/displacement_tile.dart';

class DisplacementModel {
  final ActionType actionType;
  final VehicleType vehicleType;
  final String hour;
  final String locationName;
  final String personName;
  final String personAvatarUrl;
  final int vacancies;

  DisplacementModel({
    required this.actionType,
    required this.vehicleType,
    required this.hour,
    required this.locationName,
    required this.personName,
    required this.personAvatarUrl,
    required this.vacancies,
  });
}
