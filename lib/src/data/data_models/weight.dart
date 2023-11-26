import 'package:cloud_firestore/cloud_firestore.dart';

class Weight {
  late final int weight;
  late final DateTime date;
  String? referenceId;

  Weight({required this.weight, required this.date});

  factory Weight.fromSnapshot(DocumentSnapshot snapshot) {
    final newWeight = Weight.fromJson(snapshot.data() as Map<String, dynamic>);
    newWeight.referenceId = snapshot.reference.id;
    return newWeight;
  }

  factory Weight.fromJson(Map<String, dynamic> json) => _weightFromJson(json);
  Map<String, dynamic> toJson() => _weightToJson(this);
}

Weight _weightFromJson(Map<String, dynamic> json) {
  return Weight(
    weight: json['weight'] as int,
    date: (json['date'] as Timestamp).toDate(),
  );
}

Map<String, dynamic> _weightToJson(Weight instance) => <String, dynamic>{
      'vaccination': instance.weight,
      'date': instance.date,
    };
