import 'package:flutter/material.dart';
import 'package:mastermind/widgets/guessing_board.dart';
import 'package:mastermind/widgets/hint_board.dart';

class Board extends StatefulWidget {
  const Board({Key? key}) : super(key: key);

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  // This is to keep track of the guessed rows.
  final rowsGuessed = <int>[];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Guessing Board.
          const GuessingBoard(),

          // Gap between the guessing board and the hint board.
          const SizedBox(width: 20),

          // Hint board.
          HintBoard(rowsDone: rowsGuessed),
        ],
      ),
    );
  }
}
