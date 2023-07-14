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
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.construction,
                      size: 100,
                      color: AppColors.lightOrange,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Em construção',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: AppColors.purple,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Desculpe-nos pelo transtorno.\nEstamos trabalhando nesta Funcionalidade.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 23,
                        color: Color.fromRGBO(62, 0, 71, 0.984),
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
