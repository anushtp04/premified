import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../application/bloc/bottom_nav_bloc/bottom_nav_bloc.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        int currentIndex = 0; // Default currentIndex
        if (state is BottomNavIndexChangedState) {
          currentIndex = state.selectedIndex;
        }
        return CrystalNavigationBar(
          indicatorColor: Colors.blue,
          currentIndex: currentIndex,
          paddingR: const EdgeInsets.only(bottom: 5, top: 5),
          marginR: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          unselectedItemColor: Colors.white70,
          backgroundColor: Colors.black26,
          onTap: (index) {
            context.read<BottomNavBloc>().add(
                TabChangedEvent(selectedIndex: index));
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
      },

    );

  }
}
