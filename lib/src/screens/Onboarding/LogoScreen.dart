import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoScreen extends StatefulWidget {
  @override
  _LogoScreenState createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  void initState() {
    super.initState();
    // Lógica de redirecionamento para a tela WelcomeScreen
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/WelcomeScreen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

class PeacockLogo extends StatelessWidget {
  final String svgPath;
  final double size;
  final Color color;

  const PeacockLogo(
      {required this.svgPath, required this.size, required this.color});

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
