import 'dart:io';

import 'package:flutter/material.dart';
import 'package:used_car_app/presentation/favourite_page/favourite_page.dart';
import 'package:used_car_app/presentation/home_page/home_page.dart';
import 'package:used_car_app/presentation/main_page/widgets/bottom_nav_bar.dart';
import 'package:used_car_app/presentation/search_page/search_page.dart';
import 'package:used_car_app/presentation/settings_page/settings_page.dart';



class MainPage extends StatelessWidget {
    MainPage({super.key});


  @override
  Widget build(BuildContext context) {
    final _pages = [HomePage(), SearchPage(), FavouritePage(), SettingsPage()];

     return ValueListenableBuilder(
       valueListenable: indexChangeNotifier,
       builder: (context, newValue, child) {
         return PopScope(
           canPop: newValue == 0,
           onPopInvoked: (didPop) {
             if (didPop) {
               return;
             }
             else{
               indexChangeNotifier.value = 0;
               return ;
             }
           },
           child: Scaffold(
             body: _pages[newValue],
             extendBody: true,
             bottomNavigationBar: BottomNavBarWidget(),
           ),
         );
       },

     );
  }

}


