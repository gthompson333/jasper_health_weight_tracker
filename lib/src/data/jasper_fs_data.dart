import 'package:cloud_firestore/cloud_firestore.dart';
import 'data_models/weight.dart';

class JasperFSData {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('weights');

  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }

  Future<DocumentReference> addWeight(Weight weight) {
    return collection.add(weight.toJson());
  }

  void updateWeight(Weight weight) async {
    //await collection.doc(weight.referenceId).update(weight.toJson());
  }

  void deleteweight(Weight weight) async {
    //await collection.doc(weight.referenceId).delete();
  }
}
