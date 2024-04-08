part of 'search_page_bloc.dart';

@freezed
class SearchPageState with _$SearchPageState {
  const factory SearchPageState({
    required bool isLoading,
    required bool isError,
    required List<UsedCarModel> usedCarModel,
    required Option<Either<MainFailure, List<UsedCarModel>>> searchFailureOptions,
}) = _SearchPageState;

  factory SearchPageState.initial(){
    return const SearchPageState(isLoading: true,usedCarModel: [], searchFailureOptions: None(),isError: false);
  }
}
