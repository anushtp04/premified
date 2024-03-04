import 'package:flutter/material.dart';

class settingsRowWidget extends StatelessWidget {

  final String mainText;
  final String subText;
  final IconData icon;

  const settingsRowWidget({
    super.key, required this.mainText, this.subText = "", required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: Card(

        child: ListTile(
          leading: Icon(icon,size: 22,),
          title: Text(mainText,style: TextStyle(fontStyle: FontStyle.normal),),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(subText,style: TextStyle(fontSize: 15,) ,
              ),
              Icon(Icons.keyboard_arrow_right_sharp)
            ],
          ),
        ),
      ),
    );
  }
}
