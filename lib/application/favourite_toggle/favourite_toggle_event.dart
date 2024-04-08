part of 'favourite_toggle_bloc.dart';

@freezed
class FavouriteToggleEvent with _$FavouriteToggleEvent {
  const factory FavouriteToggleEvent.favClickedEvent({
    required UsedCarModel carmodel
}) = FavouriteClickedEvent;
}
