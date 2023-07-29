import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:juno/src/screens/Login/login.dart';
import 'package:juno/src/screens/signUp/SignUp_screen.dart';

class VamosComecarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 237, 237, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Comecar(
              svgPath: 'assets/VamosComecarImagem.svg',
              size: 205,
              // color: Color.fromRGBO(62, 0, 71, 0.984),
            ),
            const Text(
              'Vamos',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(193, 8, 20, 0.976),
              ),
            ),
            const Text(
              'começar',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(193, 8, 20, 0.976),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'O que você deseja fazer?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Color.fromRGBO(62, 0, 71, 0.984),
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                minimumSize: const Size(200, 50),
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 14),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const RegistrationScreen()),
                );
              },
              child: const Text(
                'Cadastro',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: const Size(200, 50),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class Comecar extends StatelessWidget {
  final String svgPath;
  final double size;

  const Comecar({
    required this.svgPath,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgPath,
      width: size,
      height: size,
    );
  }
}
