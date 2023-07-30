import 'package:flutter/material.dart';
import 'package:juno/main.dart';
import 'package:juno/src/models/cursos.dart';
import 'package:juno/src/models/sigaa.dart';
import 'package:juno/src/models/user.dart';
import 'package:juno/src/screens/Onboarding/VamosComecarScreen.dart';
import 'package:juno/src/screens/signUp/Address_screen.dart';
import '../../app/theme/colors.dart';
import '../../database/dao/cursos_dao.dart';


class NextPage extends StatelessWidget {
  final User user;
  final Sigaa? sigaaData; // Make sigaaData nullable by adding a '?' after 'Sigaa'

  NextPage({required this.user, this.sigaaData}); // Make sigaaData optional

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 150.0, bottom: 50.0),
              child: Column(
                children: [
                  Text(
                    'Cadastre-se',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.red,
                    ),
                  ),
                  Text(
                    'Confirme seus dados acadêmicos',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.purple,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ListTile(
                    title: Text('Matricula'),
                    subtitle: Text(sigaaData!.matricula.toString(), style: TextStyle(fontSize: 16.0)),
                  ),
                  Divider(thickness: 1.0, color: AppColors.black),
                  FutureBuilder<Curso?>(
                    future: CursosDAO.getCursoById(sigaaData!.cursoId),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasData) {
                        Curso? curso = snapshot.data;
                        String turnoString = CursosDAO.mapTurnoToString(curso?.turno ?? 0);
                        return Column(
                          children: [
                            ListTile(
                              title: Text('Curso'),
                              subtitle: Text('${curso?.nome ?? "N/A"}', style: TextStyle(fontSize: 16.0)),
                              ),

                            Divider(thickness: 1.0, color: AppColors.black),

                            ListTile(
                              title: Text('Turno'),
                              subtitle: Text('$turnoString', style: TextStyle(fontSize: 16.0)),
                              ),
                          ],
                        );
                      } else {
                        return Text('Curso not found');
                      }
                    },
                  ),
                  Divider(thickness: 1.0, color: AppColors.black),
                  ListTile(
                    title: Text('Periodo'),
                    subtitle: Text(sigaaData!.periodo.toString(), style: TextStyle(fontSize: 16.0)),
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(16.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.red, // Define a cor de fundo como vermelho
                  elevation: 0, // Remove a sombra
                ),
                onPressed: () async {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Queremos te conhecer melhor!',
                            style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.purple),
                            textAlign: TextAlign.center),
                        content: Text('A adição de alguns dados irá proporcionar uma melhor experiência dentro do aplicativo', style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                          color: AppColors.purple,
                        ),
                            textAlign: TextAlign.center),
                        actions: [
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => VamosComecarScreen()),
                              );
                            },
                            child: Text('Lembre-me mais tarde', style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                color: AppColors.darkOrange)),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => AddressScreen()),
                              );
                              print('Proceeding to the next page...');
                            },
                            child: Text('Continuar', style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkOrange)),
                          ),
                        ],
                      ),
                      ],
                      );
                    },
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 8, left: 35, right: 35),
                  child: Text(
                    'Confirmar',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold), // Define a cor do texto como branco
                  ),
                ),
              ),),
          ],
      ),),
    );
  }
}