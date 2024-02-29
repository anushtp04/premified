import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../data/model/usedcar_model.dart';

const String USEDCAR_COLLECTION_REF = "usedCar";

class DatabaseService {
  final _fireStore = FirebaseFirestore.instance;

  late final CollectionReference _usedCarRef;

  DatabaseService() {
    _usedCarRef =
        _fireStore.collection(USEDCAR_COLLECTION_REF).withConverter<UsedCarModel>(
          fromFirestore: (snapshot, options) =>
              UsedCarModel.fromJson(snapshot.data()!),
          toFirestore: (value, options) =>value.toJson(),);
  }

  Stream<QuerySnapshot> getUsedCarData(){
    return _usedCarRef.snapshots();
  }
}