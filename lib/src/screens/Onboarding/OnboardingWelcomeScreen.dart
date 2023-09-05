import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:juno/src/app/theme/colors.dart';
import 'package:juno/src/screens/Onboarding/VamosComecarScreen.dart';
import 'package:juno/src/screens/Onboarding/OnboardingEmergencyButton.dart';

class OnboardingWelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VamosComecarScreen()),
                      );
                    },
                    child: const Row(
                      children: [
                        Text(
                          'Pular',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: AppColors.purple,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 10,
                          color: AppColors.purple,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
            const SizedBox(height: 90),
            const BemVinda(
              svgPath: 'assets/Bem-Vinda.svg',
              size: 200,
            ),
            const SizedBox(height: 67.5),
            const Text(
              'Bem-Vinda!',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: AppColors.red,
              ),
            ),
            const SizedBox(height: 42),
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Text(
                // delimitador de caracteres por linha
                softWrap: true,
                'Um espaço colaborativo criado para as mulheres da Universidade Federal Rural de Pernambuco',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Poppins',
                  color: AppColors.purple,
                ),
              ),
            ),
            const SizedBox(height: 72),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OnboardingEmergencyButton()),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: AppColors.darkOrange,
                foregroundColor: AppColors.white,
                padding: const EdgeInsets.fromLTRB(48, 16, 48, 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              child: const Text(
                "Começar",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 29),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Identificador de tela
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.purple,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                      border: Border.all()),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                      border: Border.all()),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                      border: Border.all()),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                      border: Border.all()),
                ),
              ],
            ),
          ],
        ),
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
