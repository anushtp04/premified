import 'package:flutter/material.dart';


class DetailsCarouselWidget extends StatelessWidget {
  final String image;

  const DetailsCarouselWidget({
    super.key,
   required this.image ,
  });


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
