import 'dart:io';
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import '../../models/user.dart';
import 'Post/ForumPost.dart';
import 'package:juno/src/database/dao/user_dao.dart';
import 'package:intl/intl.dart';

class CreatePost extends StatefulWidget {
  final int userId;

  const CreatePost({Key? key, required this.userId}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  String authorName = ""; // Nome do autor

  @override
  void initState() {
    super.initState();
    // Buscar o nome do usuário no banco de dados ao iniciar a tela
    getUserInfo();
  }

  // Função para buscar o nome do usuário no banco de dados
  void getUserInfo() async {
    try {
      User user = await UserDAO.getUserById(widget.userId);
      setState(() {
        authorName = "${user.nome}"; // Altere conforme a estrutura do seu objeto User
      });
    } catch (e) {
      print("Erro ao buscar informações do usuário: $e");
    }
  }

  // Função para criar uma nova postagem
  void criarPostagem() {
    if (titleController.text.isNotEmpty && contentController.text.isNotEmpty) {
      // obter data e hora atual
      DateTime agora = DateTime.now();
      String dataHoraAtual = DateFormat('dd/MM/yyyy - HH:mm').format(agora);

      ForumPost novaPostagem = ForumPost(
        author: authorName, // Usar o nome do autor obtido do banco de dados
        date: dataHoraAtual,
        content: contentController.text,
      );

      // Adicione a nova postagem à lista de postagens (que deve ser acessível a partir da tela do fórum)
      // forumPosts.add(novaPostagem);

      // Navegue de volta para a tela do fórum
      Navigator.pop(context, novaPostagem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Postagem'),
        backgroundColor: Color(0xFF3A0751),
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
              Text(
                "Autor: $authorName", // Exibir o nome do autor
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3A0751),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Título',
                  labelStyle: TextStyle(
                    color: Color(0xFF3A0751),
                  ),
                ),
              ),
              TextFormField(
                controller: contentController,
                decoration: InputDecoration(
                  labelText: 'Conteúdo',
                  labelStyle: TextStyle(
                    color: Color(0xFF3A0751),
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: criarPostagem,
                child: Text('Criar Postagem'),
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
