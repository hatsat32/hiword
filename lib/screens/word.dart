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
      body: Scrollbar(
        hoverThickness: 24,
        isAlwaysShown: true,
        child: ListView.separated(
          itemCount: wordlist.words.length,
          separatorBuilder: (_, __) => Divider(
            height: 0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: ElevatedButton(child: Text(index.toString()), onPressed: null),
              title: Text(wordlist.words[index].name, style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  StudyScreen.route,
                  arguments: StudyScreenArgs(wordlist: wordlist, index: index),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
