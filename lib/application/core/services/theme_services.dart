import 'package:flutter/material.dart';

class ThemeServiceProvider extends ChangeNotifier{

  bool isDarkModeOn = false;

  void toggleTheme(){
    isDarkModeOn = !isDarkModeOn;
    notifyListeners();
  }

}