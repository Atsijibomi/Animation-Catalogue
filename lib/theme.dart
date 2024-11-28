import 'package:flutter/material.dart';

// Configuration for light and dark themes
class ThemeConfig {
  // Light theme definition
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.deepPurple,
    brightness: Brightness.light,
    cardColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.deepPurple,
      foregroundColor: Colors.white,
    ),
  );

  // Dark theme definition
  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.deepPurple,
    brightness: Brightness.dark,
    cardColor: Colors.grey[900],
    appBarTheme: AppBarTheme(
      color: Colors.black,
      foregroundColor: Colors.white,
    ),
  );
}
