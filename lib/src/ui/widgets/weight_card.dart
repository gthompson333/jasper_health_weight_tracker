import 'package:flutter/material.dart';
import '../../data/data_models/weight.dart';

class WeightCard extends StatelessWidget {
  final Weight weight;

  const WeightCard({super.key, required this.weight});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Text('${weight.weight}'),
            ),
          ),
        ],
      ),
    ));
  }
}
