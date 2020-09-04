import 'package:flutter/material.dart';
import 'package:fluttertwoday/myhomepage.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MyHomePage());
  }
}
