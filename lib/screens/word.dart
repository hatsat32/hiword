import "package:flutter/material.dart";
import 'package:hiword/widgets.dart';
import 'package:hiword/models.dart';
import 'package:hiword/screens/study.dart';

class WordScreenArgs {
  WordList wordlist;

  WordScreenArgs({required this.wordlist});
}

class WordScreen extends StatefulWidget {
  static final String route = "word_screen";

  @override
  _WordScreenState createState() => _WordScreenState();
}

class _WordScreenState extends State<WordScreen> {
  late WordList wordlist;

  @override
  Widget build(BuildContext context) {
    WordScreenArgs args =
        ModalRoute.of(context)!.settings.arguments as WordScreenArgs;
    this.wordlist = args.wordlist;

    return Scaffold(
      appBar: appBarWidget,
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: wordlist.words.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.tag),
              title: Text(wordlist.words[index].name),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  StudyScreen.route,
                  arguments: StudyScreenArgs(wordlist: wordlist),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
