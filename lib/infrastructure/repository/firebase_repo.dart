import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:used_car_app/domain/model/usedcar_model.dart';

class FirebaseRepo {
  final usedCarCollection = FirebaseFirestore.instance.collection("usedCar");

  Stream<List<UsedCarModel>> getUsedCars() {
    try {
      return usedCarCollection.snapshots().map((querySnapshot) => querySnapshot
          .docs
          .map((e) => UsedCarModel.fromDocument(e.data()))
          .toList());
    } catch (err) {
      print("the issue is  ${err.toString()}");
      rethrow;
    }
  }

  Future<List<UsedCarModel>> getAllCars() async {
    try {
      QuerySnapshot querySnapshot = await usedCarCollection.get();
      return querySnapshot.docs
          .map((doc) =>
              UsedCarModel.fromDocument(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (err) {
      print("the issue is  ${err.toString()}");
      rethrow;
    }
  }

  Future<bool> toggleFavoriteStatus(UsedCarModel carmodel) async {
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
        return false;
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
        return true;
      }
    } else {
      return true;
    }
  }


  Stream<List<UsedCarModel>> fetchFavoriteCarsList() {
    User? user = FirebaseAuth.instance.currentUser;
        final favouriteRef = FirebaseFirestore.instance.collection('favouriteCars').doc(user?.uid).collection('favorite_cars');
    try {
      return favouriteRef.snapshots().map((querySnapshot) => querySnapshot
          .docs
          .map((e) => UsedCarModel.fromDocument(e.data()))
          .toList());

    } catch (err) {
      print("the issue is  ${err.toString()}");
      rethrow;
    }
  }


  Future<List<String>> fetchFavoriteCars() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final snapshot = await FirebaseFirestore.instance
          .collection('favouriteCars')
          .doc(user.uid)
          .collection('favorite_cars')
          .get();
      return snapshot.docs.map((doc) => doc.id).toList();
    } else {
      return [];
    }
  }

  Future<List<UsedCarModel>> filterUsedCars({
    String? brand,
    String? type,
    String? color,
    String? range,
  }) async {
    try {
      QuerySnapshot querySnapshot = await usedCarCollection
          .where('brand', isEqualTo: brand)
          .where('type', isEqualTo: type)
          .where('color', isEqualTo: color)
          .where('range', isEqualTo: range)
          .get();

      List<UsedCarModel> filteredCars = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return UsedCarModel.fromDocument(data);
      }).toList();

      return filteredCars;
    } catch (error) {
      print("Error fetching filtered cars: $error");
      throw Exception('Failed to fetch filtered used cars: $error');
    }
  }
}
