import 'package:dartz/dartz.dart';
import '../../domain/failures/main_failure.dart';
import '../../domain/model/usedcar_model.dart';

class SearchPageState {
  final bool isLoading;
  final bool isError;
  final List<UsedCarModel> usedCarModel;
  final Option<Either<MainFailure, List<UsedCarModel>>> searchFailureOptions;

  SearchPageState({
    required this.isLoading,
    required this.isError,
    required this.usedCarModel,
    required this.searchFailureOptions,
  });

  factory SearchPageState.initial() {
    return SearchPageState(
      isLoading: true,
      isError: false,
      usedCarModel: [],
      searchFailureOptions: None(),
    );
  }

  SearchPageState copyWith({
    bool? isLoading,
    bool? isError,
    List<UsedCarModel>? usedCarModel,
    Option<Either<MainFailure, List<UsedCarModel>>>? searchFailureOptions,
  }) {
    return SearchPageState(
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      usedCarModel: usedCarModel ?? this.usedCarModel,
      searchFailureOptions: searchFailureOptions ?? this.searchFailureOptions,
    );
  }
}
