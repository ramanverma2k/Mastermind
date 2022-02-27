import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastermind/models/board_model.dart';

final boardState = StateProvider<BoardModel>(
  (ref) => BoardModel(),
);

final currentRow = StateProvider<int>(
  (ref) => 0,
);

final isPopupOpen = StateProvider<bool>((ref) => false);
