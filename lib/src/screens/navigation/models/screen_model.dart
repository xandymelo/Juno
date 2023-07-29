import 'package:flutter/material.dart';

typedef ScreenList = List<ScreenModel>;

class ScreenModel {
  ScreenModel({
    required this.screen,
    required this.label,
    required this.activeIcon,
    required this.icon,
  });

  final Widget screen;
  final String label;
  final IconData activeIcon;
  final IconData icon;
}
