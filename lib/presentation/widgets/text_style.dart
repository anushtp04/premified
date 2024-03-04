import 'dart:ui';

import 'package:flutter/material.dart';

class AppText extends StatelessWidget {

  final double size;
  final String text;
  final FontWeight fontWeight;
  final Color? color;

  AppText(
      {super.key,
        this.size = 16,
        required this.text,
         this.fontWeight = FontWeight.bold, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: fontWeight

      ),
    );
  }
}
