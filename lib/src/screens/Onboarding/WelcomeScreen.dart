import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:juno/src/screens/Onboarding/VamosComecarScreen.dart';

class WelcomeScreen extends StatelessWidget {
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
                svgPath: 'assets/OnBoarding/forum_unselected.svg',
                size: 200,
                color: Color.fromRGBO(62, 0, 71, 0.984),
              ),
              Text(
                'Bem-Vinda!',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
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
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                  color: Color.fromRGBO(62, 0, 71, 0.984),
                ),
              ),
              //
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
                    color: Colors.red,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: 4),
                //   width: 8,
                //   height: 8,
                //   decoration: BoxDecoration(
                //     shape: BoxShape.circle,
                //     color: Colors.grey,
                //   ),
                // ),
                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: 4),
                //   width: 8,
                //   height: 8,
                //   decoration: BoxDecoration(
                //     shape: BoxShape.circle,
                //     color: Colors.grey,
                //   ),
                // ),
              ],
            ),
          ),
          Positioned(
            bottom: 72,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/CaronasCompanhiaScreen');
              },
              child: Text(
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
