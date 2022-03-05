import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastermind/models/board_model.dart';
import 'package:mastermind/utils/board_state.dart';

class GameOverPopUp extends ConsumerWidget {
  const GameOverPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final BoardModel state = ref.watch(boardState);

    final isGameOver = ref.watch(isLost);

    final darkTheme = ref.watch(isDarkTheme);

    return isGameOver
        ? Scaffold(
            backgroundColor: Colors.transparent,
            body: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10,
                sigmaY: 10,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DecoratedBox(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: const Center(
                          child: Text(
                            'Game Over',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      const Text(
                                        'Your Guess',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Center(
                                        child: SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              4,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.315,
                                          child: ListView.separated(
                                            itemBuilder: (context, index) =>
                                                DecoratedBox(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: state
                                                    .selectedCells['5$index'],
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 3,
                                                ),
                                              ),
                                              child: const SizedBox(
                                                height: 20,
                                                width: 20,
                                              ),
                                            ),
                                            separatorBuilder:
                                                (context, index) =>
                                                    const SizedBox(width: 20),
                                            itemCount: 4,
                                            scrollDirection: Axis.horizontal,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Text(
                                        'Correct Solution',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Center(
                                        child: SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              4,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.315,
                                          child: ListView.separated(
                                            itemBuilder: (context, index) =>
                                                DecoratedBox(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: state.solution[index],
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 3,
                                                ),
                                              ),
                                              child: const SizedBox(
                                                height: 20,
                                                width: 20,
                                              ),
                                            ),
                                            separatorBuilder:
                                                (context, index) =>
                                                    const SizedBox(width: 20),
                                            itemCount: 4,
                                            scrollDirection: Axis.horizontal,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Center(
                                  child: SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: BorderSide(
                                          color: darkTheme
                                              ? Colors.transparent
                                              : Colors.black,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color?>(
                                            Colors.white),
                                  ),
                                  onPressed: () {
                                    // Reset all states
                                    ref.refresh(boardState);
                                    ref.refresh(currentRow);
                                    ref.refresh(isLost);
                                    ref.refresh(isWon);
                                    ref.refresh(isPopupOpen);

                                    // Generate new ColorList and Solution
                                    ref.read(boardState).genColorList();
                                    ref
                                        .read(boardState)
                                        .genSolutionFromColorList();
                                  },
                                  child: const Text(
                                    'Reset',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
