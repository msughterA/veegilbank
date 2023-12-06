import 'package:flutter/material.dart';
import 'package:veegilbank/core/util/coloors.dart';

ThemeData lightTheme() {
  // final ThemeData base = ThemeData.light();
  return ThemeData(
    fontFamily: 'Machina',
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
        background: Coloors.backgroundLight,
        primary: Coloors.greenLight,
        secondary: Coloors.greenLight),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(10))),
    ),
  );
}
