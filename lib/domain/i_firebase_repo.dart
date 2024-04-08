import 'package:dartz/dartz.dart';
import 'package:used_car_app/domain/failures/main_failure.dart';
import 'package:used_car_app/domain/model/usedcar_model.dart';

abstract class IFirebaseRepo {
  Future<Either<MainFailure, List<UsedCarModel>>> getUsedCars();

  Future<Either<MainFailure, List<UsedCarModel>>> filterSearchUsedCars({String? brand, String? type, String? color, String? range});

  Future<Either<MainFailure, List<UsedCarModel>>> searchSingleUsedCar({String? name});

  Future<Either<MainFailure, bool>> toggleFavoriteStatus(UsedCarModel carmodel);

  Stream<Either<MainFailure, List<UsedCarModel>>> favoriteCarsList();

  Stream<List<UsedCarModel>> usedCarsList();
// Future<Either<MainFailure,List<String>>> fetchFavoriteCars();
}
