import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:used_car_app/domain/model/usedcar_model.dart';
import 'package:used_car_app/presentation/details_page/widgets/customButton.dart';
import 'package:used_car_app/presentation/details_page/widgets/detailsCarousel.dart';
import '../../application/bloc/details_page_bloc/details_page_bloc.dart';
import '../widgets/text_style.dart';

class UsedCarDetailPage extends StatelessWidget {
  final UsedCarModel carmodel;

  UsedCarDetailPage({super.key, required this.carmodel});

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
    return BlocProvider(
      create: (context) =>
          DetailsPageBloc()..add(DetailsPageLoadEvent(carmodel: carmodel)),
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: 18,
                color: Colors.black,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            title: AppText(
              text: carmodel.name,
              size: 18,
            ),
            centerTitle: true,
          ),
          body: BlocBuilder<DetailsPageBloc, DetailsPageState>(
            builder: (context, state) {
              if (state is DetailsPageLoading) {
                return Center(
                  child: CircularProgressIndicator(color: Colors.blue.shade900,),
                );
              } else if (state is DetailsPageLoaded) {
                final carmodel = state.usedcars;
                return SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: Stack(children: [
                    CarouselSlider(
                        options: CarouselOptions(
                            height: 250,
                            autoPlay: true,
                            viewportFraction: 1,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 10)),
                        items: [
                          DetailsCarouselWidget(
                            carmodel: carmodel,
                            image: carmodel.front,
                          ),
                          DetailsCarouselWidget(
                              carmodel: carmodel, image: carmodel.side1),
                          DetailsCarouselWidget(
                              carmodel: carmodel, image: carmodel.side2),
                          DetailsCarouselWidget(
                              carmodel: carmodel, image: carmodel.back),
                          DetailsCarouselWidget(
                            carmodel: carmodel,
                            image: carmodel.inside,
                          ),
                        ]),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      margin: const EdgeInsets.only(top: 230),
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(detailsList[index],
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black45)),
                                      Text(
                                        getDetailsBasedOnIndex(index),
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
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
                              ? Container(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  height: 36,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Center(
                                    child: Text(
                                      "Enqiury For Same Model",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                )
                              : const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CutomButtonContainer(
                                      icon: Icons.messenger,
                                      backgroundColor: Color(0xff08CC11),
                                      text: "WhatsApp",
                                    ),
                                    CutomButtonContainer(
                                      icon: Icons.call,
                                      backgroundColor: Colors.black,
                                      text: "Call",
                                    ),
                                    CutomButtonContainer(
                                      icon: Icons.mail,
                                      backgroundColor: Colors.black,
                                      text: "Mail",
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
                            : CircleAvatar(
                                backgroundColor: Colors.blue,
                                child: IconButton(
                                    icon: Icon(Icons.favorite),
                                    color: carmodel.isFavourite
                                        ? Colors.red
                                        : Colors.grey,
                                    onPressed: () {
                                      BlocProvider.of<DetailsPageBloc>(context)
                                          .add(ToggleFavoriteEvent(
                                              carmodel: carmodel));
                                      final isCurrentlyFavourite =
                                          state.usedcars.isFavourite;
                                      showTopSnackBar(
                                        Overlay.of(context),
                                        isCurrentlyFavourite
                                            ? CustomSnackBar.error(
                                                message:
                                                    "Removed from Favourite List")
                                            : CustomSnackBar.success(
                                                message:
                                                    "Added to Favourite List"),
                                      );
                                    }),
                              ))
                  ]),
                );
              } else {
                return Center(
                  child: Text("An Error has occured...."),
                );
              }
            },
          )),
    );
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
