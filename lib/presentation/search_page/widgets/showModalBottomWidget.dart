import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:used_car_app/presentation/search_page/widgets/search_list_tile.dart';

import '../../../application/bloc/search_page_bloc/search_page_bloc.dart';

class ShowModalBottomWidget extends StatelessWidget {
   ShowModalBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

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
          SizedBox(height: 10,),
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
            height: 20,
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            height: 50,
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
              Navigator.pop(context);
            },
          )
        ],
      ),
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
