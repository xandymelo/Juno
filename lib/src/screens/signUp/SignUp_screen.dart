import 'package:flutter/material.dart';
import 'package:easy_mask/easy_mask.dart';
import '../../app/theme/colors.dart';
import '../../database/dao/user_dao.dart';
import '../../database/dao/sigaa_dao.dart';
import 'Confirmation_screen.dart';
import 'package:flutter/services.dart';
import 'package:juno/src/screens/Onboarding/VamosComecarScreen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  late bool _hasaccount;
  late String _password;
  late String _matricula;
  late String _cpf = '';
  final _cpfController = TextEditingController();

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
              'Cadastre-se',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: AppColors.red,
              ),
            ),
            const Text(
              'Crie sua conta agora mesmo',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: AppColors.purple,
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(14),
                        TextInputMask(mask: '999.999.999-99')
                      ],
                      controller: _cpfController,
                      decoration: const InputDecoration(
                        labelText: 'CPF',
                        hintText: '000.000.000-00',
                      ),
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
            const SizedBox(height: 100),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
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
                        print('cpf: $_cpf');

                        await UserDAO.updateHasAccount(user.id, true);

                        await UserDAO.updatePassword(user.id, _password);

                        final user2 = await UserDAO.getUserByCPF(_cpf);
                        print(user2);

                        final sigaaData =
                            await SigaaDAO.getSigaaDataByUserId(user.sigaaId);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                NextPage(user: user, sigaaData: sigaaData),
                          ),
                        );
                      } else {
                        final user2 = await UserDAO.getUserByCPF(_cpf);
                        print(user2);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Usuário já possui uma conta registrada'),
                          ),
                        );
                      }
                    }
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
                  "Continuar",
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
