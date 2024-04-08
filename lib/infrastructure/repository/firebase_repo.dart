import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:used_car_app/domain/i_firebase_repo.dart';
import 'package:used_car_app/domain/model/usedcar_model.dart';

import '../../domain/failures/main_failure.dart';

@LazySingleton(as: IFirebaseRepo)
class FirebaseRepo implements IFirebaseRepo {
  final usedCarCollection = FirebaseFirestore.instance.collection("usedCar");

  ///for homepage
  @override
  Future<Either<MainFailure, List<UsedCarModel>>> getUsedCars() async {
    try {
      QuerySnapshot querySnapshot = await usedCarCollection.get();
      final getUsedCars = querySnapshot.docs
          .map((doc) =>
              UsedCarModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      if (getUsedCars.isNotEmpty) {
        return Right(getUsedCars);
      } else {
        return Left(MainFailure.serverFailure());
      }
    } catch (err) {
      print("the issue is  ${err.toString()}");
      return Left(MainFailure.clientFailure());
    }
  }

  ///for searchPage
  @override
  Future<Either<MainFailure, List<UsedCarModel>>> filterSearchUsedCars({String? brand, String? type, String? color, String? range}) async {
    try {
      QuerySnapshot querySnapshot = await usedCarCollection
          .where('brand', isEqualTo: brand)
          .where('type', isEqualTo: type)
          .where('color', isEqualTo: color)
          .where('range', isEqualTo: range)
          .get();

      final filteredCars = querySnapshot.docs
          .map((doc) =>
              UsedCarModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      if (filteredCars.isNotEmpty) {
        return Right(filteredCars);
      } else {
        print("Error fetching filtered cars");
        return Left(MainFailure.serverFailure());
      }
    } catch (error) {
      print("Error fetching filtered cars: $error");
      return Left(MainFailure.clientFailure());
    }
  }

  ///for searchPage
  @override
  Future<Either<MainFailure, List<UsedCarModel>>> searchSingleUsedCar({String? name}) async {
    try {
      QuerySnapshot querySnapshot = await usedCarCollection.get();

      final searchSingleCar = querySnapshot.docs
          .map((doc) =>
              UsedCarModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      // Perform client-side filtering to find partial matches
      final searchedCars =
          searchSingleCar.where((car) => car.name.contains(name!)).toList();
      if (searchedCars.isNotEmpty) {
        return Right(searchedCars);
      } else {
        return Left(MainFailure.serverFailure());
      }
    } catch (error) {
      print("Error fetching filtered cars: $error");
      return Left(MainFailure.clientFailure());
    }
  }



  ///for favouritepage toggle
  @override
  Future<Either<MainFailure, bool>> toggleFavoriteStatus(UsedCarModel carmodel) async{
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final favoriteRef = FirebaseFirestore.instance
          .collection('favouriteCars')
          .doc(user.uid)
          .collection('favorite_cars')
          .doc(carmodel.id);
      final isFavorite = await favoriteRef.get().then((doc) => doc.exists);
      if (isFavorite) {
        await favoriteRef.delete();
        return Right(false);
      } else {
        // Add to favorites
        await favoriteRef.set({
          'name': carmodel.name,
          'year': carmodel.year,
          'price': carmodel.price,
          'image': carmodel.image,
          "id" :  carmodel.id,
          "brand": carmodel.brand,
          "color": carmodel.color,
          "front": carmodel.front,
          "back": carmodel.back,
          "side1": carmodel.side1,
          "side2": carmodel.side2,
          "inside": carmodel.inside,
          "kilometers": carmodel.kilometers,
          "fuel": carmodel.fuel,
          "state": carmodel.state,
          "ownership": carmodel.ownership,
          "type": carmodel.type,
          "range": carmodel.range,
          "sold": carmodel.sold

          // Add other car details as needed
        });
        return Right(true);
      }
    } else {
      return Left(MainFailure.clientFailure());
    }
  }



  ///for favourite page

  @override
  Stream<Either<MainFailure,List<UsedCarModel>>> favoriteCarsList() {
    User? user = FirebaseAuth.instance.currentUser;
    final favouriteRef = FirebaseFirestore.instance.collection('favouriteCars').doc(user?.uid).collection('favorite_cars');
    try {
      return favouriteRef.snapshots().map((querySnapshot) => querySnapshot.docs
          .map((doc) => UsedCarModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList())
          .map((favCarList) => favCarList.isNotEmpty
          ? Right(favCarList)
          : Left(MainFailure.serverFailure()));

    } catch (err) {
      print("the issue is  ${err.toString()}");
      rethrow;
    }
  }


  @override
  Stream<List<UsedCarModel>> usedCarsList() {
    try {
      return usedCarCollection.snapshots().map((querySnapshot) => querySnapshot
          .docs
          .map((e) => UsedCarModel.fromJson(e.data()))
          .toList());
    } catch (err) {
      print("the issue is  ${err.toString()}");
      rethrow;
    }
  }



}
