import "package:flutter/material.dart";
import 'package:hiword/widgets.dart';
import 'package:hiword/models.dart';

class StudyScreenArgs {
  WordList wordlist;
  int index;

  StudyScreenArgs({required this.wordlist, required this.index});
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
        controller: PageController(initialPage: args.index),
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
  const StudyWord({
    required this.word,
    required this.index,
    required this.total,
  });

  final Word word;
  final int index;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            leading: ElevatedButton(
              child: Text("${index + 1}/$total"),
              onPressed: null,
            ),
            title: Text(
              word.name,
              style: TextStyle(
                fontSize: 30,
                color: Colors.blueGrey.shade700,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: word.meanings.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Column(
                  children: [
                    /**
                     * word name
                     */
                    ListTile(
                      leading: Icon(Icons.bookmark, size: 36.0),
                      title: Text(word.meanings[index].en as String),
                      subtitle: Text(word.meanings[index].tr as String),
                    ),

                    /**
                     * show divider if examples exist
                     */
                    Visibility(
                      child: Divider(
                          color: Colors.blueGrey.shade500, thickness: 1),
                      visible: word.meanings[index].examples.length != 0,
                    ),

                    /**
                     * examples
                     */
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: word.meanings[index].examples.length,
                      separatorBuilder: (_, __) => const Divider(
                        height: 0,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                      ),
                      itemBuilder: (BuildContext context, int index2) {
                        return ListTile(
                          dense: true,
                          title: Text(
                            word.meanings[index].examples[index2].en as String,
                          ),
                          subtitle: Text(
                            word.meanings[index].examples[index2].tr as String,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
