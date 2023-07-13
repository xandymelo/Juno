import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:juno/src/screens/Onboarding/WelcomeScreen.dart';

import '../screens/login/login.dart';
import '../screens/rides_and_companies/ui/rides_and_companies_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Juno',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: WelcomeScreen(),
    );
  }
}
