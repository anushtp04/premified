import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:used_car_app/domain/model/usedcar_model.dart';
import 'package:used_car_app/infrastructure/repository/firebase_repo.dart';

part 'details_page_event.dart';

part 'details_page_state.dart';

class DetailsPageBloc extends Bloc<DetailsPageEvent, DetailsPageState> {

  StreamSubscription<List<UsedCarModel>>? _usedCarSubscription;

  DetailsPageBloc() : super(DetailsPageInitial()) {
    on<ToggleFavoriteEvent>((event, emit) async {

      try {
        final isFavourite =  await FirebaseRepo().toggleFavoriteStatus(event.carmodel);


        // emit(FavouriteIconColorState(isFavourite: isFavourite));

      } catch (error) {
        emit(DetailsPageError());
      }
    });
    // on<FetchFavoriteEvent>((event, emit) async {
    //
    //   try {
    //     final favoriteCars = await FirebaseRepo().fetchFavoriteCars();
    //
    //
    //     emit(FavoriteCarsLoadedState(favoriteCars: favoriteCars));
    //
    //   } catch (error) {
    //     emit(DetailsPageError());
    //   }
    // });

  }

  @override
  Future<void> close() async {
    // Ensure that the stream subscription is canceled before closing the bloc
    await _usedCarSubscription?.cancel();
    return super.close();
  }

}
