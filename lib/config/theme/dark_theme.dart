import 'package:flutter/material.dart';
import 'package:veegilbank/core/util/coloors.dart';

ThemeData darkThme() {
  // final ThemeData base = ThemeData.dark()..font;
  return ThemeData(
    fontFamily: 'Machina',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Coloors.backgroundDark,
    colorScheme: const ColorScheme.dark(
        background: Coloors.backgroundDark,
        primary: Coloors.greenDark,
        secondary: Coloors.greenDark),
    textTheme: const TextTheme(
        displayMedium: TextStyle(
      fontFamily: 'Machina',
    )),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(10))),
    ),
  );
}
