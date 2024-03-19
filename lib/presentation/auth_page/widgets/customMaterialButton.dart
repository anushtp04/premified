import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:used_car_app/core/sizes.dart';

import '../../widgets/text_style.dart';

class CustomMaterialButton extends StatelessWidget {

  final String icon;
  final String text;
  final VoidCallback onPressed;

  const CustomMaterialButton({

    super.key, required this.icon, required this.text, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: ScreenUtil.getSixty(context),
      minWidth: double.infinity,
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Brand(icon),
          Expanded(child: Center(child: AppText(text: text, size: 18,)))
        ],
      ),
    );
  }
}
