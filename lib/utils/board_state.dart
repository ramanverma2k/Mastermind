import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastermind/models/board_model.dart';

final boardState = StateProvider<BoardModel>(
  (ref) => BoardModel(),
);

final isPopupOpen = StateProvider<bool>((ref) => false);
