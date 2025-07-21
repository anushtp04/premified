import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../domain/failures/main_failure.dart';
import '../../domain/i_firebase_repo.dart';
import '../../domain/model/usedcar_model.dart';
import 'favourite_page_event.dart';
import 'favourite_page_state.dart';

class FavouritePageBloc extends Bloc<FavouritePageEvent, FavouritePageState> {
  final IFirebaseRepo _firebaseRepo;
  StreamSubscription<List<UsedCarModel>>? _usedCarSubscription;


  FavouritePageBloc(this._firebaseRepo) : super(FavouritePageState.initial()) {

    on<FetchFavCarList>((event, emit) async {
      emit(FavouritePageState(isLoading: true, usedCarModel: [], favPageFailureOptions: None()));

      // final Either<MainFailure,
      //     List<UsedCarModel>> favPageOptions = await _firebaseRepo
      //     .fetchFavoriteCarsList();

      await _firebaseRepo.favoriteCarsList().listen((favPageOptions) {
        emit(
            favPageOptions.fold((failure) =>
                state.copyWith(
                    usedCarModel: [],
                    isLoading: false,
                    favPageFailureOptions: Some(Left(failure)),
                ), (success) =>
                state.copyWith(
                    favPageFailureOptions: Some(Right(success)),
                    isLoading: false,
                    usedCarModel: success,
                ))
        );
      }).asFuture();

    });
  }
  @override
  Future<void> close() async {
    // Ensure that the stream subscription is canceled before closing the bloc
    await _usedCarSubscription?.cancel();
    return super.close();
  }
}
