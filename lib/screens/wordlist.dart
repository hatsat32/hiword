import "package:flutter/material.dart";
import 'package:hiword/widgets.dart';
import 'package:hiword/models.dart';

class WordListScreen extends StatelessWidget {

  static final String route = "wordlist_screen";

  WordListScreen(this.wordpack);

  final WordPack wordpack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget,
      body: Center(
        child: Center(
          child: ListView.builder(
            itemCount: this.wordpack.wordlists.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  leading: Icon(Icons.list, size: 56.0),
                  title: Text(this.wordpack.name),
                  subtitle: Text("${this.wordpack.wordlists.length} Wordlists"),
                  onTap: () {
                    // Navigator.pushNamed(context, 'wordlist_screen');
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
