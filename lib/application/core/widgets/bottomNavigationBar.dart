import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../services/drawer_services.dart';

CrystalNavigationBar buildBottomlNavigationBar(DrawerStateProvider drawerState, bool darkMode,_scaffoldKey) {
  return CrystalNavigationBar(
    currentIndex: drawerState.currentIndex,
    indicatorColor: Colors.blue,
    paddingR: const EdgeInsets.only(bottom: 5, top: 5),
    marginR: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    unselectedItemColor: Colors.white70,
    backgroundColor: darkMode ? Colors.white10 : Colors.black26,
    onTap: (index) {
      drawerState.selectedIndex(index);

      if(drawerState.currentIndex == 3){
        _scaffoldKey.currentState!.openEndDrawer();
      }
    },
    items: [
      /// Home
      CrystalNavigationBarItem(
        icon: IconlyBold.home,
        unselectedIcon: IconlyLight.home,
        selectedColor: Colors.white,
      ),

      /// Search
      CrystalNavigationBarItem(
          icon: IconlyBold.search,
          unselectedIcon: IconlyLight.search,
          selectedColor: Colors.white),

      /// Favourite
      CrystalNavigationBarItem(
        icon: IconlyBold.heart,
        unselectedIcon: IconlyLight.heart,
        selectedColor: Colors.red,
      ),

      /// Profile
      CrystalNavigationBarItem(
        icon: IconlyBold.user_2,
        unselectedIcon: IconlyLight.user,
        selectedColor: Colors.white,
      ),
    ],
  );
}
