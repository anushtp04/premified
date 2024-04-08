part of 'home_page_bloc.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState({
    required bool isLoading,
    required List<UsedCarModel> usedCarModel,
    required Option<Either<MainFailure, List<UsedCarModel>>> homePageFailureOptions,
}) = _HomePageState;

  factory HomePageState.initial(){
    return const HomePageState(isLoading: false, homePageFailureOptions: None(),usedCarModel: []);
  }
}
