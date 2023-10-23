import 'package:flutter/material.dart';

final darkTheme = ThemeData(
    fontFamily: 'Exo2',
    scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 1.0),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromRGBO(222, 222, 222, 1),
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Color.fromRGBO(202, 199, 199, 1),
        onPrimary: Colors.black// Background color
      ),
    ),
    iconTheme: IconThemeData(
      color: Color.fromRGBO(80, 80, 80, 1),
    ),
    dividerColor: Colors.white24,
    listTileTheme: const ListTileThemeData(iconColor: Colors.white),
    textTheme: TextTheme(
      headlineMedium: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 18,
          fontFamily: 'Exo2'),
      bodyMedium: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          fontFamily: 'Exo2'),
      labelLarge: const TextStyle(
          color: Color.fromRGBO(153, 153, 153, 1),
          fontWeight: FontWeight.w400,
          fontSize: 18,
          fontFamily: 'Exo2'),
      labelSmall: TextStyle(
          color: Color.fromRGBO(135, 135, 135, 1),
          fontWeight: FontWeight.w400,
          fontSize: 12),
    ));
