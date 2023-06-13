import 'package:flutter/material.dart';

import '../../../utils/state_manager.dart';

class RidesAndCompaniesController extends StateManagerController {
  final TextEditingController meetingPoint = TextEditingController();
  final TextEditingController destionation = TextEditingController();
  final TextEditingController departureTime = TextEditingController();

  int currentPageIndex = 0;

  void setCurrentPageIndex(int index) {
    currentPageIndex = index;
    update();
  }
}
