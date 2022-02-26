import 'package:flutter/material.dart';
import 'package:mastermind/screens/homepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Mastermind',
      home: HomePage(title: 'Mastermind'),
    );
  }
}
