part of 'details_page_bloc.dart';

abstract class DetailsPageState extends Equatable {
  const DetailsPageState();
  @override
  List<Object> get props => [];
}

class DetailsPageInitial extends DetailsPageState {}

class FavouriteIconColorState extends DetailsPageState {
  final bool isFavourite;
  FavouriteIconColorState({required this.isFavourite});
  @override
  List<Object> get props => [isFavourite];

}
class FavoriteCarsLoadedState extends DetailsPageState {

}

class DetailsPageError extends DetailsPageState {}

