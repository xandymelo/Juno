import 'package:flutter/material.dart';
import 'package:juno/src/screens/rides_and_companies/controllers/rides_and_companies_controller.dart';
import 'package:juno/src/utils/state_manager.dart';

import '../../../app/theme/colors.dart';

class PerfectDisplacementTabView extends StatelessWidget {
  PerfectDisplacementTabView({Key? key, required this.onSearch}) : super(key: key);

  final Function() onSearch;

  final controller = StateManager.get<RidesAndCompaniesController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 32),
            const Text(
              'Como seria seu deslocamento perfeito?',
              style: TextStyle(
                color: AppColors.red,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'Nos diga para onde quer ir e vamos te indicar as caronas ideias para você',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  color: AppColors.purple,
                ),
              ),
            ),
            const SizedBox(height: 40),
            TextField(
              controller: controller.meetingPoint,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.zero,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.black,
                    width: 2,
                  ),
                ),
                labelText: 'Ponto de encontro',
                labelStyle: TextStyle(
                  color: AppColors.grey,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controller.destionation,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.zero,
                labelText: 'Destino (Local da UFRPE ou Bairro)',
                labelStyle: TextStyle(
                  color: AppColors.grey,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.black,
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controller.departureTime,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.zero,
                labelText: 'Horário de saída',
                labelStyle: TextStyle(
                  color: AppColors.grey,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.black,
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            FilledButton(
              onPressed: () {
                onSearch.call();
              },
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.purple,
              ),
              child: const Text(
                'Deslocamentos perfeitos',
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
