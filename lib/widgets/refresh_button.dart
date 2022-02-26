import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastermind/utils/board_state.dart';

class RefreshButton extends ConsumerWidget {
  const RefreshButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool popUpState = ref.watch(isPopupOpen.state).state;

    return !popUpState
        ? GestureDetector(
            onTap: () {
              // Reset the board state
              // Clear all the selected cells
              ref.refresh(selectedCells);
              // Get rid of the tappedTile state
              ref.refresh(tappedCell);
            },
            child: const Icon(
              Icons.refresh_rounded,
              color: Colors.black,
            ),
          )
        : const SizedBox.shrink();
  }
}
