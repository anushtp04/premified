import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:used_car_app/application/core/widgets/text_style.dart';
import 'package:used_car_app/data/model/usedcar_model.dart';

import '../../core/services/theme_services.dart';
import '../../core/widgets/customButton.dart';

class UsedCarDetailPage extends StatelessWidget {
  final UsedCarModel carmodel;

  UsedCarDetailPage({super.key, required this.carmodel});

  final List<String> detailsList = [
    "Brand",
    "Year",
    "Kilometers",
    "Registration Place",
    "Color",
    "Car Owners",
    "Fuel Type",
  ];

  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<ThemeServiceProvider>(context).isDarkModeOn;

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: darkMode ? Colors.white : Colors.black,
              size: 18,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: AppText(
            text: carmodel.name!,
            size: 18,
            color: darkMode ? Colors.white : Colors.black,
          ),
          centerTitle: true,
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(children: [
            Container(
              padding: const EdgeInsets.all(10),
              height: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(carmodel.image!))),
              child: Center(
                child: carmodel.sold == true
                    ? Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: const Text(
                          "SOLD",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                          ),
                        ),
                      )
                    : const SizedBox(),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              margin: const EdgeInsets.only(top: 230),
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: darkMode ? Colors.black : Colors.white,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 2,
                    width: 50,
                    color: darkMode ? Colors.white : Colors.black26,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  AppText(
                    text: "₹ ${carmodel.price!}",
                    size: 25,
                    color: darkMode ? Colors.white : Colors.black,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: detailsList.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(detailsList[index],
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: darkMode
                                          ? Colors.white54
                                          : Colors.black45)),
                              Text(
                                getDetailsBasedOnIndex(index),
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  carmodel.sold == true ? Container(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    height: 36,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Center(
                      child: Text("Enqiury For Same Model",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                    ),
                  ) : const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CutomButtonContainer(
                        icon: Icons.messenger,
                        backgroundColor: Color(0xff08CC11),
                        text: "WhatsApp",
                      ),
                      CutomButtonContainer(
                        icon: Icons.call,
                        backgroundColor: Colors.black,
                        text: "Call",
                      ),
                      CutomButtonContainer(
                        icon: Icons.mail,
                        backgroundColor: Colors.black,
                        text: "Mail",
                      ),
                    ],
                  )
                ],
              ),
            ),
             Positioned(
                top: 210,
                right: 30,
                child: carmodel.sold == true ? const SizedBox() : const CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ))
          ]),
        ));
  }

  String getDetailsBasedOnIndex(int index) {
    if (index == 0) {
      return carmodel.brand!;
    } else if (index == 1) {
      return "${carmodel.year!}";
    } else if (index == 2) {
      return "${carmodel.kilometers!}";
    } else if (index == 3) {
      return carmodel.state!;
    } else if (index == 4) {
      return carmodel.color!;
    } else if (index == 5) {
      return "${carmodel.ownership!}";
    } else if (index == 6) {
      return carmodel.fuel!;
    } else {
      return 'Invalid number';
    }
  }
}
