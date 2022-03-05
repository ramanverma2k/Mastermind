import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastermind/utils/board_state.dart';
import 'package:mastermind/widgets/confirm_button.dart';

class HintBoard extends ConsumerWidget {
  const HintBoard({Key? key, required this.height, required this.width})
      : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guess = ref.watch(boardState.state).state.guess;

    final solution = ref.watch(boardState.state).state.solution;

    final row = ref.watch(currentRow);

    final darkTheme = ref.watch(isDarkTheme);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        6,
        (rowNum) => row == rowNum
            ? const ConfirmButton()
            : Row(
                key: Key('row_$rowNum'),
                children: [
                  Center(
                    child: SizedBox(
                      height: height / 8,
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
                                        : guess[rowNum]![index] !=
                                                solution[index]
                                            ? Colors.grey
                                            : Colors.white
                                : Colors.white,
                            border: Border.all(
                              color:
                                  darkTheme ? Colors.transparent : Colors.black,
                              width: 3,
                            ),
                          ),
                          child: const SizedBox(
                            height: 20,
                            width: 20,
                          ),
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                            width: width < 768
                                ? 25
                                : width < 428
                                    ? 15
                                    : 20),
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
