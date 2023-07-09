import 'package:flutter/material.dart';
import 'package:juno/src/screens/rides_and_companies/ui/perfect_displacements_screen.dart';
import 'package:juno/src/screens/rides_and_companies/ui/new_displacement_screen.dart';
import 'general_tabview.dart';
import 'perfect_displacement_tabview.dart';

import '../../../app/theme/colors.dart';
import '../../../widgets/app_bottom_navigation_bar.dart';

class NewRideFormScreen extends StatefulWidget {
  const NewRideFormScreen({super.key});

  State<NewRideFormScreen> createState() => _NewRideFormState();
}

class _NewRideFormState extends State<NewRideFormScreen> {
  List<bool> isSelected = [false, false];

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
            'CRIAR CARONA'.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.white,
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
          child:
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 360,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'TIPO DO VEÍCULO',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                  Container(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 228, 227, 227),
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    child: ToggleButtons(
                      isSelected: isSelected,
                      selectedColor: AppColors.white,
                      selectedBorderColor: AppColors.purple,
                      borderColor: Color.fromARGB(255, 213, 212, 212),
                      borderWidth: 3,
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      children: <Widget>[
                        Container(
                          width: 175,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 18,
                                backgroundColor: AppColors.yellow,
                                child: Icon(
                                  Icons.directions_car,
                                  color: AppColors.white,
                                ),
                              ),
                              Container(
                                width: 10,
                              ),
                              Text(
                                'Carro',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: AppColors.black),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 175,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 18,
                                backgroundColor: AppColors.red,
                                child: Icon(
                                  Icons.motorcycle,
                                  color: AppColors.white,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Moto',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      onPressed: (int index) {
                        setState(() {
                          for (int buttonIndex = 0;
                              buttonIndex < isSelected.length;
                              buttonIndex++) {
                            if (buttonIndex == index) {
                              isSelected[buttonIndex] = !isSelected[buttonIndex];
                            } else {
                              isSelected[buttonIndex] = false;
                            }
                          }
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 14,
                    width: 360,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'PLACA DO VEÍCULO',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 360,
                    child: TextField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.black,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 14,
                    width: 360,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'MODELO DO VEÍCULO',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 360,
                    child: TextField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.black,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 14,
                    width: 360,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'COR DO VEÍCULO',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 360,
                    child: TextField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.black,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 14,
                    width: 360,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'PONTO DE ENCONTRO',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 360,
                    child: TextField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.black,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 14,
                    width: 360,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'BAIRRO DE DESTINO',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 360,
                    child: TextField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.black,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 14,
                    width: 360,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'HORÁRIO DE SAÍDA',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 360,
                    child: TextField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.black,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 14,
                    width: 360,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'QUANTIDADE DE VAGAS DISPONÍVEIS',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 360,
                    child: TextField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.black,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const NewRideFormScreen()));},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.purple,
                        foregroundColor: AppColors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                      ),
                      child: const Text(
                        'Criar',
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

        )

      ),
    );
  }
}
