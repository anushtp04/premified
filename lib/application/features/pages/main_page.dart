import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:used_car_app/application/core/services/drawer_services.dart';
import '../../core/services/theme_services.dart';
import '../../core/widgets/appBar.dart';
import '../../../scratch_files/NormalbodyContainer.dart';
import '../../core/widgets/bottomNavigationBar.dart';
import '../../core/widgets/endDrawer.dart';
import '../../core/widgets/bodyContainer.dart';

// enum _totalTabs { home, search, favourite, person }

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ///firebase

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();





  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<ThemeServiceProvider>(context).isDarkModeOn;
    final drawerState = Provider.of<DrawerStateProvider>(context);

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: buildEndDrawer(),
      appBar: buildAppBar(darkMode, context),
      body: buildBodyContainer(darkMode),
      extendBody: true,
      bottomNavigationBar: buildBottomlNavigationBar(drawerState, darkMode,_scaffoldKey),
    );
  }




}
