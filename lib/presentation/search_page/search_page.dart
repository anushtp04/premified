import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:used_car_app/application/bloc/search_page_bloc/search_page_bloc.dart';
import 'package:used_car_app/core/secondary_appbar.dart';
import 'package:used_car_app/presentation/search_page/widgets/search_textfields.dart';
import 'package:used_car_app/presentation/search_page/widgets/showModalBottomWidget.dart';
import 'package:used_car_app/presentation/widgets/text_style.dart';
import '../details_page/details_page.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<SearchPageBloc>(context).add(SearchPageInitialEvent());
      },
    );

    TextEditingController searchController = TextEditingController();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: SecondaryAppBar(title: "Search"),
        body: Container(
          margin: EdgeInsets.all(10),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      child: SearchTextField(
                    controller: searchController,
                    hintText: "Search Here",
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    suffixIcon: IconButton(
                        onPressed: () {
                          var searchCar = searchController.text.toUpperCase();
                          context.read<SearchPageBloc>().add(
                              SearchButtonClickedEvent(
                                  name: searchCar));
                        },
                        icon: Icon(Icons.search)),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  MaterialButton(
                    height: 55,
                    minWidth: 60,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Theme.of(context).colorScheme.primary,
                    child: Icon(Icons.filter_alt),
                    onPressed: () {
                      showModalBottomSheet(context: context, builder: (context) {
                        return ShowModalBottomWidget();
                      },);
                    },
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Expanded(
                child: BlocBuilder<SearchPageBloc, SearchPageState>(
                    builder: (context, state) {
                      if(state is SearchPageLoadingState){
                        return Center(
                          child: CircularProgressIndicator(color: Colors.blue.shade900,),
                        );
                      }
                      else if(state is SearchPageNoDataState){
                        return Center(
                          child: Container(
                            height: 200,
                              width: 200,
                              child: RiveAnimation.asset("assets/searching.riv",fit: BoxFit.fill,)),
                        );
                      }
                      else if (state is SearchPageLoadedState) {
                        return ListView.builder(
                            itemCount: state.usedCars.length,
                            // Assuming usedCars is a list of UsedCarModel
                            itemBuilder: (context, index) {
                              final car = state.usedCars[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            UsedCarDetailPage(carmodel: car),
                                      ));
                                },
                                child: Card(
                                  child: Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).colorScheme.primary,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: 150,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.contain,
                                                    image: NetworkImage(
                                                        car.image))),
                                            child: car.sold == true
                                                ? Center(
                                              child: Container(
                                                height: 20,
                                                decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        5)),
                                                padding: EdgeInsets.only(
                                                    left:
                                                    5,
                                                    right:
                                                    5),
                                                child: const Text(
                                                  "SOLD",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white,
                                                      fontWeight:
                                                      FontWeight.w500),
                                                ),
                                              ),
                                            )
                                                : null),
                                        SizedBox(
                                          width:
                                          200,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              AppText(
                                                text: car.name,
                                                color: Colors.grey.shade700,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  AppText(
                                                    text: car.price,
                                                    size: 20,
                                                  ),
                                                  AppText(
                                                    text: car.year,
                                                    color: Colors.grey.shade700,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }


                        );
                      }

                      else {
                        return const Center(
                          child: Text("Something unexpected happend"),
                        );
                      }
                    }
                ),
              ),
            ],
          ),
        ));
  }
}
