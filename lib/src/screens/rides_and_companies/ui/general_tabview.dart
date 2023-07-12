import 'package:flutter/material.dart';

import '../../../app/theme/colors.dart';
import '../mock/general_displacements_mock.dart';
import '../models/displacement_model.dart';
import 'widgets/displacement_tile.dart';

class GeneralTabView extends StatelessWidget {
  const GeneralTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String carRide = "Carro";

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.purple,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.purple,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              PopupMenuButton(
                offset: const Offset(0, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: Icon(Icons.filter_list),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    onTap: () {
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 14,
                          backgroundColor: AppColors.yellow,
                          child: Icon(
                            size: 18,
                            Icons.directions_car,
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text('Carro'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 14,
                          backgroundColor: AppColors.darkOrange,
                          child: Icon(
                            size: 18,
                            Icons.motorcycle,
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text('Moto'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 14,
                          backgroundColor: AppColors.red,
                          child: Icon(
                            size: 18,
                            Icons.explore,
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text('Companhia'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 14,
                          backgroundColor: AppColors.purple,
                          child: Icon(
                            size: 18,
                            Icons.bookmark_added_rounded,
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text('Meus Deslocamentos'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(),
        Flexible(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: generalDisplacementsMock.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) => DisplacementTile(
              displacementModel: DisplacementModel(
                locationName: generalDisplacementsMock[index].locationName,
                personName: generalDisplacementsMock[index].personName,
                personAvatarUrl: generalDisplacementsMock[index].personAvatarUrl,
                hour: generalDisplacementsMock[index].hour,
                vacancies: generalDisplacementsMock[index].vacancies,
                actionType: generalDisplacementsMock[index].actionType,
                vehicleType: generalDisplacementsMock[index].vehicleType,
              ),
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
