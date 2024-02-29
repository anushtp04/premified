import 'package:flutter/material.dart';
import 'package:used_car_app/application/core/widgets/text_style.dart';

Drawer buildEndDrawer() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(color: Colors.blue),
          child: AppText(text: "Hiii Anush ❤️", size: 22),
        ),
        const ListTile(
            leading: Icon(Icons.feedback_outlined),
            title: Text("About App")),
        const ListTile(
            title: Text("Feedback"), leading: Icon(Icons.feed_outlined)),
        const ListTile(title: Text("Contact"), leading: Icon(Icons.phone)),
        const ListTile(
            title: Text("Terms & Conditions"),
            leading: Icon(Icons.shield_sharp)),
        const ListTile(
            title: Text("Settings"), leading: Icon(Icons.settings)),
      ],
    ),
  );
}
