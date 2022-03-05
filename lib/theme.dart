import 'package:flutter/material.dart';

final darkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: const Color(0xFF023047),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF023047),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  primaryTextTheme: const TextTheme().apply(
    displayColor: Colors.white,
    bodyColor: Colors.white,
  ),
);

final lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  primaryTextTheme: const TextTheme().apply(
    displayColor: Colors.black,
    bodyColor: Colors.black,
  ),
);
