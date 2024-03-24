import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:used_car_app/presentation/home_page/widgets/carousel_slider_widget.dart';
import 'package:used_car_app/presentation/home_page/widgets/fixed_carousel_slider.dart';
import 'package:used_car_app/presentation/home_page/widgets/grid_card_widget.dart';
import 'package:used_car_app/presentation/widgets/text_style.dart';
import '../../application/bloc/home_page_bloc/get_used_car_bloc.dart';
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
          body: BlocBuilder<GetUsedCarBloc, GetUsedCarState>(
              builder: (context, state) {
            if (state is GetUsedCarLoading) {
              return Center(
                child: CircularProgressIndicator(color: Colors.blue.shade900,),
              );
            } else if (state is GetUsedCarLoaded) {
              final randomIndex1 = Random().nextInt(state.usedCars.length);

              int randomIndex2;
              do {
                randomIndex2 = Random().nextInt(state.usedCars.length);
              } while (randomIndex2 == randomIndex1);

              return Container(
                width: double.infinity,
                height: double.infinity,
                child: ListView(children: [
                  Container(
                    padding: EdgeInsets.only(top: 13,left: 10, right: 10, bottom: 10),
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
                                    carlist: state.usedCars[randomIndex1]),
                                CarouselSilderWidget(
                                    carlist: state.usedCars[randomIndex2]),
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
                      itemCount: state.usedCars.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => UsedCarDetailPage(carmodel: state.usedCars[index]),));
                          },
                          child:
                              GridCardWidget(height: height, usedcar: state.usedCars[index]),
                        );
                      },
                    ),
                  ),
                ]),
              );
            } else {
              return Center(
                child: Text("An error has occured..."),
              );
            }
          })
    );

}}
