import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:juno/src/app/theme/colors.dart';
import 'package:juno/src/screens/Onboarding/OnboardingWelcomeScreen.dart';

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
    Future.delayed(
      const Duration(seconds: 3), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => OnboardingWelcomeScreen()),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.cards,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PeacockLogo(
              svgPath: 'assets/peacock.svg',
              size: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Juno',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 100,
                color: AppColors.red,
              ),
            )
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
