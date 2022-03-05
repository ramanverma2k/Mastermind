import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastermind/screens/homepage.dart';
import 'package:mastermind/theme.dart';
import 'package:mastermind/utils/board_state.dart';

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(isDarkTheme.state).state;

    return MaterialApp(
      title: 'Mastermind',
      theme: theme ? darkTheme : lightTheme,
      home: const HomePage(title: 'Mastermind'),
    );
  }
}
