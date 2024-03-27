import 'package:flutter/material.dart';


class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      elevation: 0,
      centerTitle: true,
      title: Image.asset( Theme.of(context).colorScheme.primary == Colors.black
          ? "assets/premifiedwhite.png" :"assets/premified.png" ,height: 55,width: 300,fit: BoxFit.fitWidth,)
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55);
}

