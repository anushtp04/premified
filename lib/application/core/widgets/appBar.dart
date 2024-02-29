
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/theme_services.dart';

AppBar buildAppBar(bool darkMode, BuildContext context) {
  return AppBar(
    elevation: 0,
    // title: AppText(
    //   text: "Motorwagon",
    //   size: 28,
    //   color: darkMode ? Colors.black : Colors.blue.shade900,
    // ),
    title: Container(
      height: 40,
      width: 200,
      decoration: BoxDecoration(
        color: darkMode? Color(0xff37474F) : Color(0xffcad5da),
        image: DecorationImage(image: AssetImage("assets/logo.png"))
      ),
    ),
    actions: [
      Switch(
        activeColor: Colors.blue.shade700,
        inactiveTrackColor: Colors.yellow.shade50,
        thumbColor: MaterialStateProperty.all(
            darkMode ? Colors.blue : Colors.orange.shade200),
        thumbIcon: MaterialStateProperty.all(darkMode
            ? const Icon(
          Icons.dark_mode,
          color: Colors.white,
        )
            : const Icon(
          Icons.sunny,
          color: Colors.white,
        )),
        trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
        value: darkMode,
        onChanged: (value) {
          Provider.of<ThemeServiceProvider>(context, listen: false)
              .toggleTheme();
        },
      ),
    ],
  );
}
