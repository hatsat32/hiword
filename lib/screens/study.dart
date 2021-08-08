import "package:flutter/material.dart";
import 'package:hiword/widgets.dart';
import 'package:hiword/models.dart';

class StudyScreenArgs {
  WordList wordlist;

  StudyScreenArgs({required this.wordlist});
}

class StudyScreen extends StatefulWidget {
  static final String route = "study_screen";

  @override
  _StudyScreenState createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen> {
  late WordList wordlist;

  @override
  Widget build(BuildContext context) {
    StudyScreenArgs args =
        ModalRoute.of(context)!.settings.arguments as StudyScreenArgs;
    this.wordlist = args.wordlist;

    return Scaffold(
      appBar: appBarWidget,
      body: PageView.builder(
        itemCount: this.wordlist.count,
        itemBuilder: (context, position) {
          return StudyWord(
            word: wordlist.words[position],
            index: position,
            total: this.wordlist.count,
          );
        },
      ),
    );
  }
}

class StudyWord extends StatelessWidget {
  const StudyWord({required this.word, required this.index, required this.total});

  final Word word;
  final int index;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              word.name,
              style: TextStyle(
                fontSize: 40,
                color: Colors.blueGrey.shade700,
              ),
            ),
            Text("${index+1}/$total")
          ],
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: word.meanings.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.view_list, size: 56.0),
                    title: Text(word.meanings[index].en as String),
                    subtitle: Text(word.meanings[index].tr as String),
                  ),
                  Text("Examples"),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: word.meanings[index].examples.length,
                    itemBuilder: (BuildContext context, int index2) {
                      return Card(
                        child: ListTile(
                          title: Text(word.meanings[index].examples[index2].en as String),
                          subtitle: Text(word.meanings[index].examples[index2].tr as String),
                        ),
                      );
                    },
                  )
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
