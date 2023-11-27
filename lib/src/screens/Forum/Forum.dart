import 'package:flutter/material.dart';
import 'CreatePost.dart';
import 'ProfileScreens/ProfileForum.dart';
import 'PostCardForum.dart';
import 'Post/ForumPost.dart';


class ForumScreen extends StatefulWidget {
  const ForumScreen({Key? key}) : super(key: key);

  @override
  _ForumScreenState createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  String searchKeyword = '';
  List<ForumPost> forumPosts = []; // Corrija o tipo da lista para ForumPost

  void removePost(ForumPost post) async {
    await ForumPost.deletePost(post);
    _loadPosts();
  }

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  void _loadPosts() async {
    List<ForumPost> posts = await ForumPost.getPosts(); // Corrija o tipo da lista para ForumPost
    setState(() {
      forumPosts = posts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fórum - Juno'),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xFFFFFFFF),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Pesquisar',
                        prefixIcon: Icon(Icons.search),
                      ),
                      onChanged: (value) {
                        setState(() {
                          searchKeyword = value;
                        });
                      },
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileForum(),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/UserForum.png'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: forumPosts.length,
                itemBuilder: (context, index) {
                  return PostCardForum(
                    post: forumPosts[index],
                    onDelete: () {
                      removePost(forumPosts[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navegue para a tela CreatePost e aguarde o resultado
          final novaPostagem = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreatePost(userId: 1,),
            ),
          );

          // Se houver uma nova postagem, adicione-a ao banco de dados e recarregue as postagens
          if (novaPostagem != null) {
            await ForumPost.insertPost(novaPostagem); // Corrija para ForumPost
            _loadPosts();
          }
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF3A0751),
      ),
    );
  }
}