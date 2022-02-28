import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastermind/models/board_model.dart';
import 'package:mastermind/utils/board_state.dart';

class GuessingBoard extends ConsumerWidget {
  const GuessingBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final BoardModel state = ref.watch(boardState);

    final bool popUpState = ref.watch(isPopupOpen.state).state;

    final int current = ref.watch(currentRow.state).state;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        6,
        (rowNum) => Row(
          key: Key('row_$rowNum'),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 8,
              width: MediaQuery.of(context).size.width * 0.5,
              child: ListView.separated(
                itemBuilder: (context, index) => current == rowNum
                    ? GestureDetector(
                        onTap: () {
                          // Push the selected cell index to the board state
                          ref
                              .read(boardState.state)
                              .state
                              .selectedCells
                              .putIfAbsent(
                                '$rowNum$index',
                                () => null,
                              );

                          // Keep track of which cell is currently selected
                          // We'll use this to highlight the selected cell with color choice
                          ref.read(boardState.state).state.tappedTile =
                              '$rowNum$index';

                          // Update the state of isPopUpOpen state to show or hide the popup.
                          ref.read(isPopupOpen.state).state = !popUpState;
                        },
                        child: DecoratedBox(
                          key: Key('cell_$rowNum$index'),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: state.selectedCells['$rowNum$index'] ??
                                Colors.white,
                            border: Border.all(
                              color: Colors.black,
                              width: 3,
                            ),
                          ),
                          child: const SizedBox(
                            height: 40,
                            width: 40,
                          ),
                        ),
                      )
                    : DecoratedBox(
                        key: Key('cell_$rowNum$index'),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: current == rowNum
                              ? state.selectedCells['$rowNum$index'] ??
                                  Colors.white
                              : state.selectedCells['$rowNum$index'] ??
                                  Colors.grey,
                          border: Border.all(
                            color: Colors.black,
                            width: 3,
                          ),
                        ),
                        child: const SizedBox(
                          height: 40,
                          width: 40,
                        ),
                      ),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 20,
                ),
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
