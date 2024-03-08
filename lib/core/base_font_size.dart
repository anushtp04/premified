import 'package:flutter/material.dart';

class ResponsiveText extends StatelessWidget {
  final String text;
  final double baseFontSize;
  final Color? color;
  final FontWeight? fontWeight;

  ResponsiveText({required this.text, required this.baseFontSize, this.color, this.fontWeight,});

  @override
  Widget build(BuildContext context) {


    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Calculate the font size based on the screen width
    double fontSize = screenWidth * baseFontSize;

    return Text(
      text,
      style: TextStyle(fontSize: fontSize,color: color,fontWeight: fontWeight),
    );
  }
}