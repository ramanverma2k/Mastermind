import 'package:flutter/material.dart';
import 'package:mastermind/widgets/board.dart';
import 'package:mastermind/widgets/refresh_button.dart';

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
          RefreshButton(),
          SizedBox(width: 20),
          Icon(
            Icons.help_rounded,
            color: Colors.black,
          ),
          SizedBox(width: 20),
        ],
        centerTitle: true,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        final double height = constraints.maxHeight;
        final double width = constraints.maxWidth;

        if (width < 390) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Board(
              height: height,
              width: width,
            ),
          );
        } else if (width < 428) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Board(
              height: height,
              width: width,
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Board(
              height: height,
              width: width,
            ),
          );
        }
      }),
    );
  }
}
