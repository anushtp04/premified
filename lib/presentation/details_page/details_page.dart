import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:used_car_app/application/favouritepage_bloc/favourite_page_bloc.dart';
import 'package:used_car_app/core/launch_utils.dart';
import 'package:used_car_app/domain/model/usedcar_model.dart';
import 'package:used_car_app/presentation/details_page/widgets/custom_button_widget.dart';
import 'package:used_car_app/presentation/details_page/widgets/details_carousel_widget.dart';
import '../../application/favourite_toggle/favourite_toggle_bloc.dart';
import '../widgets/text_style.dart';

class DetailsPage extends StatelessWidget {
  final UsedCarModel carmodel;

  DetailsPage({super.key, required this.carmodel});

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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FavouritePageBloc>(context)
          .add(FetchFavCarList());
    });


    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 18,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: AppText(
            text: carmodel.name,
            size: 18,
          ),
          centerTitle: true,
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(children: [
            Container(
              height: 250,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  var listImages = [
                    carmodel.front,
                    carmodel.side1,
                    carmodel.side2,
                    carmodel.back,
                    carmodel.inside
                  ];
                  return DetailsCarouselWidget(
                    image: listImages[index],
                  );
                },
                itemCount: 5,
                itemWidth: 300,
                itemHeight: 250,
                viewportFraction: 1,
                scale: 0.9,
                autoplay: true,
                loop: true,
                pagination: SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                      size: 8,
                      color: Theme.of(context).colorScheme.primary,
                      activeColor: Theme.of(context).colorScheme.secondary),
                  margin: EdgeInsets.only(bottom: 25, left: 20),

                  alignment:
                      Alignment.bottomLeft, // Change pagination alignment here
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              margin: const EdgeInsets.only(top: 230),
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
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
                    color: Colors.black26,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  carmodel.sold == true
                      ? AppText(
                          text: "SOLD",
                          color: Colors.red,
                          size: 25,
                        )
                      : AppText(
                          text: "₹ ${carmodel.price}",
                          size: 25,
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
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    // color: Theme.of(context).colorScheme.inversePrimary
                                  )),
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
                  carmodel.sold == true
                      ? GestureDetector(
                          onTap: () {
                            LaunchUtils.launchWhatsApp(context, carmodel.name);
                          },
                          child: Container(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            height: 36,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                "Enqiury For Same Model",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CutomButtonContainer(
                              icon: Brand(Brands.whatsapp),
                              backgroundColor: const Color(0xff08CC11),
                              text: "WhatsApp",
                              onPressed: () {
                                LaunchUtils.launchWhatsApp(
                                    context, carmodel.name);
                              },
                            ),
                            CutomButtonContainer(
                              icon: Icon(
                                Icons.call,
                                color: Colors.white,
                              ),
                              backgroundColor: Colors.black,
                              text: "Call",
                              onPressed: () {
                                LaunchUtils.launchPhoneCall();
                              },
                            ),
                            CutomButtonContainer(
                              icon: Icon(
                                Icons.mail,
                                color: Colors.white,
                              ),
                              backgroundColor: Colors.black,
                              text: "Mail",
                              onPressed: () {
                                LaunchUtils.launchEmail(carmodel.name);
                              },
                            ),
                          ],
                        )
                ],
              ),
            ),
            Positioned(
                top: 210,
                right: 30,
                child: carmodel.sold == true
                    ? const SizedBox()
                    : BlocBuilder<FavouritePageBloc, FavouritePageState>(
                        builder: (context, state) {
                          final favoriteCars = state.usedCarModel;
                          bool isFavourite = favoriteCars.contains(carmodel);

                          return CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: IconButton(
                                icon: Icon(Icons.favorite,
                                    color:isFavourite
                                        ? Colors.red
                                        : Colors.grey
                                    // Default color
                                    ),
                                onPressed: () async {
                                  BlocProvider.of<FavouriteToggleBloc>(context)
                                      .add(FavouriteClickedEvent(
                                          carmodel: carmodel));
                                  isFavourite
                                      ? Get.snackbar("Removed",
                                          "Removed from the Favourite List",
                                          backgroundColor: Colors.red,
                                          messageText: Text(
                                            "Removed from the Favourite List",
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          duration: Duration(seconds: 1),
                                          isDismissible: true,
                                          dismissDirection:
                                              DismissDirection.horizontal,
                                          // icon: Icon(Icons.thumb_up,color: Colors.white,),
                                          overlayBlur: 4)
                                      : Get.snackbar("Added",
                                          "Added to the Favourite List",
                                          backgroundColor: Colors.green,
                                          messageText: const Text(
                                            "Added to the Favourite List",
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          duration: Duration(seconds: 1),
                                          isDismissible: true,
                                          dismissDirection:
                                              DismissDirection.horizontal,
                                          // icon: Icon(Icons.thumb_up,color: Colors.white,),
                                          overlayBlur: 4);
                                },
                              ));
                        },
                      ))
          ]),
        ));
  }

  String getDetailsBasedOnIndex(int index) {
    if (index == 0) {
      return carmodel.brand;
    } else if (index == 1) {
      return carmodel.year;
    } else if (index == 2) {
      return carmodel.kilometers;
    } else if (index == 3) {
      return carmodel.state;
    } else if (index == 4) {
      return carmodel.color;
    } else if (index == 5) {
      return carmodel.ownership;
    } else if (index == 6) {
      return carmodel.fuel;
    } else {
      return 'Invalid number';
    }
  }
}
