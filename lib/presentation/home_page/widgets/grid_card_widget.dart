import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:used_car_app/presentation/widgets/text_style.dart';

import '../../../data/model/model_class.dart';

class GridCardWidget extends StatelessWidget {
  const GridCardWidget({
    super.key,
    required this.darkMode,
    required this.height,
    required this.usedcar,
  });

  final bool darkMode;
  final double height;
  final CarModel usedcar;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: darkMode ? Colors.black54 : Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: height * 0.12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: height * 0.021,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.only(left: 7, right: 7),
                    child: Text(
                      "₹ ${usedcar.price!}",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    usedcar.brand!,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Text(
                  usedcar.name!,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${usedcar.kilometers!} KM",
                      style: const TextStyle(fontSize: 13),
                    ),
                    AppText(text: "${usedcar.year}",size: 13,)
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 3,
          right: 3,
          child: usedcar.sold == true
              ? Container(
                  height: height * 0.024,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.only(left: 2, right: 2),
                  child: const Text(
                    "SOLD",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : const SizedBox(), // Placeholder for the "SOLD" label
        ),
        if (usedcar.image!.isEmpty)
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
            ),
          ),
        Container(
          width: double.infinity,
          height: height * 0.122,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: NetworkImage(usedcar.image!),
            ),
          ),
        ),
      ],
    );
  }
}
