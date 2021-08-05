import "package:flutter/material.dart";
import 'package:hiword/screens/wordlist.dart';
import 'package:hiword/widgets.dart';
import 'package:hiword/models.dart';
import 'package:hiword/core/wordreader.dart';

class WordPackScreen extends StatefulWidget {
  static final String route = "wordpack_screen";

  @override
  _WordPackScreenState createState() => _WordPackScreenState();
}

class _WordPackScreenState extends State<WordPackScreen> {
  List<WordPack> wordpacks = [];

  Future getData() async {
    this.wordpacks = await loadWordPacks();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

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
                  title: Text(this.wordpacks[index].name),
                  subtitle: Text(
                    "${this.wordpacks[index].wordlists.length} Wordlists",
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      WordListScreen.route,
                      arguments: WordListScreenArgs(wordPack: this.wordpacks[index]),
                    );
                    // Navigator.pushNamed(context, WordListScreen.route, arguments: {'wordpack': this.wordpacks[index]});
                  },
                ),
              );
            }),
      ),
    );
  }
}
