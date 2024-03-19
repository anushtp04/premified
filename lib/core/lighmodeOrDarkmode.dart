
import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade300,
    primary: Colors.white,
    secondary: Colors.black,
    tertiary: Colors.white,
    inversePrimary: Colors.grey
  )
);

ThemeData darkMode = ThemeData(
    colorScheme: const ColorScheme.dark(
        background: Color.fromARGB(255,30, 30, 30),
        primary:  Colors.black,
        secondary:  Colors.white,
        tertiary:  Color.fromARGB(255,47, 47, 47),
        inversePrimary: Colors.black45
    )
);