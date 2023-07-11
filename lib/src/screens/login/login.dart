import 'package:flutter/material.dart';
import 'package:juno/src/app/theme/colors.dart';

import '../../database/dao/user_dao.dart';

class Login extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Login({super.key});

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
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.red, // Cor predefinida do Flutter
                    ),
                  ),
                  Text(
                    'Acesse sua conta',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.purple, // Cor predefinida do Flutter
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'CPF',
                      hintText: '000.000.000-00',
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                      hintText: '*********',
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Esqueceu a senha?',
                        style: TextStyle(
                          color: Colors.grey, // Cor predefinida do Flutter
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors
                            .red, // Define a cor de fundo como vermelho
                        elevation: 0, // Remove a sombra
                      ),
                      onPressed: () async {
                        String enteredUsername = _usernameController.text;
                        String enteredPassword = _passwordController.text;
                        var userExists = UserDAO.verifyCpfAndPasswordExists(
                            enteredUsername, enteredPassword);
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
