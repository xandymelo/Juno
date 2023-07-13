import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:juno/src/app/theme/colors.dart';
import 'package:juno/src/screens/rides_and_companies/ui/rides_and_companies_screen.dart';

import '../../database/dao/user_dao.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  late bool _obscurePassword = true;

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
                    obscureText:
                        _obscurePassword, // Define se a senha está oculta ou não
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      hintText: '*********',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
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
                        var userExists =
                            await UserDAO.verifyCpfAndPasswordExists(
                                enteredUsername, enteredPassword);
                        if (userExists == true) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const RidesAndCompaniesScreen()),
                          );
                        } else {
                          // Mostrar mensagem de erro informando que o nome de usuário ou senha estão incorretos
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Erro'),
                                content: const Text(
                                    'Nome de usuário ou senha incorretos.'),
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
