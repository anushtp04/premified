part of 'favourite_screen_bloc.dart';

abstract class FavouriteScreenEvent extends Equatable {
  const FavouriteScreenEvent();
  @override
  List<Object?> get props => [];


}
class FavouriteLoadedEvent extends FavouriteScreenEvent{}
