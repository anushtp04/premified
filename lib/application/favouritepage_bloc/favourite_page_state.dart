import 'package:dartz/dartz.dart';
import '../../domain/model/usedcar_model.dart';
import '../../domain/failures/main_failure.dart';

class FavouritePageState {
  final bool isLoading;
  final List<UsedCarModel> usedCarModel;
  final Option<Either<MainFailure, List<UsedCarModel>>> favPageFailureOptions;

  FavouritePageState({
    required this.isLoading,
    required this.usedCarModel,
    required this.favPageFailureOptions,
  });

  factory FavouritePageState.initial() {
    return FavouritePageState(
      isLoading: false,
      usedCarModel: [],
      favPageFailureOptions: None(),
    );
  }

  FavouritePageState copyWith({
    bool? isLoading,
    List<UsedCarModel>? usedCarModel,
    Option<Either<MainFailure, List<UsedCarModel>>>? favPageFailureOptions,
  }) {
    return FavouritePageState(
      isLoading: isLoading ?? this.isLoading,
      usedCarModel: usedCarModel ?? this.usedCarModel,
      favPageFailureOptions: favPageFailureOptions ?? this.favPageFailureOptions,
    );
  }
}
