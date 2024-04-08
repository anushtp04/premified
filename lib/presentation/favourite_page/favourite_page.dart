import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:lottie/lottie.dart';
import 'package:used_car_app/application/favouritepage_bloc/favourite_page_bloc.dart';
import 'package:used_car_app/presentation/details_page/details_page.dart';
import 'package:used_car_app/presentation/widgets/text_style.dart';

import '../../application/favourite_toggle/favourite_toggle_bloc.dart';
import '../../core/secondary_appbar.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FavouritePageBloc>(context).add(FetchFavCarList());
    });



    return SafeArea(
        child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: SecondaryAppBar(
              title: "My Favourites",
            ),
            body: BlocBuilder<FavouritePageBloc, FavouritePageState>(
              builder: (context, state) {
                if(state.isLoading){
                  return Center(child: CircularProgressIndicator(),);
                }
                else if(state.usedCarModel.isEmpty){
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset("assets/favourite.json"),
                        SizedBox(
                          height: 20,
                        ),
                        AppText(
                          text: "No Favourite Car Added",
                          size: 18,
                        ),
                      ],
                    ),
                  );
                }
                else{
                  return Container(
                      margin: EdgeInsets.only(top: 40),
                      height: double.infinity,
                      width: double.infinity,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                        itemCount: state.usedCarModel.length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(DetailsPage(carmodel: state.usedCarModel[index]));
                                },
                                child: Slidable(
                                  key: ValueKey(state.usedCarModel[index]),
                                  endActionPane: ActionPane(
                                      motion: DrawerMotion(),
                                      dragDismissible: true,
                                      dismissible:
                                      DismissiblePane(onDismissed: () {
                                        BlocProvider.of<FavouriteToggleBloc>(context)
                                            .add(FavouriteClickedEvent(
                                                carmodel: state.usedCarModel[index]));
                                      }),
                                      children: [
                                        SlidableAction(
                                          onPressed: (context) {},
                                          backgroundColor: Color(0xFFFE4A49),
                                          foregroundColor: Colors.white,
                                          icon: Icons.delete,
                                          borderRadius: BorderRadius.circular(20),
                                          label: 'Swipe to remove',
                                        )
                                      ]),
                                  child: Card(
                                    child: Container(
                                      height: screenHeight * .12,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Container(
                                              width: screenWidth * .38,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.contain,
                                                      image: NetworkImage(
                                                          state.usedCarModel[index].image))),
                                              child: state.usedCarModel[index].sold == true
                                             ? Center(
                                                child: Container(
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          5)),
                                                  padding: EdgeInsets.only(
                                                      left: 5, right: 5),
                                                  child: Text(
                                                    "SOLD",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white,
                                                        fontWeight:
                                                        FontWeight.w500),
                                                  ),
                                                ),
                                              ) : null),
                                          Container(
                                            width: screenWidth * .49,
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                AppText(
                                                  text: state.usedCarModel[index].name,
                                                  color: Colors.grey.shade700,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    AppText(
                                                      text: state.usedCarModel[index].price,
                                                      size: 20,
                                                    ),
                                                    AppText(
                                                      text: state.usedCarModel[index].year,
                                                      color: Colors.grey.shade700,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                      topRight:
                                                      Radius.circular(10),
                                                      bottomRight:
                                                      Radius.circular(10)),
                                                  color: Colors.red),
                                              child: Center(
                                                child: Icon(
                                                  Icons.arrow_back_ios_new,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ));
                        },
                      ));
                }
              },
            )));
  }
}
