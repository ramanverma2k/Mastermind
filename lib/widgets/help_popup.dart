import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastermind/utils/board_state.dart';

// TODO: Style and correct the layout of this popup
class HelpPopup extends ConsumerWidget {
  const HelpPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final help = ref.watch(isHelpOpen);

    final darkTheme = ref.watch(isDarkTheme);

    final width = MediaQuery.of(context).size.width;

    return help
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
                      decoration: BoxDecoration(
                        color: darkTheme ? Colors.transparent : Colors.white,
                        border: Border.all(
                          style: BorderStyle.solid,
                          color: darkTheme ? Colors.white : Colors.black,
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.62,
                          width: width < 390 ? width * 0.8 : width * 0.6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Game Rules',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      darkTheme ? Colors.white : Colors.black,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Objective',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      darkTheme ? Colors.white : Colors.black,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                  'A secret combination of 4 colors is selected and you have to guess that combination in 8 or fewer tries to win.'),
                              const SizedBox(height: 10),
                              Text(
                                'How to play',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      darkTheme ? Colors.white : Colors.black,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                  'From top to bottom, at each row, click on a circle and pick a color. After filling all circles in a row, you can check your guess.'),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: darkTheme
                                          ? Colors.white
                                          : Colors.black,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: const SizedBox(
                                      height: 10,
                                      width: 10,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const Flexible(
                                    child: Text(
                                        'A grey circle means that the color exists in the combination but the position is not correct.'),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: darkTheme
                                          ? Colors.white
                                          : Colors.black,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: const SizedBox(
                                      height: 10,
                                      width: 10,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const Flexible(
                                    child: Text(
                                        'A green circle means the color and the position is correct.'),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: darkTheme
                                          ? Colors.white
                                          : Colors.black,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: const SizedBox(
                                      height: 10,
                                      width: 10,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const Flexible(
                                    child: Text(
                                        'An empty circle means that color is not in the combination at all.'),
                                  )
                                ],
                              )
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
