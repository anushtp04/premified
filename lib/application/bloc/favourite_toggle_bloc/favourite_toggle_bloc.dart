import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:used_car_app/domain/model/usedcar_model.dart';

import '../../../infrastructure/repository/firebase_repo.dart';

part 'favourite_toggle_event.dart';
part 'favourite_toggle_state.dart';

class FavouriteToggleBloc extends Bloc<FavouriteToggleEvent, FavouriteToggleState> {
  FavouriteToggleBloc() : super(FavouriteToggleInitial()) {
    on<FavouriteTogglePressedEvent>((event, emit) async{
      try {
      final isFavourite =  await FirebaseRepo().toggleFavoriteStatus(event.carmodel);
        final favoriteCars = await FirebaseRepo().fetchFavoriteCars();

        emit(FavouriteToggleChangedState(isFavourite: isFavourite));

        emit(FavouriteToggleLoadedState(favoriteCars: favoriteCars));

      } catch (error) {
       emit(FavouriteToggleErrorState());
      }
    });
    on<FetchFavoriteToggleEvent>((event, emit) async {

      try {
        final favoriteCars = await FirebaseRepo().fetchFavoriteCars();


        emit(FavouriteToggleLoadedState(favoriteCars: favoriteCars));

      } catch (error) {
        emit(FavouriteToggleErrorState());
      }
    });

  }
}
