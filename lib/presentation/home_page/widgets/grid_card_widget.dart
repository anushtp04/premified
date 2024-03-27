import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:used_car_app/application/bloc/favourite_toggle_bloc/favourite_toggle_bloc.dart';
import 'package:used_car_app/domain/model/usedcar_model.dart';
import 'package:used_car_app/presentation/settings_page/settings_page.dart';
import 'package:used_car_app/presentation/widgets/text_style.dart';

class GridCardWidget extends StatelessWidget {
  const GridCardWidget({
    super.key,
    required this.height,
    required this.usedcar,
  });

  final double height;
  final UsedCarModel usedcar;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
          (_) {
        BlocProvider.of<FavouriteToggleBloc>(context).add(FetchFavoriteToggleEvent());
      },
    );

    return Stack(
      children: [

        ValueListenableBuilder(
          valueListenable: isDarkMode,
          builder: (context, value, child) {
            return Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                  left: 9,
                  right: 9,
                  top: 5),
              //left 10 right 10 top 6
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(10),
                color: Theme
                    .of(context)
                    .colorScheme
                    .primary,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: 70),
                  Padding(
                    padding:
                    EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // height: height * 0.021,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(
                                5),
                          ),
                          padding: EdgeInsets.only(
                              left: 5,
                              right: 5),
                          // left 7 right 7
                          child: Text(
                            usedcar.price,
                            style: TextStyle(
                              fontSize: 12, //
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          usedcar.brand,
                          style: TextStyle(
                            fontSize:12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    usedcar.name,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${usedcar.kilometers} KM",
                          style: TextStyle(
                              fontSize: 12),
                        ),
                        AppText(
                          text: usedcar.year,
                          size: 12,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),

        Positioned(
            top: 3,
            right: 3,
            child: usedcar.sold == true
                ? Container(
              height: 17,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius:
                BorderRadius.circular(5),
              ),
              padding: EdgeInsets.only(
                  left: 5,
                  right: 5),
              child: Text(
                "SOLD",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize:12),
              ),
            )
                : BlocBuilder<FavouriteToggleBloc, FavouriteToggleState>(
              builder: (context, state) {
                if(state is FavouriteToggleLoadedState){
                  final favoriteCars = state.favoriteCars;
                  final isFavourite = favoriteCars.contains(usedcar.id);
                  return Icon(
                    IconlyBold.heart,
                    color: isFavourite? Colors.red : Colors.grey.shade300,
                    size: 20,
                  );
                }
                else{
                  return Icon(IconlyBold.heart,
                    color: Colors.grey,
                    size: 20);
                }

              },
            )
          // Placeholder for the "SOLD" label
        ),
        Padding(
          padding: EdgeInsets.only(
              left: 10,
              right:10),
          child: Container(
            width: double.infinity,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: NetworkImage(usedcar.image),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
