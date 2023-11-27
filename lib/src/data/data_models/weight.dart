import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jasper_health_weight_tracker/src/data/jasper_fb_auth.dart';

/// Represents a single weight record from Cloud Firestore.
class Weight {
  late final int weight;
  late final DateTime timestamp;
  String userid;

  /// Public interface.
  Weight({required this.weight, required this.timestamp, required this.userid});

  factory Weight.fromSnapshot(DocumentSnapshot snapshot) {
    return Weight.fromJson(snapshot.data() as Map<String, dynamic>);
  }

  factory Weight.fromJson(Map<String, dynamic> json) => _weightFromJson(json);

  Map<String, dynamic> toJson() => _weightToJson(this);
}

// Private interface.
Weight _weightFromJson(Map<String, dynamic> json) {
  return Weight(
    weight: json['weight'] as int,
    timestamp: (json['timestamp'] as Timestamp).toDate(),
    userid: json['userid'] as String,
  );
}

// Use the currently signed-in user id to send back up to Firestore when creating a new weight record.
// This value is nullable, but in reality should never be null since the user is always signed in.
Map<String, dynamic> _weightToJson(Weight instance) => <String, dynamic>{
      'weight': instance.weight,
      'userid': JasperFBAuth.user?.uid ?? '',
      'timestamp': instance.timestamp,
    };
