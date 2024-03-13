import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:used_car_app/application/bloc/search_page_bloc/search_page_bloc.dart';
import 'package:used_car_app/core/sizes.dart';
import 'package:used_car_app/presentation/search_page/widgets/search_list_tile.dart';
import 'package:used_car_app/presentation/widgets/text_style.dart';
import '../details_page/detailsPage.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  String selectedMake = '';
  String selectedType = '';
  String selectedColor = '';
  String selectedPrice = '';

  // List<UsedCarModel> filteredCars = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(onPressed: () {
              context.read<SearchPageBloc>().add(SearchPageResetEvent());
            }, child: Text("Reset",style: TextStyle(color: Colors.blue.shade900),))
          ],
          centerTitle: true,
          title: AppText(
            text: "Search",
            size: ScreenUtil.getTwentyTwoSize(context),
          ),
          leading: Container(
              width: ScreenUtil.getFifty(context),
              margin: EdgeInsets.all(11),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(ScreenUtil.getTenSize(context)),
                  color: Colors.white),
              child: Icon(
                Icons.keyboard_arrow_down_sharp,
                color: Colors.black,
                size: ScreenUtil.getTwentyEightSize(context),
              )),
        ),
        body: BlocBuilder<SearchPageBloc, SearchPageState>(
          builder: (context, state) {
            if (state is SearchPageLoadingState) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            }
            else if(state is SearchPageResetState){
              return Container(
                height: double.infinity,
                width: double.infinity,
                margin: EdgeInsets.all(ScreenUtil.getTenSize(context)),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: ScreenUtil.getSevenSize(context),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SearchListTile(
                              selectItems: state.usedCars,
                              title: "Make",
                              onSelectionChanged: (value) =>
                                  handleSelectionChange("Make", value),
                              selectedValue: selectedMake,
                            ),
                            SearchListTile(
                              selectItems: state.usedCars,
                              title: "Type",
                              onSelectionChanged: (value) =>
                                  handleSelectionChange("Type", value),
                              selectedValue: selectedType,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SearchListTile(
                              selectItems: state.usedCars,
                              title: "Color",
                              onSelectionChanged: (value) =>
                                  handleSelectionChange("Color", value),
                              selectedValue: selectedColor,
                            ),
                            SearchListTile(
                              selectItems: state.usedCars,
                              title: "Price",
                              onSelectionChanged: (value) =>
                                  handleSelectionChange("Price", value),
                              selectedValue: selectedPrice,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: ScreenUtil.getTenSize(context),
                        ),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          height: ScreenUtil.getFifty(context),
                          minWidth: double.infinity,
                          color: Colors.blue.shade900,
                          child: Text(
                            "Search",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          onPressed: () {
                            context.read<SearchPageBloc>().add(SearchPageClickedEvent(
                              brandId: selectedMake.isNotEmpty ? selectedMake : null,
                              typeId: selectedType.isNotEmpty ? selectedType : null,
                              colorId: selectedColor.isNotEmpty ? selectedColor : null,
                              rangeId: selectedPrice.isNotEmpty ? selectedPrice : null,
                            ));

                          },

                        )
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil.getSeventeenSize(context),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount:state.usedCars.length ,
                        itemBuilder: (context, index) {
                          final car = state.usedCars[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => UsedCarDetailPage(carmodel: car),));
                            },
                            child: Card(
                              child: Container(
                                height: ScreenUtil.getHundredSize(context),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: 150,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.contain,
                                                image: NetworkImage(car.image))),
                                        child: car.sold == true
                                            ? Center(
                                          child: Container(
                                            height: 20,
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                BorderRadius.circular(
                                                    ScreenUtil
                                                        .getFiveSize(
                                                        context))),
                                            padding: EdgeInsets.only(
                                                left:
                                                ScreenUtil.getFiveSize(
                                                    context),
                                                right:
                                                ScreenUtil.getFiveSize(
                                                    context)),
                                            child: Text(
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
                                    Container(
                                      width:
                                      ScreenUtil.getTwoHundredSize(context),
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
                        },
                      ),
                    ),
                  ],
                ),
              );;
            }
            if (state is SearchPageLoadedState) {
              return Container(
                height: double.infinity,
                width: double.infinity,
                margin: EdgeInsets.all(ScreenUtil.getTenSize(context)),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: ScreenUtil.getSevenSize(context),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SearchListTile(
                              selectItems: state.usedCars,
                              title: "Make",
                              onSelectionChanged: (value) =>
                                  handleSelectionChange("Make", value),
                              selectedValue: selectedMake,
                            ),
                            SearchListTile(
                              selectItems: state.usedCars,
                              title: "Type",
                              onSelectionChanged: (value) =>
                                  handleSelectionChange("Type", value),
                              selectedValue: selectedType,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SearchListTile(
                              selectItems: state.usedCars,
                              title: "Color",
                              onSelectionChanged: (value) =>
                                  handleSelectionChange("Color", value),
                              selectedValue: selectedColor,
                            ),
                            SearchListTile(
                              selectItems: state.usedCars,
                              title: "Price",
                              onSelectionChanged: (value) =>
                                  handleSelectionChange("Price", value),
                              selectedValue: selectedPrice,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: ScreenUtil.getTenSize(context),
                        ),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          height: ScreenUtil.getFifty(context),
                          minWidth: double.infinity,
                          color: Colors.blue.shade900,
                          child: Text(
                            "Search",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          onPressed: () {
                            context.read<SearchPageBloc>().add(SearchPageClickedEvent(
                              brandId: selectedMake.isNotEmpty ? selectedMake : null,
                              typeId: selectedType.isNotEmpty ? selectedType : null,
                              colorId: selectedColor.isNotEmpty ? selectedColor : null,
                              rangeId: selectedPrice.isNotEmpty ? selectedPrice : null,
                            ));
                          },

                        )
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil.getSeventeenSize(context),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount:state.usedCars.length ,
                        // Assuming usedCars is a list of UsedCarModel
                        itemBuilder: (context, index) {
                          final car = state.usedCars[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => UsedCarDetailPage(carmodel: car),));
                            },
                            child: Card(
                              child: Container(
                                height: ScreenUtil.getHundredSize(context),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: 150,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.contain,
                                                image: NetworkImage(car.image))),
                                        child: car.sold == true
                                            ? Center(
                                                child: Container(
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              ScreenUtil
                                                                  .getFiveSize(
                                                                      context))),
                                                  padding: EdgeInsets.only(
                                                      left:
                                                          ScreenUtil.getFiveSize(
                                                              context),
                                                      right:
                                                          ScreenUtil.getFiveSize(
                                                              context)),
                                                  child: Text(
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
                                    Container(
                                      width:
                                          ScreenUtil.getTwoHundredSize(context),
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
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
            else {
              return Center(
                child: Text("Error Occured"),
              );
            }
          },
        ));
  }

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
