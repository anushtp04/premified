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
    return StreamBuilder<List<UsedCarModel>>(
        stream: FirebaseRepo().usedCarsList(),
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
            child: DropdownMenu(
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: Theme.of(context).colorScheme.primary,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),

                contentPadding: EdgeInsets.all(10),

              ),
              width: 170,
              menuStyle: MenuStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
              ),
              hintText: title,
              textStyle: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
              ),
              onSelected: (String? value) {
                onSelectionChanged(value ?? '');
              },
              dropdownMenuEntries: uniqueItems.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry(
                  style: ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
                  value: value,
                  label: value,
                );
              }).toList(),


            ),
          );
        }

    );
  }
}