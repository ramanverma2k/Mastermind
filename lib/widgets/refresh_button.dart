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
              // Reset all states
              ref.refresh(boardState);
              ref.refresh(currentRow);
              ref.refresh(isLost);
              ref.refresh(isWon);
              ref.refresh(isPopupOpen);

              // Generate new Color List and Solution
              ref.read(boardState).genColorList();
              ref.read(boardState).genSolutionFromColorList();
            },
            child: const Icon(Icons.refresh),
          )
        : const SizedBox.shrink();
  }
}
