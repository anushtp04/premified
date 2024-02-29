import 'package:flutter/material.dart';

class DrawerStateProvider extends ChangeNotifier {
  bool isDrawerOpen = false;

  int currentIndex = 0;

  void selectedIndex(int index){
    currentIndex = index;
    notifyListeners();
  }


}