import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import 'package:used_car_app/application/bloc/favourite_screen_bloc/favourite_screen_bloc.dart';
import 'package:used_car_app/application/bloc/favourite_toggle_bloc/favourite_toggle_bloc.dart';
import 'package:used_car_app/presentation/details_page/details_page.dart';
import 'package:used_car_app/presentation/widgets/text_style.dart';

import '../../core/secondary_appbar.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;

    WidgetsBinding.instance.addPostFrameCallback(
          (_) {
        BlocProvider.of<FavouriteScreenBloc>(context)
            .add(FavouriteLoadedEvent());
      },
    );

    return SafeArea(
        child: Scaffold(
            backgroundColor: Theme
                .of(context)
                .colorScheme
                .background,
            appBar: SecondaryAppBar(
              title: "My Favourites",
            ),
            body: BlocBuilder<FavouriteScreenBloc, FavouriteScreenState>(
              builder: (context, state) {
                if (state is FavouriteScreenLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is FavouriteScreenLoadedState) {
                  final favCars = state.favCars;

                  if (favCars.isEmpty) {
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

                  return Container(
                      margin: EdgeInsets.only(top: 40),
                      height: double.infinity,
                      width: double.infinity,
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(
                              height: 10,
                            ),
                        itemCount: favCars.length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding:
                              const EdgeInsets.only(left: 10, right: 10),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UsedCarDetailPage(carmodel: favCars[index]),
                                    ),
                                  );

                                  // Handle result if needed

                                },
                                child: Slidable(
                                  key: ValueKey(favCars[index]),
                                  endActionPane: ActionPane(
                                      motion: DrawerMotion(),
                                      dragDismissible: true,
                                      dismissible: DismissiblePane(
                                          onDismissed: () {
                                            BlocProvider
                                                .of<FavouriteToggleBloc>(
                                                context).add(
                                                FavouriteTogglePressedEvent(
                                                    carmodel: favCars[index]));
                                          }

                                      ),
                                      children: [

                                        SlidableAction(
                                          onPressed: (context) {
                                          },
                                          backgroundColor: Color(0xFFFE4A49),
                                          foregroundColor: Colors.white,
                                          icon: Icons.delete,
                                          borderRadius:
                                          BorderRadius.circular(20),
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
                                                          favCars[index]
                                                              .image))),
                                              child: favCars[index].sold == true
                                                  ? Center(
                                                child: Container(
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          5)),
                                                  padding: EdgeInsets.only(
                                                      left: 5,
                                                      right: 5),
                                                  child: Text(
                                                    "SOLD",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color:
                                                        Colors.white,
                                                        fontWeight:
                                                        FontWeight
                                                            .w500),
                                                  ),
                                                ),
                                              )
                                                  : null),
                                          Container(
                                            width: screenWidth * .49,
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                AppText(
                                                  text: favCars[index].name,
                                                  color: Colors.grey.shade700,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    AppText(
                                                      text:
                                                      favCars[index].price,
                                                      size: 20,
                                                    ),
                                                    AppText(
                                                      text: favCars[index].year,
                                                      color:
                                                      Colors.grey.shade700,
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
                                                  borderRadius:
                                                  BorderRadius.only(
                                                      topRight:
                                                      Radius.circular(
                                                          10),
                                                      bottomRight:
                                                      Radius.circular(
                                                          10)),
                                                  color: Colors.red),
                                              child: Center(
                                                child: Icon(
                                                  Icons
                                                      .arrow_back_ios_new,
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
                } else {
                  return Center(
                    child: Text("Something unexpected Happened"),
                  );
                }
              },
            )));
  }
}
