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
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    final darkTheme = ref.watch(isDarkTheme);

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: width < 390 && height < 812
              ? 17.0
              : height > 768
                  ? 25
                  : 15.0),
      child: SizedBox(
        height: 40,
        width: width < 390
            ? width * 0.41
            : width > 768
                ? width > 1080
                    ? width * 0.1
                    : width * 0.18
                : width * 0.4,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(
                  color: darkTheme ? Colors.transparent : Colors.black,
                  width: 2,
                ),
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
                ref.refresh(boardState.state).state.guess;
                ref.refresh(boardState.state).state.selectedCells;
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
