import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:juno/src/screens/navigation/ui/navigation_screen.dart';

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
      home: const NavigationScreen(),
    );
  }
}
