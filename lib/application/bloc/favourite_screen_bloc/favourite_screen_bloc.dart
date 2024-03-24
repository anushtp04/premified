import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:used_car_app/domain/model/usedcar_model.dart';

import '../../../infrastructure/repository/firebase_repo.dart';

part 'favourite_screen_event.dart';
part 'favourite_screen_state.dart';

class FavouriteScreenBloc extends Bloc<FavouriteScreenEvent, FavouriteScreenState> {
  StreamSubscription<List<UsedCarModel>>? _usedCarSubscription;


  FavouriteScreenBloc() : super(FavouriteScreenInitialState()) {

    on<FavouriteLoadedEvent>((event, emit) async {

      emit(FavouriteScreenLoadingState());

      try {
        await FirebaseRepo().fetchFavoriteCarsList().listen((favCar) {
          emit(FavouriteScreenLoadedState(favCars: favCar));
        }).asFuture();
      } catch (error) {
        emit(FavouriteScreenErrorState(error.toString()));
      }
    });
  }
  @override
  Future<void> close() async {
    // Ensure that the stream subscription is canceled before closing the bloc
    await _usedCarSubscription?.cancel();
    return super.close();
  }

}