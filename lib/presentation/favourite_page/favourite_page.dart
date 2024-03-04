import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:used_car_app/application/core/services/firestore_services.dart';
import 'package:used_car_app/presentation/widgets/text_style.dart';

import '../../data/model/model_class.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});


  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    FirestoreService firestoreService = FirestoreService();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: AppText(text: "My Favourites",size: 22,),
          leading: Container(
            width: 50,
              margin: EdgeInsets.all(11),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              child: Icon(Icons.keyboard_arrow_down_sharp,color: Colors.black,size: 28,)),
        ),
        body: StreamBuilder(
          stream: firestoreService.getCarStream() ,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              List<CarModel> cars = snapshot.data!;
              return Container(
                margin: EdgeInsets.only(top: 40),
                  height: double.infinity,
                  width: double.infinity,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 10,),

                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Card(
                          child: Container(
                            height: screenHeight*.12,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(width: screenWidth*.37,decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image: NetworkImage(cars[index].image!))
                                ),),
                                Container(
                                  width: screenWidth*.49,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AppText(text: cars[index].name!,color: Colors.grey.shade700,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          AppText(text: cars[index].price!,size: 20,),
                                          AppText(text: "${cars[index].year}",color: Colors.grey.shade700,),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(width: 5,),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                                        color: Colors.blue
                                    ),
                                    child: Center(
                                      child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },)
              );
            }
            else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
        )
      );

  }
}