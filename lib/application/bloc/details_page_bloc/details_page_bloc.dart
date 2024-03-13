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
    on<DetailsPageLoadEvent>((event, emit) async {
      emit(DetailsPageLoading());
      try {
        // Wait for the stream subscription to complete before proceeding
        await FirebaseRepo().getUsedCars().listen(
          (usedCars) {
            final details =
                usedCars.firstWhere((cars) => cars.id == event.carmodel.id);

            emit(DetailsPageLoaded(usedcars: details));
          },
        ).asFuture();
      } catch (error) {
        emit(DetailsPageError());
      }
    });
    on<ToggleFavoriteEvent>((event, emit) async {

      try {
        // Wait for the stream subscription to complete before proceeding
      await FirebaseRepo().toggleFavoriteStatus(event.carmodel);
      final updatedCarModel = event.carmodel.copyWith(isFavourite: !event.carmodel.isFavourite);

      emit(DetailsPageLoaded(usedcars: updatedCarModel));
      } catch (error) {
        emit(DetailsPageError());
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
