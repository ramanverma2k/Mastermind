import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedCells = StateProvider<Map<String, Color?>>((ref) => {});

final tappedCell = StateProvider<String>((ref) => '');

final isPopupOpen = StateProvider<bool>((ref) => false);
