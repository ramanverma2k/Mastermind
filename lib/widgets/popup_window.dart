import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastermind/utils/board_state.dart';

class PopUpWindow extends ConsumerWidget {
  const PopUpWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool popUpState = ref.watch(isPopupOpen.state).state;

    final width = MediaQuery.of(context).size.width;

    return popUpState
        ? Scaffold(
            backgroundColor: Colors.transparent,
            body: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10,
                sigmaY: 10,
              ),
              child: Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.32,
                  width: width > 768
                      ? width * 0.15
                      : width > 428
                          ? width * 0.25
                          : width > 390
                              ? width * 0.3
                              : width * 0.5,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                    ),
                    itemCount: 9,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          // Fill the cell with selected color
                          ref.read(boardState.state).state.selectedCells[ref
                                  .watch(boardState.state)
                                  .state
                                  .tappedTile] =
                              ref.read(boardState.state).state.colorList[index];

                          // Clear the previous guess list before adding new guess
                          ref.read(boardState.state).state.guess.clear();

                          // Then Push the selected colors into guess list.
                          ref
                              .read(boardState.state)
                              .state
                              .selectedCells
                              .forEach((key, color) {
                            if (ref
                                .read(boardState.state)
                                .state
                                .guess
                                .containsKey(int.parse(key[0]))) {
                              ref.read(boardState.state).state.guess.update(
                                    int.parse(key[0]),
                                    (value) => [...value, color!],
                                  );
                            } else {
                              ref
                                  .read(boardState.state)
                                  .state
                                  .guess
                                  .putIfAbsent(
                                      int.parse(key[0]), () => [color!]);
                            }
                          });

                          // Hide popup window after filling the cell.
                          ref.read(isPopupOpen.state).state = false;
                        },
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ref
                                .read(boardState.state)
                                .state
                                .colorList[index],
                          ),
                        ),
                      );
                    },
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                ),
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
