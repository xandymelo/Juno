import 'package:flutter/material.dart';
import 'package:juno/src/screens/Onboarding/LogoScreen.dart';
import 'package:juno/src/screens/Onboarding/VamosComecarScreen.dart';
import "package:juno/src/screens/Onboarding/WelcomeScreen.dart";
import "package:juno/src/screens/Login/LoginScreen.dart";
import 'package:juno/src/screens/Onboarding/CaronasCompanhiaScreen.dart';

import 'src/app/app_initialization.dart';
import 'src/app/app_widget.dart';

void main() {
  AppInitialization.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LogoScreen(),
        '/WelcomeScreen': (context) => WelcomeScreen(),
        '/VamosComecarScreen': (context) => VamosComecarScreen(),
        '/LoginScreen': (context) => LoginScreen(),
        '/CaronasCompanhiaScreen': (context) => CaronasCompanhiaScreen(),
      },
    );
  }
}
