import 'package:flutter/material.dart';
import 'package:juno/src/screens/rides_and_companies/ui/perfect_displacements_screen.dart';
import 'package:juno/src/screens/rides_and_companies/ui/new_displacement_screen.dart';
import 'general_tabview.dart';
import 'perfect_displacement_tabview.dart';

import '../../../app/theme/colors.dart';
import '../../../widgets/app_bottom_navigation_bar.dart';


class NewRideFormScreen extends StatelessWidget {
  const NewRideFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.darkOrange,
          centerTitle: true,
          title: Text(
            'CRIAR CARONA'.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.white,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {  Navigator.push(context, MaterialPageRoute(builder: (context) => const NewDisplacementScreen()));},
          shape: const CircleBorder(),
          backgroundColor: AppColors.purple,
          foregroundColor: AppColors.white,
          child: 
            const Icon(Icons.add),
        ),
        bottomNavigationBar: const AppBottomNavigationBar(),
      ),
    );
  }
}
