import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:used_car_app/application/bloc/search_page_bloc/search_page_bloc.dart';
import 'package:used_car_app/core/secondary_appbar.dart';
import 'package:used_car_app/presentation/search_page/widgets/search_list_tile.dart';
import 'package:used_car_app/presentation/widgets/text_style.dart';
import '../details_page/details_page.dart';

class SearchPageBackup extends StatelessWidget {
  SearchPageBackup({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<SearchPageBloc>(context).add(SearchPageInitialEvent());
      },
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: SecondaryAppBar(title: "Search"),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SearchListTile(
                      title: "Make",
                      onSelectionChanged: (value) =>
                          handleSelectionChange("Make", value),
                    ),
                    SearchListTile(
                      title: "Type",
                      onSelectionChanged: (value) =>
                          handleSelectionChange("Type", value),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SearchListTile(
                      title: "Color",
                      onSelectionChanged: (value) =>
                          handleSelectionChange("Color", value),
                    ),
                    SearchListTile(
                      title: "Price",
                      onSelectionChanged: (value) =>
                          handleSelectionChange("Price", value),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  height:50,
                  minWidth: double.infinity,
                  color: Colors.blue.shade900,
                  child: const Text(
                    "Search",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {
                    context.read<SearchPageBloc>().add(SearchPageClickedEvent(
                          brandId:
                              selectedMake.isNotEmpty ? selectedMake : null,
                          typeId:
                              selectedType.isNotEmpty ? selectedType : null,
                          colorId:
                              selectedColor.isNotEmpty ? selectedColor : null,
                          rangeId:
                              selectedPrice.isNotEmpty ? selectedPrice : null,
                        ));
                  },
                )
              ],
            ),
            SizedBox(
              height: 17,
            ),
            Expanded(
              child: BlocBuilder<SearchPageBloc, SearchPageState>(
                builder: (context, state) {
                  if(state is SearchPageLoadingState){
                    return Center(
                      child: CircularProgressIndicator(color: Colors.blue.shade900,),
                    );
                  }
                 else if(state is SearchPageNoDataState){
                   selectedMake = "";
                   selectedColor = "";
                   selectedType = "";
                   selectedPrice = "";
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(text: "Your Search Results will be shown here",size: 18,),
                          Lottie.asset("assets/searching.json"),
                        ],
                      ),
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
              )
            ),
          ],
        ),
      )
    );
  }

String selectedMake = '';
String selectedType = '';
String selectedColor = '';
String selectedPrice = '';

void handleSelectionChange(String title, String selectedValue) {
  // Update selected value based on the title
  if (title == 'Make') {
    selectedMake = selectedValue;
  } else if (title == 'Type') {
    selectedType = selectedValue;
  } else if (title == 'Color') {
    selectedColor = selectedValue;
  } else if (title == 'Price') {
    selectedPrice = selectedValue;
  }
}
}
