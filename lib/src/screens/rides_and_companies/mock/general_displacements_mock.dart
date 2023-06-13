import '../models/displacement_model.dart';
import '../ui/widgets/displacement_tile.dart';

final List<DisplacementModel> generalDisplacementsMock = [
  DisplacementModel(
    locationName: 'Casa Amarela',
    personName: 'Brenda Souza',
    personAvatarUrl: 'https://i.pravatar.cc/150?img=1',
    hour: '17:30h',
    vacancies: 4,
    actionType: ActionType.edit,
    vehicleType: VehicleType.car,
  ),
  DisplacementModel(
    locationName: 'Candeias',
    personName: 'Nicole Reis',
    personAvatarUrl: 'https://i.pravatar.cc/150?img=2',
    hour: '18:30h',
    vacancies: 2,
    actionType: ActionType.manage,
    vehicleType: VehicleType.explore,
  ),
  DisplacementModel(
    locationName: 'Biblioteca Central',
    personName: 'Nicole Reis',
    personAvatarUrl: 'https://i.pravatar.cc/150?img=3',
    hour: '18:30h',
    vacancies: 2,
    actionType: ActionType.manage,
    vehicleType: VehicleType.motorcycle,
  ),
  DisplacementModel(
    locationName: 'Parnamirim',
    personName: 'Rafaela Dias',
    personAvatarUrl: 'https://i.pravatar.cc/150?img=4',
    hour: '18:30h',
    vacancies: 1,
    actionType: ActionType.details,
    vehicleType: VehicleType.motorcycle,
  ),
  DisplacementModel(
    locationName: 'Olinda',
    personName: 'Alice Oliveira',
    personAvatarUrl: 'https://i.pravatar.cc/150?img=5',
    hour: '20:45h',
    vacancies: 3,
    actionType: ActionType.details,
    vehicleType: VehicleType.motorcycle,
  ),
];
