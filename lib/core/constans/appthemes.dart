import 'package:flutter/material.dart';
import 'package:foodnest/core/constans/appcolors.dart';

ThemeData myEnaglishtheme = ThemeData(
    fontFamily: "playfairDisplay",
    appBarTheme:
        AppBarTheme(backgroundColor: Appcolors.scondecolor, centerTitle: true),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: Appcolors.scondecolor),
    textTheme: TextTheme(
      headlineMedium: TextStyle(fontSize: 16),
      bodyLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Appcolors.primarycolor),
      headlineLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
      labelSmall: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
      bodySmall: TextStyle(
        color: Appcolors.grey,
        fontSize: 15,
      ),
      titleLarge: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      titleSmall: TextStyle(color: Appcolors.grey, fontSize: 22),
      titleMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 23, color: Appcolors.white),
    ));

ThemeData arabictheme = ThemeData(
    fontFamily: "Cairo",
    textTheme: TextTheme(
      titleLarge: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      titleSmall: TextStyle(color: Appcolors.grey, fontSize: 22),
      titleMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 23, color: Appcolors.white),
    ));
