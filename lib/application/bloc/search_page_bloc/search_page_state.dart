part of 'search_page_bloc.dart';

abstract class SearchPageState extends Equatable {
  const SearchPageState();
  @override
  List<Object> get props => [];
}

class SearchPageInitialState extends SearchPageState {
}
class SearchPageLoadingState extends SearchPageState {}
class SearchPageNoDataState extends SearchPageState {}
class SearchPageLoadedState extends SearchPageState {
 final List<UsedCarModel> usedCars;

 const SearchPageLoadedState(this.usedCars);
 @override
 List<Object> get props => [usedCars];
}

class SearchPageErrorState extends SearchPageState {
  final String message;
  SearchPageErrorState({required this.message});
}
