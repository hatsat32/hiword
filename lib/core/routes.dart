import 'package:flutter/material.dart';
import 'package:hiword/models.dart';
import 'package:hiword/screens/wordpack.dart';
import 'package:hiword/screens/wordlist.dart';

var routes = {
  WordPackScreen.route: (context) => WordPackScreen(),
  WordListScreen.route: (context) => WordListScreen(ModalRoute.of(context)!.settings.arguments as WordPack),
};
