import '../models/displacement_model.dart';
import '../ui/widgets/displacement_tile.dart';

final List<DisplacementModel> perfectDisplacementsMock = [
  DisplacementModel(
    locationName: 'Casa Amarela',
    personName: 'Brenda Souza',
    personAvatarUrl: 'https://i.pravatar.cc/150?img=1',
    hour: '17:30h',
    vacancies: 4,
    actionType: ActionType.details,
    vehicleType: VehicleType.car,
  ),
  DisplacementModel(
    locationName: 'Casa Amarela',
    personName: 'Natália Alves',
    personAvatarUrl: 'https://i.pravatar.cc/150?img=2',
    hour: '13:30h',
    vacancies: 3,
    actionType: ActionType.details,
    vehicleType: VehicleType.motorcycle,
  ),
  DisplacementModel(
    locationName: 'Parnamirim',
    personName: 'Rafaela Dias',
    personAvatarUrl: 'https://i.pravatar.cc/150?img=3',
    hour: '18h',
    vacancies: 1,
    actionType: ActionType.details,
    vehicleType: VehicleType.motorcycle,
  ),
];
