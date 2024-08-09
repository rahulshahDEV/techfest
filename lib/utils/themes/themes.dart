import 'package:byrahul/utils/themes/palette.dart';
import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    useMaterial3: true,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Palette.primary,
        foregroundColor: Palette.territory_white),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: Palette.territory_white),
      labelStyle: TextStyle(color: Palette.territory_white),
    ),
    primaryIconTheme: IconThemeData(color: Palette.territory_white),
    iconTheme: IconThemeData(color: Palette.territory_white),
    scaffoldBackgroundColor: Palette.scaffoldColour,
    textTheme: TextTheme(labelSmall: TextStyle(color: Palette.territory_white)),
    appBarTheme: AppBarTheme(
        surfaceTintColor: Palette.territory_white,
        backgroundColor: Palette.primary,
        // backgroundColor: ,
        foregroundColor: Palette.territory_white));
