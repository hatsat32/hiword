import "package:flutter/material.dart";
import 'package:hiword/core/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "HiWord Home",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "wordpack_screen",
      routes: routes,
    );
  }
}
