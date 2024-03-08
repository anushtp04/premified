import 'package:flutter/material.dart';
import 'package:used_car_app/domain/model/usedcar_model.dart';


class DetailsCarouselWidget extends StatelessWidget {
  final String image;

  const DetailsCarouselWidget({
    super.key,
    required this.carmodel, required this.image ,
  });

  final UsedCarModel carmodel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 250,
     decoration: BoxDecoration(
       image: DecorationImage(image: NetworkImage(image),fit: BoxFit.fill)
     ),
    );
  }
}
