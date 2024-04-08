part of 'favourite_toggle_bloc.dart';

@freezed
class FavouriteToggleState with _$FavouriteToggleState {
  const factory FavouriteToggleState({

    required bool isFavourite,
    required Option<Either<MainFailure, bool>> favouriteToggleFailureOptions,

}) = _FavouriteToggleState;

  factory FavouriteToggleState.initial(){
    return FavouriteToggleState( isFavourite: false,favouriteToggleFailureOptions: None());
  }

}
