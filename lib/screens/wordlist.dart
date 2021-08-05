import "package:flutter/material.dart";
import 'package:hiword/widgets.dart';
import 'package:hiword/models.dart';

class WordListScreenArgs {
  WordPack wordPack;

  WordListScreenArgs({required this.wordPack});
}

class WordListScreen extends StatefulWidget {

  static final String route = "wordlist_screen";

  @override
  _WordListScreenState createState() => _WordListScreenState();
}

class _WordListScreenState extends State<WordListScreen> {

  WordPack? wordpack;

  @override
  Widget build(BuildContext context) {
    WordListScreenArgs args = ModalRoute.of(context)!.settings.arguments as WordListScreenArgs;
    this.wordpack = args.wordPack;

    return Scaffold(
      appBar: appBarWidget,
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Center(child: Text(this.wordpack!.name)),
              ],
            ),
            Center(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: this.wordpack!.wordlists.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.list, size: 56.0),
                      title: Text(this.wordpack!.name),
                      subtitle: Text("${this.wordpack!.wordlists.length} Wordlists"),
                      onTap: () {
                        // Navigator.pushNamed(context, 'wordlist_screen');
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
