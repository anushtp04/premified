import 'package:flutter/material.dart';

import '../../../data/model/model_class.dart';

class DetailsCarouselWidget extends StatelessWidget {
  final String image;

  const DetailsCarouselWidget({
    super.key,
    required this.carmodel, required this.image ,
  });

  final CarModel carmodel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 250,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(image))),
      // child: Center(
      //   child: carmodel.sold == true
      //       ? Container(
      //     decoration: BoxDecoration(
      //       color: Colors.red,
      //       borderRadius: BorderRadius.circular(5),
      //     ),
      //     padding: const EdgeInsets.only(left: 10, right: 10),
      //     child: const Text(
      //       "SOLD",
      //       style: TextStyle(
      //           color: Colors.white,
      //           fontWeight: FontWeight.bold,
      //           fontSize: 18
      //       ),
      //     ),
      //   )
      //       : const SizedBox(),
      // ),
    );
  }
}
