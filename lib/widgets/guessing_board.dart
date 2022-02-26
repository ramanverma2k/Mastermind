import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastermind/utils/board_state.dart';

class GuessingBoard extends ConsumerWidget {
  const GuessingBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<String, Color?> cells = ref.watch(selectedCells.state).state;
    final bool popUpState = ref.watch(isPopupOpen.state).state;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        6,
        (colNum) => Row(
          key: Key('row_$colNum'),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 8,
              width: MediaQuery.of(context).size.width * 0.5,
              child: ListView.separated(
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    // Push the selected cell index to the board state
                    ref.read(selectedCells).putIfAbsent(
                          '$colNum$index',
                          () => null,
                        );

                    // Keep track of which cell is currently selected
                    // We'll use this to highlight the selected cell with color choice
                    ref.read(tappedCell.state).state = '$colNum$index';

                    // Update the state of isPopUpOpen state to show or hide the popup.
                    ref.read(isPopupOpen.state).state = !popUpState;
                  },
                  child: DecoratedBox(
                    key: Key('cell_$colNum$index'),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: cells['$colNum$index'] ?? Colors.white,
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
