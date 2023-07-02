import 'package:flutter/material.dart';
import 'package:juno/src/screens/rides_and_companies/ui/perfect_displacements_screen.dart';
import 'package:juno/src/screens/rides_and_companies/ui/new_displacement_screen.dart';
import 'perfect_displacement_tabview.dart';

import '../../../app/theme/colors.dart';
import '../../../utils/state_manager.dart';
import '../../../widgets/app_bottom_navigation_bar.dart';
import '../controllers/rides_and_companies_controller.dart';
import 'general_tabview.dart';


class RidesAndCompaniesScreen extends StateManagerView<RidesAndCompaniesController> {
  const RidesAndCompaniesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.darkOrange,
          centerTitle: true,
          title: Text(
            'CARONAS E COMPANHIAS'.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.white,
            ),
          ),
        ),
        body: Column(
          children: [
            const TabBar.secondary(
              labelColor: AppColors.purple,
              unselectedLabelColor: AppColors.purple,
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.normal,
              ),
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              indicatorColor: AppColors.purple,
              indicatorWeight: 3,
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          'Deslocamento Perfeito',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Icon(Icons.auto_awesome, color: AppColors.purple),
                    ],
                  ),
                ),
                Tab(text: 'Geral'),
              ],
            ),
            Expanded(
              child: HBuilder(
                () => TabBarView(
                  children: [
                    controller.currentPageIndex == 0
                        ? PerfectDisplacementTabView(
                            onSearch: () {
                              controller.setCurrentPageIndex(1);
                            },
                          )
                        : PerfectDisplacementsScreen(),
                    const GeneralTabView(),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const NewDisplacementScreen()));},
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
