part of 'favourite_toggle_bloc.dart';

sealed class FavouriteToggleEvent extends Equatable {
  const FavouriteToggleEvent();
  @override
  List<Object?> get props => [];
}
class FavouriteTogglePressedEvent extends FavouriteToggleEvent{
  final UsedCarModel carmodel;
  const FavouriteTogglePressedEvent({required this.carmodel});
  @override
  List<Object?> get props => [carmodel];
}
class FetchFavoriteToggleEvent extends FavouriteToggleEvent {}
