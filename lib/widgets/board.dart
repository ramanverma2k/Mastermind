import 'package:flutter/material.dart';
import 'package:mastermind/widgets/gameover_popup.dart';
import 'package:mastermind/widgets/guessing_board.dart';
import 'package:mastermind/widgets/help_popup.dart';
import 'package:mastermind/widgets/hint_board.dart';
import 'package:mastermind/widgets/popup_window.dart';
import 'package:mastermind/widgets/win_popup.dart';

class Board extends StatelessWidget {
  const Board({Key? key, required this.height, required this.width})
      : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Guessing Board.
            GuessingBoard(
              height: height,
              width: width,
            ),

            // Gap between both boards
            SizedBox(
              width: width < 768 ? 10 : 20,
            ),

            // Hint board.
            HintBoard(
              height: height,
              width: width,
            ),
          ],
        ),
        const PopUpWindow(),
        const GameOverPopUp(),
        const WinPopUp(),
        const HelpPopup(),
      ],
    );
  }
}
