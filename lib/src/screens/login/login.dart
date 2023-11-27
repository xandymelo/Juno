import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:juno/src/app/theme/colors.dart';
import 'package:juno/src/screens/navigation/ui/navigation_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../database/dao/user_dao.dart';

class Login extends StatefulWidget {
  const Login({Key? key});

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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(bottom: 50.0),
                  child: Column(
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.red,
                        ),
                      ),
                      Text(
                        'Acesse sua conta',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.purple,
                        ),
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  inputFormatters: [TextInputMask(mask: '999.999.999-99')],
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'CPF',
                    hintText: '000.000.000-00',
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    hintText: '*********',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
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
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () async {
                    String enteredUsername = _usernameController.text;
                    String enteredPassword = _passwordController.text;
                    var userExists = await UserDAO.verifyCpfAndPasswordExists(enteredUsername, enteredPassword);
                    if (userExists == true) {
                      int? userId = await UserDAO.getUserIdByCPF(enteredUsername);
                      if (userId != null) {
                        saveUserData(userId);
                      }
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const NavigationScreen()),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Erro'),
                            content: const Text('Nome de usuário ou senha incorretos.'),
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
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 35),
                    child: Text(
                      'Entrar',
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.red,
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
