import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:used_car_app/domain/model/usedcar_model.dart';
import '../../../core/sizes.dart';
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
            margin: EdgeInsets.only(right: ScreenUtil.getHundredSize(context), top: ScreenUtil.getTwentySize(context), bottom: ScreenUtil.getTwentySize(context)),
            padding: EdgeInsets.all(
                ScreenUtil.getTenSize(context)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AppText(
                    text:carlist.year,
                    color: Colors.white54,
                    size: ScreenUtil.getThirteenSize(context),
                  ),
                  AppText(
                    text:carlist.brand,
                    color: Colors.white,
                    size: ScreenUtil.getThirteenSize(context),
                  ),
                  AppText(
                    text:
                    carlist.name.replaceFirst(carlist.brand, "").trim(),
                    color: Colors.white,
                    size: ScreenUtil.getSeventeenSize(context),
                  ),
                  SizedBox(
                    height: ScreenUtil.getTenSize(context),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppText(
                        text: "starts at  ",
                        color: Colors.white,
                        size:  ScreenUtil.getThirteenSize(context),
                        fontWeight: FontWeight.normal,
                      ),
                      AppText(
                        text: "₹ ${carlist.price}",
                        color: Colors.white,
                        size: ScreenUtil.getTwentySize(context),
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
              margin: EdgeInsets.only(top: ScreenUtil.getTenSize(context), bottom: ScreenUtil.getTenSize(context)),
              width: ScreenUtil.getTwoHundredSize(context),
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
