import "package:flutter/material.dart";
import 'package:hiword/widgets.dart';
import 'package:hiword/models.dart';
import 'package:hiword/core/wordreader.dart';
import 'package:hiword/screens/word.dart';

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
  late WordPack wordpack;

  @override
  Widget build(BuildContext context) {
    WordListScreenArgs args =
        ModalRoute.of(context)!.settings.arguments as WordListScreenArgs;
    this.wordpack = args.wordPack;

    return Scaffold(
      appBar: appBarWidget,
      body: Center(
        child: FutureBuilder(
          future: loadWordPacksWordlists(args.wordPack),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return CircularProgressIndicator();
            }

            WordPack wp = snapshot.data as WordPack;

            return Column(
              children: [
                Row(
                  children: [
                    Center(child: Center(child: Text(wp.name))),
                  ],
                ),
                Center(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: wp.wordlists.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          leading: Icon(Icons.view_list, size: 56.0),
                          title: Text(wp.wordlists[index].name),
                          subtitle: Text("${wp.wordlists[index].count} words"),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              WordScreen.route,
                              arguments:
                                  WordScreenArgs(wordlist: wp.wordlists[index]),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
