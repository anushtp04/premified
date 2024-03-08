import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:used_car_app/presentation/favourite_page/favourite_page.dart';
import 'package:used_car_app/presentation/home_page/home_page.dart';
import 'package:used_car_app/presentation/main_page/widgets/bottom_nav_bar.dart';
import 'package:used_car_app/presentation/search_page/search_page.dart';
import 'package:used_car_app/presentation/settings_page/settings_page.dart';

import '../../application/bloc/bottom_nav_bloc/bottom_nav_bloc.dart';


class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _pages = [HomePage(), SearchPage(), FavouritePage(), SettingsPage()];

    return Scaffold(
      body: BlocBuilder<BottomNavBloc, BottomNavState>(
        builder: (BuildContext context, BottomNavState state) {
          if (state is BottomNavIndexChangedState) {
            return _pages[state.selectedIndex];
          }
          return Container();
        },),
      extendBody: true,
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }

}

