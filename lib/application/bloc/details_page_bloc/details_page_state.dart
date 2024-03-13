part of 'details_page_bloc.dart';

abstract class DetailsPageState extends Equatable {
  const DetailsPageState();
  @override
  List<Object> get props => [];
}

class DetailsPageInitial extends DetailsPageState {}

class DetailsPageLoading extends DetailsPageState {}
class DetailsPageLoaded extends  DetailsPageState {
  final UsedCarModel usedcars;

  const DetailsPageLoaded({required this.usedcars});
  @override
  List<Object> get props => [usedcars];
}
class DetailsPageError extends DetailsPageState {}
