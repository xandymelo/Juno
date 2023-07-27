import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:juno/src/database/dao/endereco_dao.dart';
import 'package:juno/src/models/endereco.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../database/dao/veiculo_dao.dart';
import '../../../models/veiculo.dart';

import '../../../app/theme/colors.dart';

class NewRideFormScreen extends StatefulWidget {
  const NewRideFormScreen({super.key});

  State<NewRideFormScreen> createState() => _NewRideFormState();
}

class _NewRideFormState extends State<NewRideFormScreen> {
  List<bool> isSelected = [true, false];
  // Controladores para os campos de texto
  final TextEditingController _licensePlateController = TextEditingController();
  final TextEditingController _vehicleModelController = TextEditingController();
  final TextEditingController _vehicleColorController = TextEditingController();
  final TextEditingController _vehicleBrandController = TextEditingController();
  final TextEditingController _destinationCountyController = TextEditingController();
  final TextEditingController _destinationNeighborhoodController = TextEditingController();
  final TextEditingController _destinationRoadController = TextEditingController();
  final TextEditingController _destinationNumberController = TextEditingController();
  final TextEditingController _destinationComplementController = TextEditingController();
  final TextEditingController _meetingPointCountyController = TextEditingController();
  final TextEditingController _meetingPointNeighborhoodController = TextEditingController();
  final TextEditingController _meetingPointRoadController = TextEditingController();
  final TextEditingController _meetingPointNumberController = TextEditingController();
  final TextEditingController _meetingPointComplementController = TextEditingController();
  final TextEditingController _departureTimeController = TextEditingController();
  final TextEditingController _availableSeatsController = TextEditingController();
  late List<Map<String, dynamic>> inputFields;
  int userId = 0;
  @override
  void initState() {
    super.initState();
    inputFields = [
      {'label': 'PLACA DO VEÍCULO', 'controller': _licensePlateController, 'inputType': TextInputType.text},
      {
        'label': 'MODELO DO VEÍCULO',
        'controller': _vehicleModelController,
        'inputType': TextInputType.text,
      },
      {
        'label': 'COR DO VEÍCULO',
        'controller': _vehicleColorController,
        'inputType': TextInputType.text,
      },
      {
        'label': 'MARCA DO VEÍCULO',
        'controller': _vehicleBrandController,
        'inputType': TextInputType.text,
      },
      {
        'label': 'QUANTIDADE DE VAGAS DISPONÍVEIS',
        'controller': _availableSeatsController,
        'inputType': TextInputType.number,
      },
      {
        'label': 'MUNICIPIO DE DESTINO',
        'controller': _destinationCountyController,
        'inputType': TextInputType.text,
      },
      {
        'label': 'BAIRRO DE DESTINO',
        'controller': _destinationNeighborhoodController,
        'inputType': TextInputType.text,
      },
      {
        'label': 'RUA DE DESTINO',
        'controller': _destinationRoadController,
        'inputType': TextInputType.text,
      },
      {
        'label': 'NUMERO DE DESTINO',
        'controller': _destinationNumberController,
        'inputType': TextInputType.number,
      },
      {
        'label': 'COMPLEMENTO DE DESTINO',
        'controller': _destinationComplementController,
        'inputType': TextInputType.text,
      },
      {
        'label': 'MUNICIPIO DE PARTIDA',
        'controller': _meetingPointCountyController,
        'inputType': TextInputType.text,
      },
      {
        'label': 'BAIRRO DE PARTIDA',
        'controller': _meetingPointNeighborhoodController,
        'inputType': TextInputType.text,
      },
      {
        'label': 'RUA DE PARTIDA',
        'controller': _meetingPointRoadController,
        'inputType': TextInputType.text,
      },
      {
        'label': 'NUMERO DE PARTIDA',
        'controller': _meetingPointNumberController,
        'inputType': TextInputType.number, // Número
      },
      {
        'label': 'COMPLEMENTO DE PARTIDA',
        'controller': _meetingPointComplementController,
        'inputType': TextInputType.text,
      },
      {'label': 'HORÁRIO DE SAÍDA', 'controller': _departureTimeController, 'inputType': TextInputType.datetime},
    ];

    loadUserData();
  }

  void loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? savedUserId = prefs.getInt('userId');
    if (savedUserId != null) {
      setState(() {
        userId = savedUserId;
        // print(userId);
      });
    }
  }

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
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 360,
                    alignment: Alignment.centerLeft,
                    child: const Text(
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
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 228, 227, 227),
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    child: ToggleButtons(
                      isSelected: isSelected,
                      selectedColor: AppColors.white,
                      selectedBorderColor: AppColors.purple,
                      borderColor: const Color.fromARGB(255, 213, 212, 212),
                      borderWidth: 3,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                      children: <Widget>[
                        SizedBox(
                          width: 175,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CircleAvatar(
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
                              const Text(
                                'Carro',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppColors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
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
                              SizedBox(width: 10),
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
                          for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
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
                  for (var field in inputFields)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),
                        Container(
                          height: 14,
                          width: 360,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            field['label'],
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.grey,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: 360,
                          child: TextField(
                              keyboardType: field['inputType'],
                              controller: field['controller'],
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8), // Bordas retangulares e arredondadas
                                ),
                              )),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () async {
                        for (var label in inputFields) {
                          if (label['controller'].text.isEmpty) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Erro'),
                                  content: const Text('Todos os campos são obrigatórios.'),
                                  actions: [
                                    TextButton(
                                      child: const Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                            return;
                          }
                        }
                        String licensePlate = _licensePlateController.text;
                        String vehicleModel = _vehicleModelController.text;
                        String vehicleColor = _vehicleColorController.text;
                        String vehicleBrand = _vehicleBrandController.text;
                        String destination = _destinationNeighborhoodController.text;
                        String departureTime = _departureTimeController.text;
                        String availableSeats = _availableSeatsController.text;
                        int vehicleType = isSelected[0] ? 0 : 1;
                        Veiculo veiculo =
                            Veiculo(cor: vehicleColor, modelo: vehicleModel, placa: licensePlate, marca: vehicleBrand, qtdPassageiros: int.parse(availableSeats), tipo: vehicleType, usuarioId: userId);
                        await VeiculoDAO.save(veiculo);
                        int? veiculoId = await VeiculoDAO.getVeiculoId(veiculo.placa);
                        EnderecoDAO.findAll().then((value) => print(value));
                        Endereco enderecoOrigem = Endereco(
                            municipio: _meetingPointCountyController.text,
                            bairro: _meetingPointNeighborhoodController.text,
                            rua: _meetingPointRoadController.text,
                            numero: int.tryParse(_meetingPointNumberController.text) ?? 0,
                            complemento: _meetingPointComplementController.text);
                        await EnderecoDAO.save(enderecoOrigem);
                        Endereco enderecoPartida = Endereco(
                            municipio: _destinationCountyController.text,
                            bairro: _destinationNeighborhoodController.text,
                            rua: _destinationRoadController.text,
                            numero: int.tryParse(_destinationNumberController.text) ?? 0,
                            complemento: _destinationComplementController.text);
                        await EnderecoDAO.save(enderecoPartida);
                        EnderecoDAO.findAll().then((value) => print(value));

                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             const NewRideFormScreen()));
                      },
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
          )),
    );
  }
}
