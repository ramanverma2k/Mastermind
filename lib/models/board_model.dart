import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';

class BoardModel {
  BoardModel();

  final Map<String, Color?> selectedCells = {};

// TODO:
// *** Change this to Map<int, Map<String, Color>>
// The reason why is because we also need to keep track of the cellIndex and the color
// of that cell index so we can properly check if its at the right place.
// Current solution works but only if we fill the cells linearly from left to right.
// If we fill the cells from right to left or change the order
// the hint board cells do not get highlighted correctly. Even if the solution is correct.
// Either make the user fill the cells from left to right or find a way to store the index
// of each cell and the color of that cell. so we can compare to the solution
  final Map<int, List<Color>> guess = {};

  final List<Color> solution = const [
    Color(0xFFe91e63),
    Color(0xFF9c27b0),
    Color(0xFF2196f3),
    Color(0xFF4caf50),
  ];

  String tappedTile = '';

  bool isCorrect() {
    const deq = DeepCollectionEquality();

    return deq.equals(guess.values.last, solution);
  }
}
