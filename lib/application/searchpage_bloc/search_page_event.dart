abstract class SearchPageEvent {}

class Initialize extends SearchPageEvent {}

class SearchButtonClicked extends SearchPageEvent {
  final String? name;
  SearchButtonClicked({this.name});
}

class FilterButtonClicked extends SearchPageEvent {
  final String? brandId;
  final String? typeId;
  final String? colorId;
  final String? rangeId;
  FilterButtonClicked({this.brandId, this.typeId, this.colorId, this.rangeId});
}
