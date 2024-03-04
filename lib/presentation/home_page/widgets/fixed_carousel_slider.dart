import 'package:flutter/material.dart';

class FixedCarouselSliderWidget extends StatelessWidget {
  const FixedCarouselSliderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
              "assets/background.jpg"),
        ),
      ),
      child: const Padding(
        padding:
        EdgeInsets.only(left: 10, top: 40),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Text(
              "Discover The Best Car \nDeals For You",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "The car you want, the price you deserve",
              style: TextStyle(
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
