import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

import '../../../data/model/model_class.dart';
import '../../widgets/text_style.dart';

class CarouselSilderWidget extends StatelessWidget {
  const CarouselSilderWidget({
    Key? key,
    required this.carlist,
  }) : super(key: key);

  final CarModel? carlist;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xff041d4d),
        borderRadius: BorderRadius.circular(10),
      ),
      child: carlist != null
          ? Stack(
                  children: [
          Container(
            width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black
          ),

          margin: EdgeInsets.only(right: 110,top: 20,bottom: 20),
            padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AppText(text: "${carlist!.year}",color: Colors.white54, size: 15,),
                  SizedBox(height: 5,),
                  AppText(text: "${carlist!.brand}",color: Colors.white,size: 15,),
                  AppText(
                    text: "${carlist!.name?.replaceFirst("${carlist!.brand}", "").trim()}",color: Colors.white,size: 17,
                  ),
                  SizedBox(height: 19,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppText(text: "starts at  ",color: Colors.white,size: 14,fontWeight: FontWeight.normal,),
                      AppText(text: "₹ ${carlist!.price}",color: Colors.white,size: 20,),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,top: 0,bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: 10,bottom: 10),
              width: 200,
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage("${carlist!.image}"),
                ),
              ),
            ),
          ),

                  ],
                )
          : Shimmer.fromColors( // Wrap the whole container with Shimmer.fromColors
        baseColor: Colors.grey[300]!, // Set the base color
        highlightColor: Colors.grey[100]!, // Set the highlight color
        child: Container( // Child container to apply shimmer
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
