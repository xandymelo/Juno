import 'package:flutter/material.dart';
import 'package:juno/src/screens/rides_and_companies/ui/new_ride_form_screen.dart';

import '../../../app/theme/colors.dart';
import '../../../models/veiculo.dart';

class DisplacementDetailsScreen extends StatefulWidget {
  final Veiculo? veiculo;
  final String municipioOrigem;
  final String municipioDestino;
  final String criadorCaronaUserName;
  final String criadorCaronaUserPhotoUrl;

  const DisplacementDetailsScreen(
      {super.key, required this.veiculo, required this.municipioOrigem, required this.municipioDestino, required this.criadorCaronaUserName, required this.criadorCaronaUserPhotoUrl});

  @override
  State<DisplacementDetailsScreen> createState() => _DisplacementDetailsScreenState();
}

class _DisplacementDetailsScreenState extends State<DisplacementDetailsScreen> {
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
            'DETALHAMENTO DA CARONA'.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.white,
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(24, 18, 24, 18),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      widget.municipioOrigem,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward_rounded,
                      size: 16,
                      color: AppColors.black,
                    ),
                    Container(padding: const EdgeInsets.all(5)),
                    Text(
                      widget.municipioDestino,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    CircleAvatar(
                      radius: 14,
                      backgroundColor: AppColors.yellow,
                      child: Icon(
                        size: 18,
                        Icons.directions_car,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage(
                          widget.criadorCaronaUserPhotoUrl,
                        )),
                    const SizedBox(width: 7),
                    Text(
                      widget.criadorCaronaUserName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                  child: Column(
                    children: [
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Placa do Veículo",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                widget.veiculo?.placa ?? "Não informado",
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 50),
                          Column(
                            children: [
                              const Text(
                                "Modelo e Cor do Veículo",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                widget.veiculo?.modelo ?? "Não informado",
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Horário de Saída",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "18:30",
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 50),
                          Column(
                            children: [
                              Text(
                                "Telefone de Contato",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "81 995428753",
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Divider(),
                const SizedBox(height: 20),
                Text(
                  "Passageiras",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "2/4 VAGAS OCUPADAS",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 28),
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            //backgroundImage:,
                          ),
                          const SizedBox(width: 7),
                          Text(
                            "Hadassa\nSilveira",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 40),
                          CircleAvatar(
                            radius: 24,
                            //backgroundImage:,
                          ),
                          const SizedBox(width: 7),
                          Text(
                            "Flávia\nCorreia",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            //backgroundImage:,
                          ),
                          const SizedBox(width: 7),
                          Text(
                            "Marina\nOliveira",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 40),
                          CircleAvatar(
                            radius: 24,
                            //backgroundImage:,
                          ),
                          const SizedBox(width: 7),
                          Text(
                            "Victoria\nNascimento",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 120),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const NewRideFormScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.purple,
                    foregroundColor: AppColors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  ),
                  child: const Text(
                    'Solicitar vaga',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
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
