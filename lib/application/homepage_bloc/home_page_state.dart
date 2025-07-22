import 'package:dartz/dartz.dart';
import '../../domain/model/usedcar_model.dart';
import '../../domain/failures/main_failure.dart';

class HomePageState {
  final bool isLoading;
  final List<UsedCarModel> usedCarModel;
  final Option<Either<MainFailure, List<UsedCarModel>>> homePageFailureOptions;

  HomePageState({
    required this.isLoading,
    required this.usedCarModel,
    required this.homePageFailureOptions,
  });

  factory HomePageState.initial() {
    return HomePageState(
      isLoading: false,
      usedCarModel: [],
      homePageFailureOptions: None(),
    );
  }

  HomePageState copyWith({
    bool? isLoading,
    List<UsedCarModel>? usedCarModel,
    Option<Either<MainFailure, List<UsedCarModel>>>? homePageFailureOptions,
  }) {
    return HomePageState(
      isLoading: isLoading ?? this.isLoading,
      usedCarModel: usedCarModel ?? this.usedCarModel,
      homePageFailureOptions: homePageFailureOptions ?? this.homePageFailureOptions,
    );
  }
}
