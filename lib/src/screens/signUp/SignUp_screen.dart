import 'package:flutter/material.dart';

import '../../app/theme/colors.dart';
import '../../database/dao/user_dao.dart';
import '../../database/dao/sigaa_dao.dart';
import 'Confirmation_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _email;
  late String _matricula;
  late bool _hasaccount;
  late String _password;
  late String _cpf = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
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
                    'Crie sua conta agora mesmo',
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
                    // TextFormField(
                    //   decoration: InputDecoration(labelText: 'Nome'),
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'Por favor, digite o nome';
                    //     }
                    //     return null;
                    //   },
                    //   onSaved: (value) {
                    //     _name = value!;
                    //   },
                    // ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'CPF'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, digite somente números';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _cpf = value!;
                      },
                    ),
                    // TextFormField(
                    //   decoration: InputDecoration(labelText: 'Email'),
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'Por favor, digite o email';
                    //     }
                    //     return null;
                    //   },
                    //   onSaved: (value) {
                    //     _email = value!;
                    //   },
                    //),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Matrícula'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, digite a matrícula';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _matricula = value!;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Senha'),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, digite a senha';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _password = value!;
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
                        backgroundColor: AppColors.red,
                        // Define a cor de fundo como vermelho
                        elevation: 0, // Remove a sombra
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          final user = await UserDAO.getUserByCPF(_cpf);

                          if (user == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'CPF não encontrado no banco de dados do Sigaa'),
                              ),
                            );
                          } else {
                            if (!user.hasAccount) {
                              _hasaccount = user.hasAccount;
                              print('Tem conta: $_hasaccount');

                              await UserDAO.updateHasAccount(user.id, true);

                              await UserDAO.updatePassword(user.id, _password);

                              final user2 = await UserDAO.getUserByCPF(_cpf);
                              print(user2);

                              final sigaaData =
                                  await SigaaDAO.getSigaaDataByUserId(
                                      user.sigaaId);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NextPage(
                                      user: user, sigaaData: sigaaData),
                                ),
                              );
                            } else {
                              final user2 = await UserDAO.getUserByCPF(_cpf);
                              print(user2);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Usuário já possui uma conta registrada'),
                                ),

                              );
                            }
                          }
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(
                            top: 8, bottom: 8, left: 35, right: 35),
                        child: Text(
                          'Entrar',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight
                                  .bold), // Define a cor do texto como branco
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
