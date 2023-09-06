import 'package:flutter/material.dart';

import '../../../utils/state_manager.dart';

class RidesAndCompaniesController extends StateManagerController {
  final TextEditingController departureNeighborhood = TextEditingController();
  final TextEditingController destionationNeighborhood = TextEditingController();
  final TextEditingController departureTime = TextEditingController();

  int currentPageIndex = 0;

  void setCurrentPageIndex(int index) {
    currentPageIndex = index;
    update();
  }
}
