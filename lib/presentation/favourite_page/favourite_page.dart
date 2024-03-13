import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:used_car_app/application/bloc/favourite_screen_bloc/favourite_screen_bloc.dart';
import 'package:used_car_app/core/sizes.dart';
import 'package:used_car_app/infrastructure/repository/firebase_repo.dart';
import 'package:used_car_app/presentation/details_page/detailsPage.dart';
import 'package:used_car_app/presentation/widgets/text_style.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;


    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: AppText(
                text: "My Favourites",
                size: 22,
              ),
              leading: Container(
                  width: 50,
                  margin: EdgeInsets.all(11),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: Colors.black,
                    size: 28,
                  )),
            ),
            body: BlocBuilder<FavouriteScreenBloc, FavouriteScreenState>(
              builder: (context, state) {
                if(state is FavouriteScreenLoadingState){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                else if(state is FavouriteScreenLoadedState){
                  
                  final favCars = state.carModel.where((car) => car.isFavourite).toList();
                  if (favCars.isEmpty) {
                    return Center(
                      child: Text("No Favourite Lists"),
                    );
                  }
                  return Container(
                      margin: EdgeInsets.only(top: 40),
                      height: double.infinity,
                      width: double.infinity,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                        itemCount:favCars.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => UsedCarDetailPage(carmodel: favCars[index]),));
                              },
                              child: Slidable(
                                key: ValueKey(0),
                                endActionPane: ActionPane(
                                    motion: DrawerMotion(),
                                    // dragDismissible: true,
                                    // dismissible: DismissiblePane(onDismissed: () => FirebaseRepo().toggleFavoriteStatus(favCars[index]),),
                                    children: [
                                      SlidableAction(
                                        onPressed: (context) => FirebaseRepo().toggleFavoriteStatus(favCars[index]),
                                        backgroundColor: Color(0xFFFE4A49),
                                        foregroundColor: Colors.white,
                                        icon: Icons.delete,
                                        borderRadius: BorderRadius.circular(20),
                                        label: 'Delete',)
                                    ]),
                                child: Card(
                                  child: Container(
                                    height: screenHeight * .12,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: screenWidth * .37,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.contain,
                                                  image: NetworkImage(
                                                     favCars[index].image))

                                          ),
                                          child: favCars[index].sold == true ? Center(
                                            child: Container(
                                              height: 20,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius: BorderRadius.circular(ScreenUtil.getFiveSize(context))
                                              ),
                                              padding: EdgeInsets.only(left: ScreenUtil.getFiveSize(context),right: ScreenUtil.getFiveSize(context)),
                                              child: Text("SOLD",style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w500),),
                                            ),
                                          ) : null
                                        ),
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
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  AppText(
                                                    text: favCars[index].price,
                                                    size: 20,
                                                  ),
                                                  AppText(
                                                    text: favCars[index].year,
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
                                                    topRight: Radius.circular(10),
                                                    bottomRight: Radius.circular(10)),
                                                color: Colors.blue),
                                            child: Center(
                                              child: Icon(
                                                Icons.arrow_forward_ios_rounded,
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
                            )
                          );
                        },
                      ));
                }
                else{
                  return Center(
                    child: Text("Something unexpected Happened"),
                  );
                }

              },
            )));
  }
}
