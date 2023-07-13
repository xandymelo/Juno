import 'package:flutter/material.dart';

import '../app/theme/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _loadSelectedIndex();
  }

  Future<void> _loadSelectedIndex() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedIndex = prefs.getInt('selectedIndex') ?? 2;
    });
  }

  Future<void> _saveSelectedIndex(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('selectedIndex', index);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _saveSelectedIndex(index);
      if (index == 0) {
        Navigator.pushNamed(context, '/EmConstrucao');
      } else if (index == 1) {
        Navigator.pushNamed(context, '/EmConstrucao');
      } else if (index == 2) {
        Navigator.pushNamed(context, '/CaronasCompanhia');
      }
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
