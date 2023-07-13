import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CaronasCompanhiaScreen extends StatelessWidget {
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
              Caronas(
                svgPath: 'assets/CaronasImagem.svg',
                size: 200,
              ),
              Text(
                'Caronas e',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(193, 8, 20, 0.976),
                ),
              ),
              Text(
                'Companhia',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(193, 8, 20, 0.976),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Organize e participe de grupos de locomoção, além de oferecer e pegar carona.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 23,
                  fontWeight: FontWeight.normal,
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
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors
                        .grey, // Altere a cor de acordo com a lógica do seu identificador
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors
                        .red, // Altere a cor de acordo com a lógica do seu identificador
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 55,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/VamosComecar');
              },
              child: const Text(
                "Começar",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors
                    .red, // Altere a cor do botão de acordo com sua preferência
                onPrimary: Colors
                    .white, // Altere a cor do texto do botão de acordo com sua preferência
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

class Caronas extends StatelessWidget {
  final String svgPath;
  final double size;

  const Caronas({
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
