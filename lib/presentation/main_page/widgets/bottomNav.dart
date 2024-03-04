import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import '../../../application/core/services/theme_services.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<ThemeServiceProvider>(context).isDarkModeOn;

    return ValueListenableBuilder(valueListenable: indexChangeNotifier, builder: (context, int newIndex, child) {
      return CrystalNavigationBar(
        currentIndex: newIndex,
        indicatorColor: Colors.blue,
        paddingR: const EdgeInsets.only(bottom: 5, top: 5),
        marginR: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        unselectedItemColor: Colors.white70,
        backgroundColor: darkMode ? Colors.white10 : Colors.black26,
        onTap: (index) {
          indexChangeNotifier.value = index;

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
            icon: IconlyBold.setting,
            unselectedIcon: IconlyLight.setting,
            selectedColor: Colors.white,
          ),
        ],
      );
    },);
  }
}


