import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:used_car_app/data/model/model_class.dart';

class FirestoreService {
  final CollectionReference _collectionReference =
  FirebaseFirestore.instance.collection("usedCar");

  final List<CarModel> favouriteCarList = [];


  Stream<List<CarModel>> getCarStream() {
    return _collectionReference.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((doc) {
          return CarModel.fromMap(doc.data() as Map<String, dynamic>);
        }).toList());
  }




}