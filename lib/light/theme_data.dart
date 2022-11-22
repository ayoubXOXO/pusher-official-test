import 'package:flutter/material.dart';

import 'palette.dart';

final ThemeData lightTheme = ThemeData(
    primaryColor: PaletteLight.primaryColor,
    primarySwatch: PaletteLight.primaryColor,
    fontFamily: 'Basiercircle',
    backgroundColor: const Color(
      0xff814cc4,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w100),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(
                (states) => const Color(0xffff6849)))));
