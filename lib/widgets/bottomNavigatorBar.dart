import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:juno/colors.dart';

class MyBottomNavigationBar extends StatefulWidget {
  int selectedIndex = 2;
  @override
  _MyBottomNavigationBarState createState() =>
      _MyBottomNavigationBarState(selectedIndex: selectedIndex);
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int selectedIndex;
  // índice do item selecionado
  // lista de itens de menu
  _MyBottomNavigationBarState({required this.selectedIndex});
  // lista de telas correspondentes a cada item de menu

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/forum_unselected.svg'),
            label: 'Fórum',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/location_on_unselected.svg'),
            label: 'Pontos de insegurança',
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 2
                ? SvgPicture.asset('assets/group_selected.svg')
                : SvgPicture.asset('assets/group_unselected.svg'),
            label: 'Caronas e Companhias',
          ),
        ], // define os itens de menu
        currentIndex: selectedIndex, // define o item selecionado
        onTap: (index) {
          setState(() {
            selectedIndex = index; // atualiza o item selecionado
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: AppColors.orange,
        selectedItemColor: Colors.white,
      ),
    );
  }
}
