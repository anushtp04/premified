part of 'favourite_page_bloc.dart';

@freezed
class FavouritePageState with _$FavouritePageState {
  const factory FavouritePageState({
    required bool isLoading,
    required List<UsedCarModel> usedCarModel,
    required Option<Either<MainFailure, List<UsedCarModel>>> favPageFailureOptions,
}) = _FavouritePageState;
  
  factory FavouritePageState.initial(){
    return const FavouritePageState(isLoading: false,usedCarModel: [], favPageFailureOptions: None());
  }
}
