import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Onboarding/LogoScreen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 237, 237, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            VamosComecar(
              svgPath: 'assets/CaronasImagem.svg',
              size: 200,
            ),
            SizedBox(height: 16),
            Text(
              'Login',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.purple,
              ),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/LoginScreen');
              },
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Color.fromRGBO(62, 0, 71, 0.984),
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromRGBO(255, 237, 237, 1)),
                padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.fromLTRB(50, 10, 50, 10)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(
                      color: Color.fromRGBO(62, 0, 71, 0.984),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class VamosComecar extends StatelessWidget {
  final String svgPath;
  final double size;

  const VamosComecar(
      {required this.svgPath, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset(
        svgPath,
        height: size,
        width: size,
      ),
    );
  }
}
