import 'package:flutter/material.dart';
import 'package:mastermind/widgets/board.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Icon(
            Icons.refresh_rounded,
            color: Colors.black,
          ),
          SizedBox(width: 20),
          Icon(
            Icons.help_rounded,
            color: Colors.black,
          ),
          SizedBox(width: 20),
        ],
        centerTitle: true,
      ),
      body: const Board(),
    );
  }
}
