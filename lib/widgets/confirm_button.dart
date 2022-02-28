import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastermind/utils/board_state.dart';

// !!! this widget does not react to changes in the currentRow board state
// Todo: Try to make it react to changes in the currentRow board state
// ??? Try to pass the state from parent widget and use the isCorrect function from the board state here.
class ConfirmButton extends ConsumerWidget {
  const ConfirmButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 23.0),
      child: SizedBox(
        height: 40,
        width: MediaQuery.of(context).size.width * 0.3,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: const BorderSide(color: Colors.black, width: 2),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color?>(Colors.white),
          ),
          onPressed: () {
            if (ref.read(boardState).isCorrect()) {
              ref.read(isWon.state).state = true;
            } else {
              if (ref.read(currentRow.state).state < 5) {
                ref.read(currentRow.state).state++;
              } else {
                ref.read(isLost.state).state = true;
              }
            }
          },
          child: const Text(
            'Check',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
