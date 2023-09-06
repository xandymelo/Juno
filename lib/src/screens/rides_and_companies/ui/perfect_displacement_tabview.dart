import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:juno/src/screens/rides_and_companies/controllers/rides_and_companies_controller.dart';
import 'package:juno/src/utils/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app/theme/colors.dart';
import '../../../services/h3_service.dart';
import 'general_tabview.dart';

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
              controller: controller.departureNeighborhood,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.zero,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.black,
                    width: 2,
                  ),
                ),
                labelText: 'Bairro de partida',
                labelStyle: TextStyle(
                  color: AppColors.grey,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controller.destionationNeighborhood,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.zero,
                labelText: 'Bairro de destino',
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
              onPressed: () async {
                final String bairroPartida = controller.departureNeighborhood.text;
                final String bairroDestino = controller.destionationNeighborhood.text;

                try {
                  final responseData = await fetchData(bairroPartida, bairroDestino);
                  final response = json.decode(responseData);
                  final List<String> bairrosList = [];

                  for (var item in response) {
                    if (item.isNotEmpty) {
                      final String bairro = item[0].toString();
                      bairrosList.add(bairro);
                    }
                  }
                  print('Dados recebidos: $response');
                  final prefs = await SharedPreferences.getInstance();
                  if (bairrosList.length > 0) {
                    await prefs.setStringList('bairros', bairrosList);
                  }
                  controller.setCurrentPageIndex(1);
                } catch (e) {
                  print('Erro ao fazer a requisição: $e');
                }
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
