import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastermind/utils/board_state.dart';

class HelpButton extends ConsumerWidget {
  const HelpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(isHelpOpen.state).state = !ref.read(isHelpOpen.state).state;
      },
      child: const Icon(
        Icons.help_rounded,
      ),
    );
  }
}
