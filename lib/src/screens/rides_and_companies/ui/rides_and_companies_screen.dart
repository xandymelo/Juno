import 'package:flutter/material.dart';
import 'package:juno/src/screens/rides_and_companies/ui/perfect_displacements_screen.dart';

import '../../../app/theme/colors.dart';
import '../../../utils/state_manager.dart';
import '../../../widgets/app_bottom_navigation_bar.dart';
import '../controllers/rides_and_companies_controller.dart';
import 'general_tabview.dart';
import 'perfect_displacement_tabview.dart';

class RidesAndCompaniesScreen extends StateManagerView<RidesAndCompaniesController> {
  const RidesAndCompaniesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: const AppBottomNavigationBar(),
        appBar: AppBar(
          backgroundColor: AppColors.darkOrange,
          centerTitle: true,
          title: Text(
            'Caronas e Companhias'.toUpperCase(),
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
      ),
    );
  }
}
