import 'package:flutter/material.dart';
import 'package:juno/src/database/dao/endereco_dao.dart';
import 'package:juno/src/models/endereco.dart';
import 'package:juno/src/models/user.dart';
import 'package:juno/src/screens/Onboarding/VamosComecarScreen.dart';

import '../../app/theme/colors.dart';
import '../../database/dao/user_dao.dart';


class AddressScreen extends StatefulWidget {
  final User user;

  const AddressScreen({required this.user, Key? key}) : super(key: key);
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

  Future<void> _saveEndereco(User user) async {
    // Criar uma instância do objeto Endereco com os dados preenchidos pelo usuário
    final endereco = Endereco(
      municipio: _municipio,
      bairro: _bairro,
      rua: _rua,
      numero: int.parse(_numero),
      complemento: _complemento,
    );

    final enderecoId = await EnderecoDAO.save(endereco);
    user.enderecoId = enderecoId;
    await UserDAO.update(user);
    // Salvar o endereço no banco de dados
    final enderecos = await EnderecoDAO.findAll();
    print(enderecos);
    final usuarios = await UserDAO.findAll();
    print(usuarios);
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
                          await _saveEndereco(widget.user);
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Cadastro concluído',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.purple),
                                    textAlign: TextAlign.center),
                                content: Text('Seu cadastro foi realizado com sucesso. Aperte continuar para realizar o login e acessar as funcionalidades do app', style: TextStyle(
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
                                          Navigator.pop(context);
                                        },
                                        child: Text('Voltar', style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.normal,
                                            color: AppColors.darkOrange)),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => VamosComecarScreen(),
                                                  ),
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
