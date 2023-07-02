import 'package:flutter/material.dart';
import 'package:juno/src/screens/rides_and_companies/ui/perfect_displacements_screen.dart';

import '../../../app/theme/colors.dart';
import '../../../utils/state_manager.dart';
import '../../../widgets/app_bottom_navigation_bar.dart';
import '../controllers/rides_and_companies_controller.dart';
import 'general_tabview.dart';
import 'perfect_displacement_tabview.dart';

class NewDisplacementScreen extends StatelessWidget {
  const NewDisplacementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.darkOrange,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: AppColors.white),
                onPressed: () => Navigator.of(context).pop(),
              );
            },
          ),
          centerTitle: true,
          title: Text(
            'NOVO DESLOCAMENTO'.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.white,
            ),
          ),
        ),
        body: Center (
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/undraw_order_ride.png',
                scale: 1.5,
                ),
              Container(
                padding: const EdgeInsets.all(33),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.purple,
                    foregroundColor: AppColors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  ),
                  child: const Text(
                    'Criar nova carona',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(40),
              ),
              Image.asset(
                'assets/undraw_social.png',
                scale: 1.5,
                ),
              Container(
                padding: const EdgeInsets.all(33),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.purple,
                    foregroundColor: AppColors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                  ),
                  child: const Text(
                    'Criar nova companhia',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),              
            ],
          ),
        ),
      ),
    );
  }
}