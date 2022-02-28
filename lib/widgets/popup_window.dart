import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastermind/utils/board_state.dart';
import 'package:mastermind/utils/constants.dart';

class PopUpWindow extends ConsumerWidget {
  const PopUpWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool popUpState = ref.watch(isPopupOpen.state).state;

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
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                      ),
                      itemCount: 12,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            // Fill the cell with selected color
                            ref.read(boardState.state).state.selectedCells[ref
                                .watch(boardState.state)
                                .state
                                .tappedTile] = colorList[index];

                            // Clear the previous guess list before adding new guess
                            ref.read(boardState.state).state.guess.clear();

                            // Then Push the selected colors into guess list.
                            ref
                                .read(boardState.state)
                                .state
                                .selectedCells
                                .values
                                .forEach(
                              (color) {
                                ref
                                    .read(boardState.state)
                                    .state
                                    .guess
                                    .add(color!);
                              },
                            );

                            // Hide popup window after filling the cell.
                            ref.read(isPopupOpen.state).state = false;
                          },
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colorList[index],
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
