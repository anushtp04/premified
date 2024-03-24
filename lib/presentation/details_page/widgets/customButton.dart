import 'package:flutter/material.dart';

class CutomButtonContainer extends StatelessWidget {

  final Widget icon;
  final String text;
  final Color backgroundColor;
  final VoidCallback onPressed;

  const CutomButtonContainer({
    super.key, required this.icon, required this.backgroundColor, required this.text, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ,
      child: Container(
        padding: EdgeInsets.only(left: 12, right: 12, top: 5, bottom: 5),
        height: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white38),
            borderRadius: BorderRadius.circular(10),
            color: backgroundColor
        ),
        child:  Row(
                children: [
                  icon,
                  SizedBox(width: 10,),
                  Text(text, style: TextStyle(color: Colors.white, fontSize: 15),)
                ],
              )
      ),
    );
  }
}
