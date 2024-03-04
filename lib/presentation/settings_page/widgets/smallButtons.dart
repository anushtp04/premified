import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../application/core/services/theme_services.dart';
import '../../widgets/text_style.dart';

class SmallButtons extends StatelessWidget {

  final IconData icon;
  final String text;
  final Color? color;
  final VoidCallback onTapFunction;

  const SmallButtons({
    super.key, required this.icon, required this.text, required this.onTapFunction,this.color
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<ThemeServiceProvider>(context).isDarkModeOn;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => onTapFunction(),
          child: Container(
            height: MediaQuery.of(context).size.height*.06,
            width: MediaQuery.of(context).size.width*0.13,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white38),
                borderRadius: BorderRadius.circular(10),
                color: darkMode?Colors.black: Colors.white
            ),
            child: Icon(icon,size: 20,color: color,),
          ),
        ),
        SizedBox(height: 5,),
        AppText(text: text,size: 14,fontWeight: FontWeight.w500,)
      ],
    );
  }
}
