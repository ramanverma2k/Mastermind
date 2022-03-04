import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:mastermind/utils/board_state.dart';

class WinPopUp extends ConsumerWidget {
  const WinPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isGameOver = ref.watch(isWon);

    return isGameOver
        ? Scaffold(
            backgroundColor: Colors.transparent,
            body: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10,
                sigmaY: 10,
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                ),
                child: Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'You Won!',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Flexible(
                            child:
                                Lottie.asset('assets/lottie/celebration.json'),
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
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: const BorderSide(
                                        color: Colors.black, width: 2),
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

                                // Generate new Color List and Solution
                                ref.read(boardState).genColorList();
                                ref.read(boardState).genSolutionFromColorList();
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
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
