import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:used_car_app/core/base_font_size.dart';
import 'package:used_car_app/core/sizes.dart';
import 'package:used_car_app/domain/model/usedcar_model.dart';
import 'package:used_car_app/presentation/widgets/text_style.dart';

class GridCardWidget extends StatelessWidget {

  const GridCardWidget({
    super.key,
    required this.height,
    required this.usedcar,
  });

  final double height;
  final UsedCarModel usedcar;



  @override
  Widget build(BuildContext context) {


    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding:  EdgeInsets.only(left: ScreenUtil.getNineSize(context), right: ScreenUtil.getNineSize(context), top: ScreenUtil.getFiveSize(context)), //left 10 right 10 top 6
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ScreenUtil.getTenSize(context)),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: ScreenUtil.getSeventySize(context)),
              Padding(
                padding: EdgeInsets.only(top: ScreenUtil.getFiveSize(context)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // height: height * 0.021,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(ScreenUtil.getFiveSize(context)),
                      ),
                      padding: EdgeInsets.only(left:  ScreenUtil.getFiveSize(context), right: ScreenUtil.getFiveSize(context)), // left 7 right 7
                      child: Text(
                        usedcar.price,
                        style: TextStyle(
                          fontSize: ScreenUtil.getTwelveSize(context), //
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      usedcar.brand,
                      style:  TextStyle(
                        fontSize:ScreenUtil.getTwelveSize(context) ,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                usedcar.name,
                style:  TextStyle(
                  fontSize: ScreenUtil.getFifteenSize(context),
                  fontWeight: FontWeight.w500,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${usedcar.kilometers} KM",
                      style:  TextStyle(fontSize: ScreenUtil.getTwelveSize(context)),
                    ),
                    AppText(text: usedcar.year, size: ScreenUtil.getTwelveSize(context),)
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: ScreenUtil.getThreeSize(context),
          right: ScreenUtil.getThreeSize(context),
          child: usedcar.sold == true
              ? Container(
            height: ScreenUtil.getSeventeenSize(context),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(ScreenUtil.getFiveSize(context)),
            ),
            padding: EdgeInsets.only(left: ScreenUtil.getFiveSize(context),right: ScreenUtil.getFiveSize(context)),
            child:  Text(
              "SOLD",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil.getTwelveSize(context)
              ),
            ),
          )
              : usedcar.sold ==false && usedcar.isFavourite == true ? Icon(IconlyBold.heart,color: Colors.red,size: ScreenUtil.getTwentySize(context),):Icon(IconlyBold.heart,color: Colors.grey.shade200,size: ScreenUtil.getTwentySize(context),), // Placeholder for the "SOLD" label
        ),


        Padding(
          padding: EdgeInsets.only(left: ScreenUtil.getTenSize(context),right: ScreenUtil.getTenSize(context)),
          child: Container(
            width: double.infinity,
            height: ScreenUtil.getNintySize(context),
            decoration: BoxDecoration(
              borderRadius:  BorderRadius.only(
                topLeft: Radius.circular(ScreenUtil.getTenSize(context)),
                topRight: Radius.circular(ScreenUtil.getTenSize(context)),
              ),
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: NetworkImage(usedcar.image),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
