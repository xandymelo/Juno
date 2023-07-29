import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoScreen extends StatefulWidget {
  const LogoScreen({super.key});

  @override
  _LogoScreenState createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  void initState() {
    super.initState();
    // Lógica de redirecionamento para a tela WelcomeScreen
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/Welcome');
    });
  }

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
            ),
            SizedBox(height: 20),
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

  const PeacockLogo({required this.svgPath, required this.size});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgPath,
      width: size,
      height: size,
    );
  }
}
