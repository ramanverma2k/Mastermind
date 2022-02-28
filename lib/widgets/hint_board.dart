import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastermind/utils/board_state.dart';
import 'package:mastermind/widgets/confirm_button.dart';

class HintBoard extends ConsumerWidget {
  const HintBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guess = ref.watch(boardState.state).state.guess;

    final solution = ref.watch(boardState.state).state.solution;

    final row = ref.watch(currentRow);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        6,
        (rowNum) => row == rowNum
            ? const ConfirmButton()
            : Row(
                key: Key('row_$rowNum'),
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 8,
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: ListView.separated(
                      itemBuilder: (context, index) => DecoratedBox(
                        key: Key('cell_$rowNum$index'),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: guess[rowNum] != null
                              ? guess[rowNum]![index] == solution[index] &&
                                      solution.contains(guess[rowNum]![index])
                                  ? Colors.green
                                  : !solution.contains(guess[rowNum]![index])
                                      ? Colors.white
                                      : guess[rowNum]![index] != solution[index]
                                          ? Colors.grey
                                          : Colors.white
                              : Colors.white,
                          border: Border.all(
                            color: Colors.black,
                            width: 3,
                          ),
                        ),
                        child: const SizedBox(
                          height: 20,
                          width: 20,
                        ),
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 20),
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
