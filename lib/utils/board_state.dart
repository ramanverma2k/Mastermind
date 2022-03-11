import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastermind/models/board_model.dart';

final boardState = StateProvider<BoardModel>(
  (ref) => BoardModel(),
);

final currentRow = StateProvider<int>(
  (ref) => 0,
);

final isPopupOpen = StateProvider<bool>((ref) => false);

final isLost = StateProvider<bool>((ref) => false);

final isWon = StateProvider<bool>((ref) => false);

final isDarkTheme = StateProvider<bool>((ref) => false);

final isHelpOpen = StateProvider<bool>((ref) => false);
