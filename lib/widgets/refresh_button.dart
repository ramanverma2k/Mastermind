import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:mastermind/utils/board_state.dart';

class RefreshButton extends ConsumerStatefulWidget {
  const RefreshButton({Key? key}) : super(key: key);

  @override
  ConsumerState<RefreshButton> createState() => _RefreshButtonState();
}

class _RefreshButtonState extends ConsumerState<RefreshButton>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool popUpState = ref.watch(isPopupOpen.state).state;

    return !popUpState
        ? GestureDetector(
            onTap: () {
              // When the animation is complete reset the state of the board along with animation state.
              _controller.forward().whenComplete(
                () {
                  // Reset the animation state
                  _controller.reset();

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
              );
            },
            child: Lottie.asset(
              'assets/lottie/refresh.json',
              controller: _controller,
              onLoaded: (composition) {
                _controller.duration = composition.duration;
              },
            ),
          )
        : const SizedBox.shrink();
  }
}
