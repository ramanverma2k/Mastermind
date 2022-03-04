import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';

class BoardModel {
  BoardModel();

  final Map<String, Color?> selectedCells = {};

  final Map<int, List<Color>> guess = {};

  final solution = <Color>[];

  final colorList = <Color>[];

  String tappedTile = '';

  bool isCorrect() {
    const deq = DeepCollectionEquality();

    return deq.equals(guess.values.last, solution);
  }

  // Generate random hex colors
  void genColorList() {
    final random = Random();
    for (var i = 0; i < 9; i++) {
      final color = Color.fromARGB(
          255, random.nextInt(255), random.nextInt(255), random.nextInt(255));

      if (!colorList.contains(color)) {
        colorList.add(color);
      }
    }
  }

  void genSolutionFromColorList() {
    final random = Random();

    for (;;) {
      final color = colorList[random.nextInt(9)];
      if (solution.length < 4) {
        if (!solution.contains(color)) {
          solution.add(color);
        }
      } else {
        break;
      }
    }
  }
}
