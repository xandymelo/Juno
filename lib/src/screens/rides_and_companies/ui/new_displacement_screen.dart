import 'package:flutter/material.dart';
import 'package:juno/src/screens/rides_and_companies/ui/new_ride_form_screen.dart';

import '../../../app/theme/colors.dart';
import '../../../widgets/alert_dialogs.dart';

class NewDisplacementScreen extends StatelessWidget {
  const NewDisplacementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.darkOrange,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: AppColors.white),
                onPressed: () => Navigator.of(context).pop(),
              );
            },
          ),
          centerTitle: true,
          title: Text(
            'NOVO DESLOCAMENTO'.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.white,
            ),
          ),
        ),
        body: Center (
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/undraw_order_ride.png',
                  scale: 1.5,
                ),
                Container(
                  padding: const EdgeInsets.all(33),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NewRideFormScreen()));
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.purple,
                      foregroundColor: AppColors.white,
                      padding: const EdgeInsets.fromLTRB(50, 9, 50, 9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    child: const Text(
                      'Criar nova carona',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(40),
                ),
                Image.asset(
                  'assets/undraw_social.png',
                  scale: 1.5,
                ),
                Container(
                  padding: const EdgeInsets.all(33),
                  child: TextButton(
                    onPressed: () {
                      showAlertDialog(context);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.purple,
                      foregroundColor: AppColors.white,
                      padding: const EdgeInsets.fromLTRB(40, 9, 40, 9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    child: const Text(
                      'Criar nova companhia',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
