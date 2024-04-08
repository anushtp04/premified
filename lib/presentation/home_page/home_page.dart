import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:used_car_app/application/homepage_bloc/home_page_bloc.dart';
import 'package:used_car_app/presentation/home_page/widgets/carousel_slider_widget.dart';
import 'package:used_car_app/presentation/home_page/widgets/fixed_carousel_slider.dart';
import 'package:used_car_app/presentation/home_page/widgets/grid_card_widget.dart';
import 'package:used_car_app/presentation/widgets/text_style.dart';
import '../details_page/details_page.dart';
import '../main_page/widgets/appBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;

    return Scaffold(

        backgroundColor: Theme.of(context).colorScheme.background,
          appBar: const AppBarWidget(),
          body: BlocBuilder<HomePageBloc,HomePageState>(
              builder: (context, state) {
                if(state.isLoading){
                  return Center(child: CircularProgressIndicator(),);
                }
               else if (state.usedCarModel.isEmpty) {
                  return Center(child: Text("Unexpected Error Occurec"));
                } else {
                  final randomIndex1 = Random().nextInt(state.usedCarModel.length);

                  int randomIndex2;
                  do {
                    randomIndex2 = Random().nextInt(state.usedCarModel.length);
                  } while (randomIndex2 == randomIndex1);
                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: ListView(children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: 13, left: 10, right: 10, bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                CarouselSlider(
                                  options: CarouselOptions(
                                    height: height * .2,
                                    autoPlay: true,
                                    viewportFraction: 1,
                                    enlargeCenterPage: true,
                                    enableInfiniteScroll: true,
                                  ),
                                  items: [
                                    FixedCarouselSliderWidget(),
                                    CarouselSilderWidget(
                                        carlist: state
                                            .usedCarModel[randomIndex1]
                                    ),
                                    CarouselSilderWidget(
                                        carlist: state
                                            .usedCarModel[randomIndex2]),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.02,
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
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: state.usedCarModel.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(DetailsPage(carmodel: state.usedCarModel[index],));
                              },
                              child:
                              GridCardWidget(height: height,
                                  usedcar: state.usedCarModel[index]),
                            );
                          },
                        ),
                      ),
                    ]),
                  );

                }
              })
    );

}}
