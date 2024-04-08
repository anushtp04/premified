import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/failures/main_failure.dart';
import '../../domain/i_firebase_repo.dart';
import '../../domain/model/usedcar_model.dart';

part 'favourite_toggle_event.dart';

part 'favourite_toggle_state.dart';

part 'favourite_toggle_bloc.freezed.dart';

@injectable
class FavouriteToggleBloc
    extends Bloc<FavouriteToggleEvent, FavouriteToggleState> {
  final IFirebaseRepo _firebaseRepo;

  FavouriteToggleBloc(this._firebaseRepo)
      : super(FavouriteToggleState.initial()) {
    on<FavouriteClickedEvent>((event, emit) async {


      final favToggleOption = await _firebaseRepo.toggleFavoriteStatus(
          event.carmodel);

      emit(
          favToggleOption.fold((failure) =>
              state.copyWith(
                  favouriteToggleFailureOptions: Some(Left(failure)),
                  isFavourite: false
              ), (success) =>
              state.copyWith(
                isFavourite: success,
                favouriteToggleFailureOptions: Some(Right(success)),

              ))
      );
    });

  }
}
