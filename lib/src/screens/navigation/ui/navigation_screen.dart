import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juno/src/screens/Forum/Forum.dart';
import 'package:juno/src/screens/rides_and_companies/ui/rides_and_companies_screen.dart';
import 'package:juno/src/utils/state_manager.dart';

import '../../../app/theme/colors.dart';
import '../../Mapa/Mapa.dart';
import '../controllers/navigation_controller.dart';
import '../models/screen_model.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  NavigationController get controller =>
      StateManager.get<NavigationController>();

  ScreenList get _screens => [
        ScreenModel(
          screen: const RidesAndCompaniesScreen(),
          label: 'Caronas e Companhias',
          activeIcon: Icons.group,
          icon: Icons.group_outlined,
        ),
        ScreenModel(
          screen: const ForumScreen(),
          label: 'Fórum',
          activeIcon: Icons.forum,
          icon: Icons.forum_outlined,
        ),
        ScreenModel(
          screen: const MapaScreen(),
          label: 'Mapa',
          activeIcon: Icons.location_on,
          icon: Icons.location_on_outlined,
        ),
      ];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.back,
      child: Scaffold(
        body: Center(
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller.pageController,
            onPageChanged: controller.onPageChanged,
            children: _screens.map((screen) => screen.screen).toList(),
          ),
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: StateManagerBuilder<NavigationController>(
              builder: () => BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                currentIndex: controller.selectedIndex,
                type: BottomNavigationBarType.fixed,
                backgroundColor: AppColors.darkOrange,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white,
                selectedFontSize: 10,
                unselectedFontSize: 10,
                onTap: controller.onItemTapped,
                elevation: 0,
                items: _screens.map((screen) {
                  return BottomNavigationBarItem(
                    activeIcon: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Icon(
                        screen.activeIcon,
                        size: 36,
                      ),
                    ),
                    icon: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Icon(screen.icon, size: 36),
                    ),
                    label: screen.label,
                    tooltip: '',
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
