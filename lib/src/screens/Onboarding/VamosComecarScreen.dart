import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:juno/src/app/theme/colors.dart';
import 'package:juno/src/screens/Login/login.dart';
import 'package:juno/src/screens/signUp/SignUp_screen.dart';

class VamosComecarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Comecar(
                svgPath: 'assets/VamosComecarImagem.svg',
                size: 205,
                // color: Color.fromRGBO(62, 0, 71, 0.984),
              ),
              const SizedBox(height: 35),
              const Text(
                'Vamos',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: AppColors.red,
                ),
              ),
              const Text(
                'começar',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: AppColors.red,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'O que você deseja fazer?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Color.fromRGBO(62, 0, 71, 0.984),
                ),
              ),
              const SizedBox(height: 70),
              ElevatedButton(
                onPressed: () async {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkOrange,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 48, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  minimumSize: const Size(100, 25),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegistrationScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkOrange,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: const Size(100, 25),
                ),
                child: const Text(
                  'Cadastro',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class Comecar extends StatelessWidget {
  final String svgPath;
  final double size;

  const Comecar({
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
