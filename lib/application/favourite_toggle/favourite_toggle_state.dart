import 'package:dartz/dartz.dart';
import '../../domain/failures/main_failure.dart';

class FavouriteToggleState {
  final bool isFavourite;
  final Option<Either<MainFailure, bool>> favouriteToggleFailureOptions;

  FavouriteToggleState({
    required this.isFavourite,
    required this.favouriteToggleFailureOptions,
  });

  factory FavouriteToggleState.initial() {
    return FavouriteToggleState(
      isFavourite: false,
      favouriteToggleFailureOptions: None(),
    );
  }

  FavouriteToggleState copyWith({
    bool? isFavourite,
    Option<Either<MainFailure, bool>>? favouriteToggleFailureOptions,
  }) {
    return FavouriteToggleState(
      isFavourite: isFavourite ?? this.isFavourite,
      favouriteToggleFailureOptions: favouriteToggleFailureOptions ?? this.favouriteToggleFailureOptions,
    );
  }
}
