import 'package:flutter/material.dart';
import 'package:juno/src/database/dao/endereco_dao.dart';
import 'package:juno/src/models/endereco.dart';
import 'package:juno/src/screens/Onboarding/VamosComecarScreen.dart';

import '../../app/theme/colors.dart';
import '../../database/dao/user_dao.dart';
import '../../database/dao/sigaa_dao.dart';
import 'Confirmation_screen.dart';


class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});
  @override
  _AddressScreenState createState() => _AddressScreenState();
}
class _AddressScreenState extends State<AddressScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _bairro;
  late String _municipio;
  late String _rua;
  late String _numero;
  late String _complemento;

  Future<void> _saveEndereco() async {
    // Criar uma instância do objeto Endereco com os dados preenchidos pelo usuário
    final endereco = Endereco(
      municipio: _municipio,
      bairro: _bairro,
      rua: _rua,
      numero: int.parse(_numero),
      complemento: _complemento,
    );

    // Salvar o endereço no banco de dados
    await EnderecoDAO.save(endereco);
    final enderecos = await EnderecoDAO.findAll();
    print(enderecos);
  }


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 150.0, bottom: 50.0),
              child: Column(
                children: [
                  Text(
                    'Endereço',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.red,
                    ),
                  ),
                  Text(
                    'Adicione seu endereço',
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
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Município'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, informe o município';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _municipio = value!;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Bairro'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, informe o bairro';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _bairro = value!;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Rua'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, informe a rua';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _rua = value!;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Número'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, informe o número';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _numero = value!;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Complemento'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, informe o complemento';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _complemento = value!;
                      },
                    ),
                    SizedBox(height: 16.0),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.red, // Define a cor de fundo como vermelho
                        elevation: 0, // Remove a sombra
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          await _saveEndereco();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VamosComecarScreen(),
                              ),
                            );
                          }
                        },
                      child: const Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 8, left: 35, right: 35),
                        child: Text(
                          'Finalizar cadastro',
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold), // Define a cor do texto como branco
                        ),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
