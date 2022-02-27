import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';

class BoardModel {
  BoardModel();

  final Map<String, Color?> selectedCells = {};

  final List<Color> guess = [];

  final List<Color> solution = const [
    Color(0xFFf44336),
    Color(0xFF9c27b0),
    Color(0xFF2196f3),
    Color(0xFF4caf50),
  ];

  String tappedTile = '';

  bool isCorrect() {
    const deq = DeepCollectionEquality();

    return deq.equals(guess, solution);
  }
}
