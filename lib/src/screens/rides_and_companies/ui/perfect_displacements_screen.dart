import 'package:flutter/material.dart';
import 'package:juno/src/screens/rides_and_companies/controllers/rides_and_companies_controller.dart';
import 'package:juno/src/utils/state_manager.dart';

import '../../../app/theme/colors.dart';
import '../mock/perfect_displacements_mock.dart';
import '../models/displacement_model.dart';
import 'widgets/displacement_tile.dart';

class PerfectDisplacementsScreen extends StatelessWidget {
  PerfectDisplacementsScreen({super.key});

  final controller = StateManager.get<RidesAndCompaniesController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: perfectDisplacementsMock.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) => DisplacementTile(
              displacementModel: DisplacementModel(
                locationName: perfectDisplacementsMock[index].locationName,
                personName: perfectDisplacementsMock[index].personName,
                personAvatarUrl: perfectDisplacementsMock[index].personAvatarUrl,
                hour: perfectDisplacementsMock[index].hour,
                vacancies: perfectDisplacementsMock[index].vacancies,
                actionType: perfectDisplacementsMock[index].actionType,
                vehicleType: perfectDisplacementsMock[index].vehicleType,
              ),
            ),
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(33),
          child: ElevatedButton(
            onPressed: () {
              controller.setCurrentPageIndex(0);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.purple,
              foregroundColor: AppColors.white,
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 18),
            ),
            child: const Text(
              'Mudar preferências de deslocamento',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
