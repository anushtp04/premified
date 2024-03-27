import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:used_car_app/domain/model/usedcar_model.dart';
import '../../widgets/text_style.dart';

class CarouselSilderWidget extends StatelessWidget {
  const CarouselSilderWidget({
    Key? key,
    required this.carlist,
  }) : super(key: key);

  final UsedCarModel carlist;

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xff041d4d),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black),
            margin: EdgeInsets.only(right: 100, top: 20, bottom: 20),
            padding: EdgeInsets.all(
                10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AppText(
                    text:carlist.year,
                    color: Colors.white54,
                    size: 13,
                  ),
                  AppText(
                    text:carlist.brand,
                    color: Colors.white,
                    size: 13,
                  ),
                  AppText(
                    text:
                    carlist.name.replaceFirst(carlist.brand, "").trim(),
                    color: Colors.white,
                    size: 17,
                  ),
                  SizedBox(
                    height:10,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppText(
                        text: "starts at  ",
                        color: Colors.white,
                        size:  13,
                        fontWeight: FontWeight.normal,
                      ),
                      AppText(
                        text: "₹ ${carlist.price}",
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              width: 200,
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage(carlist.image),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
