import 'package:flutter/material.dart';
import 'package:juno/src/database/dao/user_dao.dart';
import 'EditProfile.dart';

class ProfileForum extends StatefulWidget {
  const ProfileForum({Key? key}) : super(key: key);

  @override
  State<ProfileForum> createState() => _ProfileForumState();
}

class _ProfileForumState extends State<ProfileForum> {
  late Map<String, String> userProfile;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    final userDAO = UserDAO();
    final userId = 1; // Substitua pelo ID do usuário que você deseja carregar
    final user = await UserDAO.getUserById(userId);

    setState(() {
      userProfile = {
        'nome': user.nome,
        'email': user.email,
        'cep': '', // Adicione os outros campos aqui conforme necessário
        'rua': '',
        'numero': '',
        'bairro': '',
        'cidade': '',
        'complemento': '',
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    if (userProfile.isEmpty) {
      // Adicione aqui qualquer indicador de carregamento, se necessário
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil de Usuário'),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xFFFFEDED),
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 75,
              backgroundImage: AssetImage('assets/UserForum.png'),
            ),
            SizedBox(height: 16),
            Text(
              '${userProfile['nome'] ?? 'Nome não definido'}',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF3A0751),
              ),
            ),
            Wrap(
              spacing: 100,
              runSpacing: 8,
              children: [
                Text(
                  'Email: ${userProfile['email'] ?? 'E-mail não definido'}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF3A0751),
                  ),
                ),
                // Adicione os outros campos aqui conforme necessário
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                final novoPerfil = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfile(
                      nome: userProfile['nome'] ?? '',
                      email: userProfile['email'] ?? '',
                      cep: userProfile['cep'] ?? '',
                      rua: userProfile['rua'] ?? '',
                      numero: userProfile['numero'] ?? '',
                      bairro: userProfile['bairro'] ?? '',
                      cidade: userProfile['cidade'] ?? '',
                      complemento: userProfile['complemento'] ?? '',
                    ),
                  ),
                );

                if (novoPerfil != null) {
                  setState(() {
                    userProfile = novoPerfil;
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF3A0751),
              ),
              child: Text('Editar Perfil'),
            ),
          ],
        ),
      ),
    );
  }
}
