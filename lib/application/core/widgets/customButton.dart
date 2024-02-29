import 'package:flutter/material.dart';

class CutomButtonContainer extends StatelessWidget {

  final IconData icon;
  final String text;
  final Color backgroundColor;

  const CutomButtonContainer({
    super.key, required this.icon, required this.backgroundColor,  required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12,right: 12,top: 5,bottom: 5),
      height: 36,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white38),
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor
      ),
      child: Row(
        children: [
          Icon(icon,color: Colors.white,size: 20,),
          SizedBox(width: 10,),
          Text(text,style: TextStyle(color:Colors.white,fontSize: 15 ),)
        ],
      ),
    );
  }
}
