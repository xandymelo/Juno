import 'package:flutter/material.dart';
import 'dart:ui';

import '../../app/theme/colors.dart';
import '../../widgets/app_bottom_navigation_bar.dart';

class EmConstrucaoScreen extends StatefulWidget {
  const EmConstrucaoScreen({super.key});

  @override
  State<EmConstrucaoScreen> createState() => _EmConstrucaoScreenState();
}

class _EmConstrucaoScreenState extends State<EmConstrucaoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AppBottomNavigationBar(),
      backgroundColor: AppColors.white,
      body: Center(
        child: Stack(
          children: [
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.construction,
                      size: 100,
                      color: AppColors.lightOrange,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Em construção',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: AppColors.purple,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Desculpe-nos pelo transtorno.\nEstamos trabalhando nesta Funcionalidade.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 23,
                        color: Color.fromRGBO(62, 0, 71, 0.984),
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(
                            color: AppColors.lightPurple,
                          ),
                        ),
                      ),
                      child: const Text('Voltar'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
