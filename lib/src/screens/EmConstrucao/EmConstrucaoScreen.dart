import 'package:flutter/material.dart';
import 'dart:ui';

import '../../app/theme/colors.dart';

class EmConstrucaoScreen extends StatefulWidget {
  const EmConstrucaoScreen({super.key});

  @override
  State<EmConstrucaoScreen> createState() => _EmConstrucaoScreenState();
}

class _EmConstrucaoScreenState extends State<EmConstrucaoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: const AppBottomNavigationBar(),
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
            Container(
              child: const Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Funcionalidade em Desenvolvimento',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: AppColors.red,
                      ),
                    ),
                    SizedBox(height: 60),
                    Icon(
                      Icons.construction,
                      size: 100,
                      color: AppColors.lightOrange,
                    ),
                    SizedBox(height: 60),
                    Text(
                      'Infelizmente, ainda estamos trabalhando nesta funcionalidade.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 23,
                        color: AppColors.purple,
                      ),
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
