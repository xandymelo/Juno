import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            PeacockLogo(
              svgPath: 'assets/peacock.svg',
              size: 200,
              color: Color.fromRGBO(62, 0, 71, 0.984),
            ),
            SizedBox(height: 16),
            Text(
              'Login',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Color.fromRGBO(62, 0, 71, 0.984),
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
