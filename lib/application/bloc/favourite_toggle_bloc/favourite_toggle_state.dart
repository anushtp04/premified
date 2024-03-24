part of 'favourite_toggle_bloc.dart';

sealed class FavouriteToggleState extends Equatable {
  const FavouriteToggleState();
  @override
  List<Object> get props => [];
}

final class FavouriteToggleInitial extends FavouriteToggleState {}
final class FavouriteToggleChangedState extends FavouriteToggleState {
  final bool isFavourite;
  const FavouriteToggleChangedState({required this.isFavourite});
  @override
  List<Object> get props => [isFavourite];
}
class FavouriteToggleLoadedState extends FavouriteToggleState{
  final List<String> favoriteCars;

  const FavouriteToggleLoadedState({required this.favoriteCars});
}
final class FavouriteToggleErrorState extends FavouriteToggleState {}
