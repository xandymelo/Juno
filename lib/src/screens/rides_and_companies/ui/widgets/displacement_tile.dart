import 'package:flutter/material.dart';
import 'package:juno/src/screens/rides_and_companies/models/displacement_model.dart';

import '../../../../app/theme/colors.dart';
import '../displacement_details_screen.dart';

enum ActionType {
  manage,
  edit,
  details;

  get name {
    switch (this) {
      case ActionType.manage:
        return 'Gerenciar';
      case ActionType.edit:
        return 'Editar';
      case ActionType.details:
        return 'Detalhes';
    }
  }
}

enum VehicleType {
  car,
  motorcycle,
  explore;

  get iconData {
    switch (this) {
      case VehicleType.car:
        return Icons.directions_car;
      case VehicleType.motorcycle:
        return Icons.motorcycle;
      case VehicleType.explore:
        return Icons.explore;
    }
  }

  get iconColor {
    switch (this) {
      case VehicleType.car:
        return AppColors.yellow;
      case VehicleType.motorcycle:
        return AppColors.darkOrange;
      case VehicleType.explore:
        return AppColors.red;
    }
  }
}

class DisplacementTile extends StatelessWidget {
  const DisplacementTile({super.key, required this.displacementModel});

  final DisplacementModel displacementModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(
                  displacementModel.personAvatarUrl,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        displacementModel.locationName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: displacementModel.vehicleType.iconColor,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Icon(
                          displacementModel.vehicleType.iconData,
                          size: 16,
                          color: AppColors.white,
                        ),
                      )
                    ],
                  ),
                  Text(
                    '${displacementModel.personName} • ${displacementModel.hour}',
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              )
            ],
          ),
          Column(
            children: [
              ElevatedButton(
                onPressed: displacementModel.actionType != ActionType.details
                    ? () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DisplacementDetailsScreen(
                                      veiculo: displacementModel.veiculo,
                                      municipioDestino: displacementModel.municipioDestino,
                                      municipioOrigem: displacementModel.municipioOrigem,
                                      criadorCaronaUserName: displacementModel.CriadorCaronaUserName,
                                      criadorCaronaUserPhotoUrl: displacementModel.personAvatarUrl,
                                      quantidadeVagas: displacementModel.QuantidadeVagas,
                                      quantidadeVagasDisponiveis: displacementModel.QuantidadeVagasDisponiveis,
                                      criadorCaronaId: displacementModel.criadorCaronaId,
                                      deslocamentoId: displacementModel.DeslocamentoId,
                                    )));
                      }
                    : () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DisplacementDetailsScreen(
                                      veiculo: displacementModel.veiculo,
                                      municipioDestino: displacementModel.municipioDestino,
                                      municipioOrigem: displacementModel.municipioOrigem,
                                      criadorCaronaUserName: displacementModel.CriadorCaronaUserName,
                                      criadorCaronaUserPhotoUrl: displacementModel.personAvatarUrl,
                                      quantidadeVagas: displacementModel.QuantidadeVagas,
                                      quantidadeVagasDisponiveis: displacementModel.QuantidadeVagasDisponiveis,
                                      criadorCaronaId: displacementModel.criadorCaronaId,
                                      deslocamentoId: displacementModel.DeslocamentoId,
                                    )));
                      },
                style: ElevatedButton.styleFrom(
                  foregroundColor: AppColors.white,
                  backgroundColor: displacementModel.actionType != ActionType.details ? AppColors.lightPurple : AppColors.purple,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  minimumSize: const Size(100, 35),
                ),
                child: Text(
                  displacementModel.actionType.name,
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${displacementModel.vacancies} vaga${displacementModel.vacancies > 1 ? 's' : ''}',
                style: const TextStyle(
                  fontSize: 10,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
