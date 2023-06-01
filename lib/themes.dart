import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    appBarTheme:
        const AppBarTheme(backgroundColor: Color.fromARGB(255, 33, 158, 188)),
    scaffoldBackgroundColor: const Color.fromARGB(255, 142, 202, 230),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 33, 158, 188),
      ),
    ),
  );
  static final dark = ThemeData.dark().copyWith(
    appBarTheme:
        const AppBarTheme(backgroundColor: Color.fromARGB(255, 33, 158, 188)),
    scaffoldBackgroundColor: const Color.fromARGB(255, 2, 48, 71),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 33, 158, 188),
      ),
    ),
  );
}
