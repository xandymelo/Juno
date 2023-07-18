import 'package:juno/src/screens/navigation/controllers/navigation_controller.dart';

import '../utils/state_manager.dart';

import '../screens/rides_and_companies/controllers/rides_and_companies_controller.dart';

abstract class AppControllers {
  static void init() {
    StateManager.put(RidesAndCompaniesController());
    StateManager.put(NavigationController());
  }
}
