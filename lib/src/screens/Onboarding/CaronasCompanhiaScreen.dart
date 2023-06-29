import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:juno/src/screens/Onboarding/CaronasCompanhiaScreen.dart';

class CaronasCompanhiaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 237, 237, 1),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BemVinda(
                svgPath: 'assets/Bem-Vinda.svg',
                size: 200,
                color: Color.fromRGBO(62, 0, 71, 0.984),
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
                softWrap: true,
                'Organize e participe de grupos de locomoção, além de oferecer e pegar carona.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                  color: Color.fromRGBO(62, 0, 71, 0.984),
                ),
              ),
              // SizedBox(height: 16),
              // Text(
              //   // 'Let\'s get started!',
              //   style: TextStyle(
              //     fontSize: 16,
              //     fontWeight: FontWeight.normal,
              //     color: Color.fromRGBO(62, 0, 71, 0.984),
              //   ),
              // ),
              SizedBox(height: 16),
              CircularProgressIndicator(),
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
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors
                        .grey, // Altere a cor de acordo com a lógica do seu identificador
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors
                        .red, // Altere a cor de acordo com a lógica do seu identificador
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors
                        .grey, // Altere a cor de acordo com a lógica do seu identificador
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors
                        .grey, // Altere a cor de acordo com a lógica do seu identificador
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 72,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/VamosComecarScreen');
              },
              child: Text(
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

class BemVinda extends StatelessWidget {
  final String svgPath;
  final double size;
  final Color color;

  const BemVinda({
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
