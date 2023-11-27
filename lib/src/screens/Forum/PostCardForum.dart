import 'package:flutter/material.dart';

import 'Post/ForumPost.dart';


class PostCardForum extends StatefulWidget {
  final ForumPost post;
  final Function() onDelete;

  PostCardForum({required this.post, required this.onDelete});

  @override
  _PostCardForumState createState() => _PostCardForumState();
}

class _PostCardForumState extends State<PostCardForum> {
  bool liked = false;
  bool disliked = false;

  void showRemovePostDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Remover Post da Timeline'),
          content: Text('Tem certeza que deseja remover esta postagem?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                widget.onDelete(); // Chama a função onDelete passada como parâmetro
                Navigator.of(context).pop(); // Fecha o diálogo
              },
              child: Text('Remover'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFFFEDED),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/UserForum.png'),
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.post.author,
                    style: TextStyle(
                      color: Color(0xFF3A0751),
                    ),
                  ),
                  Text(
                    widget.post.date,
                    style: TextStyle(
                      color: Color(0xFF3A0751),
                    ),
                  ),
                ],
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: showRemovePostDialog,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.post.content,
                  style: TextStyle(
                    color: Color(0xFF3A0751),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: liked ? Icon(Icons.thumb_up) : Icon(Icons.thumb_up_alt_outlined),
                onPressed: () {
                  setState(() {
                    liked = !liked;
                    if (liked) {
                      disliked = false; // Desativa a opção de descurtir
                    }
                  });
                },
                color: liked ? Colors.blue : Colors.red,
                alignment: Alignment.centerLeft,
              ),
              Text(liked ? 'Descurtir' : 'Curtir'),
              SizedBox(width: 16),
              IconButton(
                icon: disliked ? Icon(Icons.thumb_down) : Icon(Icons.thumb_down_alt_outlined),
                onPressed: () {
                  setState(() {
                    disliked = !disliked;
                    if (disliked) {
                      liked = false; // Desativa a opção de curtir
                    }
                  });
                },
                color: disliked ? Colors.blue : Colors.red,
                alignment: Alignment.centerLeft,
              ),
              Text(disliked ? '' : ''),
            ],
          ),
        ],
      ),
    );
  }
}
