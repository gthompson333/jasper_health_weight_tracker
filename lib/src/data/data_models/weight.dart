import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jasper_health_weight_tracker/src/data/jasper_fb_auth.dart';
import 'package:intl/intl.dart';

/// Represents a single weight record from Cloud Firestore.
class Weight {
  final int weight;
  final DateTime timestamp;
  final String userID;
  final String documentRefID;

  /// Public interface.
  Weight(
      {required this.weight, required this.timestamp, required this.userID, required this.documentRefID});

  factory Weight.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> dataMap = snapshot.data() as Map<String, dynamic>;
    return Weight(
        weight: dataMap['weight'] as int,
        timestamp: (dataMap['timestamp'] as Timestamp).toDate(),
        userID: dataMap['userid'] as String,
        documentRefID: snapshot.reference.id,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'weight': weight,
      'userid': JasperFBAuth.user?.uid ?? '',
      'timestamp': timestamp,
    };
  }

  // Note: In a more complex app, this would be done in a view model layer.
  String formattedDateTime() {
    return DateFormat('MMMM dd yyyy hh:mm aaa').format(timestamp);
  }
}
