import 'package:flutter/material.dart';
import '../../widgets/text_style.dart';

class SmallButtons extends StatelessWidget {

  final Widget icon;
  final String text;
  final VoidCallback onTapFunction;

  const SmallButtons({
    super.key, required this.icon, required this.text, required this.onTapFunction,
  });

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: onTapFunction,
          child: Container(
            padding: EdgeInsets.all(height*0.013),
            height: height*.06,
            width: width*0.13,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white38),
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.primary
            ),
            child: icon,
          ),
        ),
        SizedBox(height: 5,),
        AppText(text: text,size: 14,fontWeight: FontWeight.w500,)
      ],
    );
  }
}
