import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(backgroundColor: Colors.teal),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
      ),
    ),
  );
  static final dark = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(backgroundColor: Colors.teal),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
      ),
    ),
  );
}
