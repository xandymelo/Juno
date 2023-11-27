import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  final String nome;
  final String email;
  final String cep;
  final String rua;
  final String numero;
  final String bairro;
  final String cidade;
  final String complemento;

  EditProfile({
    Key? key,
    required this.nome,
    required this.email,
    required this.cep,
    required this.rua,
    required this.numero,
    required this.bairro,
    required this.cidade,
    required this.complemento,
  }) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final cepController = TextEditingController();
  final ruaController = TextEditingController();
  final numeroController = TextEditingController();
  final bairroController = TextEditingController();
  final cidadeController = TextEditingController();
  final complementoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nomeController.text = widget.nome;
    emailController.text = widget.email;
    cepController.text = widget.cep;
    ruaController.text = widget.rua;
    numeroController.text = widget.numero;
    bairroController.text = widget.bairro;
    cidadeController.text = widget.cidade;
    complementoController.text = widget.complemento;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Perfil'),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFFFFFFF),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/UserForum.png'),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: nomeController,
                decoration: InputDecoration(
                  labelText: 'Nome do Usuário',
                  labelStyle: TextStyle(
                    color: Color(0xFF3A0751),
                  ),
                ),
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: TextStyle(
                    color: Color(0xFF3A0751),
                  ),
                ),
              ),
              TextFormField(
                controller: cepController,
                decoration: InputDecoration(
                  labelText: 'CEP',
                  labelStyle: TextStyle(
                    color: Color(0xFF3A0751),
                  ),
                ),
              ),
              TextFormField(
                controller: ruaController,
                decoration: InputDecoration(
                  labelText: 'Rua',
                  labelStyle: TextStyle(
                    color: Color(0xFF3A0751),
                  ),
                ),
              ),
              TextFormField(
                controller: numeroController,
                decoration: InputDecoration(
                  labelText: 'Número',
                  labelStyle: TextStyle(
                    color: Color(0xFF3A0751),
                  ),
                ),
              ),
              TextFormField(
                controller: bairroController,
                decoration: InputDecoration(
                  labelText: 'Bairro',
                  labelStyle: TextStyle(
                    color: Color(0xFF3A0751),
                  ),
                ),
              ),
              TextFormField(
                controller: cidadeController,
                decoration: InputDecoration(
                  labelText: 'Cidade',
                  labelStyle: TextStyle(
                    color: Color(0xFF3A0751),
                  ),
                ),
              ),
              TextFormField(
                controller: complementoController,
                decoration: InputDecoration(
                  labelText: 'Complemento',
                  labelStyle: TextStyle(
                    color: Color(0xFF3A0751),
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  final novoNome = nomeController.text;
                  final novoEmail = emailController.text;
                  final novoCep = cepController.text;
                  final novaRua = ruaController.text;
                  final novoNumero = numeroController.text;
                  final novoBairro = bairroController.text;
                  final novaCidade = cidadeController.text;
                  final novoComplemento = complementoController.text;

                  final novoPerfil = {
                    'nome': novoNome,
                    'email': novoEmail,
                    'cep': novoCep,
                    'rua': novaRua,
                    'numero': novoNumero,
                    'bairro': novoBairro,
                    'cidade': novaCidade,
                    'complemento': novoComplemento,
                  };

                  // Retorne as informações atualizadas para a tela anterior
                  Navigator.pop(context, novoPerfil);
                },
                child: Text('Salvar Alterações'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF3A0751),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
