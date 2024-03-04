import 'package:flutter/material.dart';

class SearchListTile extends StatelessWidget {

  final String title;
  final IconData? icon;



  const SearchListTile({
    super.key, required this.title,this.icon = Icons.keyboard_arrow_down_outlined

  ,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;



    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Card(
        child: Container(
          width: screenWidth*0.45,
          child: ListTile(

            title: Text(title,style: TextStyle(fontStyle: FontStyle.normal),),
            trailing: icon!=null ? Icon(icon) : null ,
          ),
        ),
      ),
    );
  }
}