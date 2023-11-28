import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jasper_health_weight_tracker/src/data/jasper_fb_auth.dart';
import 'data_models/weight.dart';

class JasperFSData {
  final weightsCollection = FirebaseFirestore.instance.collection("weights");

  Stream<QuerySnapshot> getWeights() {
    return weightsCollection
        .where("userid", isEqualTo: JasperFBAuth.user?.uid)
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  Future<DocumentReference> addWeight(Weight weight) {
    return weightsCollection.add(weight.toJson());
  }

  void updateWeight(Weight weight) async {
    await weightsCollection.doc(weight.documentRefID).update(weight.toJson());
  }

  void deleteWeight(Weight weight) async {
    await weightsCollection.doc(weight.documentRefID).delete();
  }
}
