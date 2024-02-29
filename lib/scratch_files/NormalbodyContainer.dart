import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/model/usedcar_model.dart';
import '../application/core/services/database_services.dart';

Container buildNormalBodyContainer(bool darkMode) {

  final DatabaseService _databaseService = DatabaseService();

  return Container(
    height: double.infinity,
    width: double.infinity,
    padding: const EdgeInsets.all(10),
    child: Column(
      children: [
        Stack(
          children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/background.jpg"))
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10,top: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Discover The Best Car \nDeals For You",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                    Text("The car you want, the price you deserve",style: TextStyle(color: Colors.white),)
                  ],
                ))

          ]
        ),
        SizedBox(height: 10,),
        StreamBuilder(
          stream: _databaseService.getUsedCarData(),
          builder: (context, snapshot) {
            List usedCars = snapshot.data?.docs ?? [];
            if (usedCars.isEmpty) {
              return const Center(
                child: Column(
                  children: [
                    CircularProgressIndicator(),
                    Text("Used cars data empty"),
                  ],
                ),
              );
            }
            return Expanded(
              child: GridView.builder(
                itemCount: usedCars.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: .9
                ),
                itemBuilder: (context, index) {
                  UsedCarModel usedcar = usedCars[index].data();
                  return Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                // margin: EdgeInsets.only(top: 60),
                                padding: EdgeInsets.only(left: 10,right: 10,top: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                    darkMode ? Colors.black54 : Colors.white),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 100,),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 18,
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                              BorderRadius.circular(5)),
                                          padding: const EdgeInsets.only(
                                              left: 7, right: 7),
                                          child: Text(
                                            usedcar.price!,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          ),
                                        ),
                                        Text(
                                          usedcar.brand!,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8,bottom: 8),
                                      child: Text(
                                        usedcar.name!,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("${usedcar.kilometers!} KM",style: TextStyle(fontSize: 12),),
                                          Row(
                                            children: [
                                              Text(
                                                "${usedcar.ownership}",
                                                style: const TextStyle(fontSize: 13),
                                              ),
                                              const Icon(
                                                Icons.person,
                                                size: 16,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                                    image: DecorationImage(
                                        fit: BoxFit.fitWidth,
                                        image: NetworkImage(usedcar.image!))
                                ),
                              ),
                              Positioned(
                                  top: 80,
                                  right: 0,
                                  child: Center(
                                    child:usedcar.sold == true ?Container(
                                      height: 20,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      padding: const EdgeInsets.only(left: 2,right: 2),
                                      child: const Text(
                                        "SOLD",style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                      ),
                                      ),
                                    ):  null,
                                  ))
                            ]
                        ),


                      ],
                    ),
                  );
                },
              ),
            );
          },
        )
      ],
    ),
  );
}
