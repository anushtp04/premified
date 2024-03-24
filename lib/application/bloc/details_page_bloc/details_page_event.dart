part of 'details_page_bloc.dart';

abstract class DetailsPageEvent extends Equatable {
  const DetailsPageEvent();
  @override
  List<Object> get props => [];

}

class NavigateBackEvent extends DetailsPageEvent{}

class ToggleFavoriteEvent extends DetailsPageEvent {
  final UsedCarModel carmodel;

  ToggleFavoriteEvent({required this.carmodel});
}
class FetchFavoriteEvent extends DetailsPageEvent {}