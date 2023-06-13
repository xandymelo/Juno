import 'package:flutter/material.dart';

import '../../../app/theme/colors.dart';
import '../mock/general_displacements_mock.dart';
import '../models/displacement_model.dart';
import 'widgets/displacement_tile.dart';

class GeneralTabView extends StatelessWidget {
  const GeneralTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.filter_list,
                  size: 32,
                ),
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
