part of 'favourite_screen_bloc.dart';

abstract class FavouriteScreenState extends Equatable {
  const FavouriteScreenState();
  @override
  List<Object> get props => [];
}

class FavouriteScreenInitialState extends FavouriteScreenState {}
class FavouriteScreenLoadingState extends FavouriteScreenState {}
class FavouriteScreenLoadedState extends FavouriteScreenState {
  final List<UsedCarModel> favCars;
  FavouriteScreenLoadedState({required this.favCars});

  @override
  List<Object> get props => [favCars];
}
class FavouriteScreenErrorState extends FavouriteScreenState {
  final String errorMessage;

  const FavouriteScreenErrorState(this.errorMessage);
}
