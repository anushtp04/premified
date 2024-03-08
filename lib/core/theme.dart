import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final Color _lightPrimaryVariantColor = Colors.blueGrey.shade800;
  static final Color _lightOnPrimaryColor = Color(0xffcad5da);
  static const Color _lightTextColorPrimary = Colors.black;
  static const Color _appbarColorLight = Color(0xffcad5da);

  static final Color _darkPrimaryColor = Colors.blueGrey.shade800;
  static const Color _darkPrimaryVariantColor = Colors.black;
  static final Color _darkOnPrimaryColor = Colors.blueGrey.shade300;
  static const Color _darkTextColorPrimary = Colors.white;
  static final Color _appbarColorDark = Colors.blueGrey.shade800;

  static const Color _iconColor = Colors.white;

  static const Color _accentColor = Color.fromRGBO(74, 24, 154, 1);

  // *****************
  // Text Style - light
  // *****************
  static const TextStyle _lightHeadingText = TextStyle(
      color: _lightTextColorPrimary,
      fontFamily: "Rubik",
      fontSize: 20,
      fontWeight: FontWeight.bold);

  static const TextStyle _lightBodyText = TextStyle(
      color: _lightTextColorPrimary,
      fontFamily: "Rubik",
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
      fontSize: 16);

  static final TextTheme _lightTextTheme = TextTheme(
    displayLarge: _lightHeadingText,
    bodyLarge: _lightBodyText,
  );

  // *****************
  // Text Style - dark
  // *****************
  static final TextStyle _darkThemeHeadingTextStyle =
      _lightHeadingText.copyWith(color: _darkTextColorPrimary);

  static final TextStyle _darkThemeBodyeTextStyle =
      _lightBodyText.copyWith(color: _darkTextColorPrimary);

  static final TextTheme _darkTextTheme = TextTheme(
    displayLarge: _darkThemeHeadingTextStyle,
    bodyLarge: _darkThemeBodyeTextStyle,
  );

// *****************
// Theme light/dark
// *****************

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: _lightOnPrimaryColor,
    appBarTheme: const AppBarTheme(
        color: _appbarColorLight, iconTheme: IconThemeData(color: _iconColor)),
    colorScheme: ColorScheme.light(
        primary: _lightOnPrimaryColor,
        onPrimary: _lightOnPrimaryColor,
        secondary: _accentColor,
        primaryContainer: _lightPrimaryVariantColor),
    textTheme: _lightTextTheme,
  );

  static final ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: _darkPrimaryColor,
      appBarTheme: AppBarTheme(
          color: _appbarColorDark,
          iconTheme: const IconThemeData(color: _iconColor)),
      colorScheme: ColorScheme.dark(
        primary: _darkPrimaryColor,
        secondary: _accentColor,
        onPrimary: _darkOnPrimaryColor,
        primaryContainer: _darkPrimaryVariantColor,
      ),
      textTheme: _darkTextTheme,
      bottomAppBarTheme: BottomAppBarTheme(color: _appbarColorDark));
}
