part of 'search_page_bloc.dart';

abstract class SearchPageEvent extends Equatable {
  const SearchPageEvent();
  @override
  List<Object?> get props => [];


}
class SearchPageInitialEvent extends SearchPageEvent{}


class SearchPageClickedEvent extends SearchPageEvent{
  final String? brandId;
  final String? typeId;
  final String? colorId;
  final String? rangeId;

  const SearchPageClickedEvent({this.brandId, this.typeId, this.colorId, this.rangeId});
  @override
  List<Object?> get props => [brandId, typeId, colorId, rangeId];

}
