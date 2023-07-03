import 'package:flutter/material.dart';
import 'package:juno/src/screens/rides_and_companies/ui/general_tabview.dart';
import 'package:juno/src/screens/rides_and_companies/ui/perfect_displacement_tabview.dart';
import 'package:juno/src/screens/rides_and_companies/ui/perfect_displacements_screen.dart';
import 'package:juno/src/screens/rides_and_companies/ui/rides_and_companies_screen.dart';

import 'src/app/app_initialization.dart';
import 'src/app/app_widget.dart';

void main() {
  AppInitialization.init();

  runApp(MyApp());
}


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        '/': (context) => PerfectDisplacementsScreen(),
        '/WelcomeScreen': (context) => RidesAndCompaniesScreen(),
      },
    );
  }
}