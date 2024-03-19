import 'package:flutter/material.dart';
import 'package:used_car_app/domain/model/usedcar_model.dart';
import 'package:used_car_app/infrastructure/repository/firebase_repo.dart';

class SearchListTile extends StatelessWidget {
  final String title;
  final Function(String) onSelectionChanged;

  SearchListTile({
    Key? key,
    required this.title,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UsedCarModel>>(
      future: FirebaseRepo().getAllCars(),
      builder: (context, snapshot) {

          List<UsedCarModel>? selectItems = snapshot.data;


          Set<String> uniqueItems = Set();

          selectItems?.forEach((element) {
            if (title == "Make") {
              uniqueItems.add(element.brand);
            } else if (title == "Type") {
              uniqueItems.add(element.type);
            } else if (title == "Color") {
              uniqueItems.add(element.color);
            } else if (title == "Price") {
              uniqueItems.add(element.range.toString());
            }
          });

          return Card(
            child: Container(
              width: 180,
              child: DropdownMenu(
                width: 180,
                hintText: title,
                textStyle: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                ),
                onSelected: (String? value) {
                  onSelectionChanged(value ?? '');
                },
                dropdownMenuEntries: [
                DropdownMenuEntry(
                  value: "",
                  label: title,
                ),
                ...uniqueItems.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry(
                    value: value,
                    label: value,
                  );
                }),

              ]

              ),
            ),
          );
        }

    );
  }
}
