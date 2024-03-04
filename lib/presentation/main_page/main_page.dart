import 'package:flutter/material.dart';
import 'package:used_car_app/presentation/favourite_page/favourite_page.dart';
import 'package:used_car_app/presentation/home_page/home_page.dart';
import 'package:used_car_app/presentation/main_page/widgets/bottomNav.dart';
import 'package:used_car_app/presentation/search_page/search_page.dart';
import 'package:used_car_app/presentation/settings_page/settings_page.dart';


class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {

    final _pages = [HomePage(),SearchPage(),FavouritePage(),SettingsPage()];

    return Scaffold(
      body: ValueListenableBuilder(valueListenable: indexChangeNotifier, builder: (context, index, child) {

        return _pages[index];
      },),
      extendBody: true,
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
