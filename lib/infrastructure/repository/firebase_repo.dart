
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:used_car_app/domain/entities/usedcar_entity.dart';
import 'package:used_car_app/domain/model/usedcar_model.dart';

class FirebaseRepo  {
  final usedCarCollection = FirebaseFirestore.instance.collection("usedCar");


  Stream<List<UsedCarModel>> getUsedCars() {
    try {
      return usedCarCollection.snapshots().map((querySnapshot) => querySnapshot.docs.map((e) =>
          UsedCarModel.fromEntity(UsedCarEntity.fromDocument(e.data()))).toList());
    } catch (err) {
      print("the issue is  ${err.toString()}");
      rethrow;
    }
  }

}






