import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:used_car_app/domain/model/usedcar_model.dart';

class FirebaseRepo {
  final usedCarCollection = FirebaseFirestore.instance.collection("usedCar");


  Stream<List<UsedCarModel>> getUsedCars() {
    try {
      return usedCarCollection.snapshots().map((querySnapshot) =>
          querySnapshot.docs.map((e) =>
              UsedCarModel.fromDocument(e.data()))
              .toList());
    } catch (err) {
      print("the issue is  ${err.toString()}");
      rethrow;
    }
  }
  Future<List<UsedCarModel>> getAllCars() async {
    try {
      QuerySnapshot querySnapshot = await usedCarCollection.get();
      return querySnapshot.docs.map((doc) => UsedCarModel.fromDocument(doc.data() as Map<String, dynamic>)).toList();
    } catch (err) {
      print("the issue is  ${err.toString()}");
      rethrow;
    }
  }

  Future<void> toggleFavoriteStatus(UsedCarModel carmodel) async {
    try {
      await usedCarCollection.doc(carmodel.id).update(
          {'isFavourite': !carmodel.isFavourite});

    } catch (e) {
      // Handle errors
      print("Error: $e");
    }
  }

  Future<List<UsedCarModel>>  filterUsedCars({
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
