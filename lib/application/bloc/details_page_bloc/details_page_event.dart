part of 'details_page_bloc.dart';

abstract class DetailsPageEvent extends Equatable {
  const DetailsPageEvent();
  @override
  List<Object> get props => [];

}
class DetailsPageLoadEvent extends DetailsPageEvent{
  final UsedCarModel carmodel;
  DetailsPageLoadEvent({required this.carmodel});

  @override
  List<Object> get props => [carmodel];
}

class NavigateBackEvent extends DetailsPageEvent{}

class ToggleFavoriteEvent extends DetailsPageEvent {
  final UsedCarModel carmodel;

  ToggleFavoriteEvent({required this.carmodel});
}