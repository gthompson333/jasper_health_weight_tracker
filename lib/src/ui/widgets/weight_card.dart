import 'package:flutter/material.dart';
import '../../data/data_models/weight.dart';

class WeightCard extends StatelessWidget {
  final Weight weight;
  final VoidCallback onDelete;

  const WeightCard({super.key, required this.weight, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(weight.documentRefID),
      onDismissed: (direction) {
        onDelete();
      },
      child: ListTile(
        title: Text('${weight.weight}',
            style: Theme.of(context).textTheme.bodyLarge),
        trailing: Text(weight.formattedDateTime(),
            style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }
}
