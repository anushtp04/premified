import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text(
        "PREMIFIED USEDCARS",
        style: GoogleFonts.kdamThmorPro(textStyle:TextStyle(
        fontSize: 27,
        letterSpacing: 1,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic
          ),


          )));
  }

  @override

  Size get preferredSize => Size.fromHeight(50);
}

