import 'package:flutter/material.dart';
import 'alert_dialogs.dart';

import '../app/theme/colors.dart';

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.white24,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: AppColors.white,
          selectedFontSize: 0,
          backgroundColor: AppColors.darkOrange,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              tooltip: 'Fórum',
              label: 'Fórum',
              icon: Icon(
                Icons.forum_outlined,
                size: 36,
              ),
            ),
            BottomNavigationBarItem(
              tooltip: 'Pontos de insegurança',
              label: 'Pontos de insegurança',
              icon: Icon(
                Icons.location_on_outlined,
                size: 36,
              ),
            ),
            BottomNavigationBarItem(
              tooltip: 'Caronas e Companhias',
              label: 'Caronas e Companhias',
              icon: Icon(
                Icons.group,
                size: 36,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
