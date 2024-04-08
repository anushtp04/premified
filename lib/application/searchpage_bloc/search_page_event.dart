part of 'search_page_bloc.dart';

@freezed
class SearchPageEvent with _$SearchPageEvent {
  const factory SearchPageEvent.initialize() = Initialize;
  const factory SearchPageEvent.searchButtonClicked({String? name}) = SearchButtonClicked;
  const factory SearchPageEvent.filterButtonClicked({
    final String? brandId,
    final String? typeId,
    final String? colorId,
    final String? rangeId,}) = FilterButtonClicked;
}
