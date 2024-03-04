import 'dart:math' as math;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:used_car_app/application/core/services/firestore_services.dart';
import 'package:used_car_app/data/model/model_class.dart';
import 'package:used_car_app/presentation/home_page/widgets/carousel_slider_widget.dart';
import 'package:used_car_app/presentation/home_page/widgets/fixed_carousel_slider.dart';
import 'package:used_car_app/presentation/home_page/widgets/grid_card_widget.dart';
import 'package:used_car_app/presentation/widgets/text_style.dart';
import '../../application/core/services/theme_services.dart';
import '../details_page/detailsPage.dart';
import '../main_page/widgets/appBar.dart';

ValueNotifier<int> carouselIndex = ValueNotifier(0);

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<ThemeServiceProvider>(context).isDarkModeOn;
    final FirestoreService firestoreService = FirestoreService();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    double childAspectRatio;
    if (width < 450) {
      // For smaller screens, set childAspectRatio to 0.89
      childAspectRatio = .89;
    } else {
      // For larger screens, set childAspectRatio to 1.05
      childAspectRatio = 1.05;
      }


    return Scaffold(
        appBar: const AppBarWidget(),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: StreamBuilder(
            stream: firestoreService.getCarStream(),
            builder: (context, snapshot) {
              List<CarModel> cars = snapshot.data??[];
              cars.sort((a, b) => b.year!.compareTo(a.year as num));


              CarModel? carList1;
              CarModel? carList2;

              if (cars.isNotEmpty) {
                final randomIndex1 = math.Random().nextInt(cars.length);

                int randomIndex2;
                do {
                  randomIndex2 = math.Random().nextInt(cars.length);
                } while (randomIndex2 == randomIndex1);

                carList1 = cars[randomIndex1];
                carList2 = cars[randomIndex2];
              } else {
                carList1 = null;
                carList2 = null;
              }



              return  ListView(
                children: [
                  Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ValueListenableBuilder(
                        valueListenable: carouselIndex,
                        builder: (context, value, child) {
                          return Column(
                            children: [
                              CarouselSlider(
                                options: CarouselOptions(
                                  onPageChanged: (index, reason) {
                                    carouselIndex.value = index;
                                  },
                                  initialPage: carouselIndex.value,
                                  height: height * .2,
                                  autoPlay: true,
                                  viewportFraction: 1,
                                  enlargeCenterPage: true,
                                  enableInfiniteScroll: true,
                                ),
                                items: [
                                  FixedCarouselSliderWidget(),
                                  CarouselSilderWidget(carlist: carList1),
                                  CarouselSilderWidget(carlist: carList2),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  for (int i = 0; i < 3; i++)
                                    Container(
                                      height: height * .01,
                                      width: height * .01,
                                      margin: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: carouselIndex.value == i
                                              ? Colors.black
                                              : Colors.grey,
                                          borderRadius:
                                          BorderRadius.circular(10)),
                                    )
                                ],
                              )
                            ],
                          );
                        },
                      ),
                      SizedBox(
                        height: height * 0.02 ,
                      ),
                      AppText(
                        text: "All Cars",
                        size: 20,
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                    ],
                  ),
                ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),

                    itemCount: cars.length ,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: childAspectRatio,
                    ),
                    itemBuilder: (context, index) {
                      CarModel usedcar = cars[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UsedCarDetailPage(
                                  carmodel: usedcar,
                                ),
                              ));
                        },
                        child: GridCardWidget(darkMode: darkMode, height: height, usedcar: usedcar),
                      );
                    },

                  ),

                ]
              );




            },
          ),
        ));
  }
}



