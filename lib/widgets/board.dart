import 'package:flutter/material.dart';
import 'package:mastermind/widgets/gameover_popup.dart';
import 'package:mastermind/widgets/popup_window.dart';
import 'package:mastermind/widgets/guessing_board.dart';
import 'package:mastermind/widgets/hint_board.dart';
import 'package:mastermind/widgets/win_popup.dart';

class Board extends StatelessWidget {
  const Board({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              // Guessing Board.
              GuessingBoard(),

              // Gap between the guessing board and the hint board.
              SizedBox(width: 20),

              // Hint board.
              HintBoard(),
            ],
          ),
        ),
        const PopUpWindow(),
        const GameOverPopUp(),
        const WinPopUp(),
      ],
    );
  }
}
