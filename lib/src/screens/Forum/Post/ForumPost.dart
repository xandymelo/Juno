import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ForumPost {
  int? id;
  final String author;
  final String date;
  final String content;

  ForumPost({
    this.id,
    required this.author,
    required this.date,
    required this.content,
  });

  ForumPost.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        author = map['author'],
        date = map['date'],
        content = map['content'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'author': author,
      'date': date,
      'content': content,
    };
  }

  static const String dbName = 'forum.db';
  static const String tableName = 'posts';

  static Future<void> insertPost(ForumPost post) async {
    final Database db = await _initDatabase();
    await db.insert(tableName, post.toMap());

    // Adicione a instrução de impressão
    print('Inserido no banco de dados: ${post.toMap()}');
  }

  static Future<List<ForumPost>> getPosts() async {
    final Database db = await _initDatabase();
    final List<Map<String, dynamic>> maps = await db.query(tableName);

    // Adicione a instrução de impressão
    print('Recuperado do banco de dados: $maps');

    return List.generate(maps.length, (index) {
      return ForumPost(
        id: maps[index]['id'],
        author: maps[index]['author'],
        date: maps[index]['date'],
        content: maps[index]['content'],
      );
    });
  }

  static Future<void> deletePost(ForumPost post) async {
    final db = await _initDatabase();
    await db.delete(tableName, where: 'id = ?', whereArgs: [post.id]);
  }

  static Future<Database> _initDatabase() async {
    final String path = join(await getDatabasesPath(), dbName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE $tableName(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            author TEXT,
            date TEXT,
            content TEXT
          )
        ''');
      },
    );
  }
}