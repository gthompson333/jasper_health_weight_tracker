import 'package:flutter/material.dart';
import '../../data/data_models/weight.dart';

class WeightCard extends StatelessWidget {
  final Weight weight;

  const WeightCard({super.key, required this.weight});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('${weight.weight}',
            style: Theme.of(context).textTheme.bodyLarge),
        trailing: Text(weight.formattedDateTime(),
            style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }
}
