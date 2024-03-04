import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:used_car_app/presentation/search_page/widgets/search_list_tile.dart';
import 'package:used_car_app/presentation/widgets/text_style.dart';


class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;




    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: AppText(text: "Search",size: 22,),
          leading: Container(
              width: 50,
              margin: EdgeInsets.all(11),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
              ),
              child: Icon(Icons.keyboard_arrow_down_sharp,color: Colors.black,size: 28,)),
        ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight*0.01,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SearchListTile(title: "Make" ),
                    SearchListTile(title: "Class"),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SearchListTile(title: "Color",),
                    SearchListTile(title: "Price"),
                  ],
                ),
                Card(
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white12),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue.shade900
                    ),
                    child: Center(child: AppText(text:  "Search",color: Colors.white,)),
                  ),
                )
              ],
            ),
            SizedBox(height: screenHeight*0.02,),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: Text(
                    "You Search Results Will Appear Here"
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}

