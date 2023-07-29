import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:juno/src/screens/Onboarding/CaronasCompanhiaScreen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 237, 237, 1),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BemVinda(
                svgPath: 'assets/Bem-Vinda.svg',
                size: 200,
              ),
              Text(
                'Bem-Vinda!',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  color: Color.fromRGBO(193, 8, 20, 0.976),
                ),
              ),
              SizedBox(height: 16),
              Text(
                // delimitador de caracteres por linha
                softWrap: true,
                'Um espaço colaborativo criado para as mulheres da Universidade Federal Rural de Pernambuco',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Poppins',
                  color: Color.fromRGBO(62, 0, 71, 0.984),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Identificador de tela
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 72,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => CaronasCompanhiaScreen()),
                );
              },
              child: const Text(
                "Próximo",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BemVinda extends StatelessWidget {
  final String svgPath;
  final double size;

  const BemVinda({
    super.key,
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
