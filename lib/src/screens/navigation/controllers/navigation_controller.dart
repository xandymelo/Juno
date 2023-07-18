import 'dart:math';
import 'package:flutter/material.dart';
import 'package:juno/src/utils/state_manager.dart';

class NavigationController extends StateManagerController {
  final PageController pageController = PageController();
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void onItemTapped(int index) {
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    _selectedIndex = index;
    update();
  }

  Future<bool> back() async {
    if (_selectedIndex > 0) {
      int index = max(0, --_selectedIndex);
      onItemTapped(index);
      return false;
    }
    return true;
  }
}
