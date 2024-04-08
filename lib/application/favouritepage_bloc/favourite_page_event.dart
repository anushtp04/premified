part of 'favourite_page_bloc.dart';

@freezed
class FavouritePageEvent with _$FavouritePageEvent {
  const factory FavouritePageEvent.fetchFavCarList() = FetchFavCarList;
}
