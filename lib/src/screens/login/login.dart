import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:juno/src/app/theme/colors.dart';
import 'package:juno/src/screens/navigation/ui/navigation_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:juno/src/screens/Onboarding/VamosComecarScreen.dart';

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

  void saveUserData(int userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('userId', userId);
    // prefs.setString('username', username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VamosComecarScreen()),
                  );
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      size: 12,
                      color: AppColors.purple,
                    ),
                    Text(
                      'Voltar',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: AppColors.purple,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: AppColors.red,
              ),
            ),
            const Text(
              'Acesse sua conta',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.purple,
              ),
            ),
            const SizedBox(height: 44),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    inputFormatters: [TextInputMask(mask: '999.999.999-99')],
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'CPF',
                      hintText: '000.000.000-00',
                    ),
                  ),
                  const SizedBox(height: 20),
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
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Esqueceu a senha'),
                              content: const Text(
                                  'Ops! Parece que você esqueceu sua senha, por favor, contate o suporte!'),
                              actions: [
                                TextButton(
                                  child: const Text('Voltar'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Text(
                        'Esqueceu a senha?',
                        style: TextStyle(
                          color: AppColors.grey,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 100),
            Container(
              child: TextButton(
                onPressed: () async {
                  String enteredUsername = _usernameController.text;
                  String enteredPassword = _passwordController.text;
                  var userExists = await UserDAO.verifyCpfAndPasswordExists(
                      enteredUsername, enteredPassword);
                  if (userExists == true) {
                    int? userId = await UserDAO.getUserIdByCPF(enteredUsername);
                    if (userId != null) {
                      saveUserData(userId);
                    }
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NavigationScreen()),
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
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.darkOrange,
                  foregroundColor: AppColors.white,
                  padding: const EdgeInsets.fromLTRB(50, 9, 50, 9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                child: const Text(
                  "Entrar",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
