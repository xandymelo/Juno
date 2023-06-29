import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
              svgPath: 'assets/group_selected.svg',
              size: 200,
              color: Color.fromRGBO(62, 0, 71, 0.984),
            ),
            const Text(
              'Vamos',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(193, 8, 20, 0.976),
              ),
            ),
            const Text(
              'começar',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(193, 8, 20, 0.976),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'O que você deseja fazer?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Color.fromRGBO(62, 0, 71, 0.984),
              ),
            ),
            const SizedBox(height: 60), // Ajuste a altura conforme necessário
            ElevatedButton(
              onPressed: () {
                // Ação do botão de login
              },
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                minimumSize: const Size(200, 50),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Ação do botão de cadastro
              },
              child: const Text(
                'Cadastro',
                style: TextStyle(
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
  final Color color;

  const Comecar({
    required this.svgPath,
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgPath,
      width: size,
      height: size,
      color: color,
    );
  }
}
