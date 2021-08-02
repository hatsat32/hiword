import "package:flutter/material.dart";
import 'package:hiword/screens/wordlist.dart';
import 'package:hiword/widgets.dart';
import 'package:hiword/models.dart';

class WordPackScreen extends StatelessWidget {

  static final String route = "wordpack_screen";

  final List<WordPack> wordpacks = [
    WordPack("Reader At Work 1", "slug", [])
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget,
      body: Center(
        child: ListView.builder(
          itemCount: this.wordpacks.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                leading: Icon(Icons.list, size: 56.0),
                title: Text(this.wordpacks[0].name),
                subtitle: Text("${this.wordpacks[index].wordlists.length} Wordlists"),
                onTap: () {
                  Navigator.pushNamed(context, WordListScreen.route, arguments: this.wordpacks[index]);
                },
              ),
            );
          }
        ),
      ),
    );
  }
}
