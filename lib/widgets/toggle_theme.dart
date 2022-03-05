import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:mastermind/utils/board_state.dart';

class ToggleThemeButton extends ConsumerStatefulWidget {
  const ToggleThemeButton({Key? key}) : super(key: key);

  @override
  ConsumerState<ToggleThemeButton> createState() => ToggleThemeButtonState();
}

class ToggleThemeButtonState extends ConsumerState<ToggleThemeButton>
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
    final bool darkTheme = ref.watch(isDarkTheme.state).state;

    return GestureDetector(
      onTap: () {
        darkTheme
            ? _controller.reverse().whenComplete(
                () => ref.read(isDarkTheme.state).state = !darkTheme)
            : _controller.forward().whenComplete(
                  () => ref.read(isDarkTheme.state).state = !darkTheme,
                );
      },
      child: Lottie.asset(
        'assets/lottie/toggle_theme.json',
        controller: _controller,
        onLoaded: (composition) {
          _controller.duration = const Duration(milliseconds: 500);
        },
      ),
    );
  }
}
