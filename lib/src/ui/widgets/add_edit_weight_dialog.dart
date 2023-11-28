import 'package:flutter/material.dart';
import 'package:jasper_health_weight_tracker/src/data/jasper_fb_auth.dart';
import '../../data/data_models/weight.dart';

class AddEditWeightDialog extends StatefulWidget {
  // If the weight param is non-null, it means we're editing an existing weight.
  final Weight? weight;
  final void Function(Weight weight) onSubmit;

  const AddEditWeightDialog({super.key, this.weight, required this.onSubmit});

  @override
  State<AddEditWeightDialog> createState() => _AddEditWeightDialogState();
}

class _AddEditWeightDialogState extends State<AddEditWeightDialog> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.weight == null ? 'New Weight' : 'Edit Weight'),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: TextFormField(
            initialValue: widget.weight != null
                ? '${widget.weight?.weight}'
                : 'Weight Value',
            onSaved: (String? value) {
              // Note: a production app would have much better input validation.
              if (value != null && value.isNotEmpty) {
                // We're creating a new weight entry.
                if (widget.weight == null) {
                  widget.onSubmit(Weight(
                      weight: int.parse(value),
                      timestamp: DateTime.now(),
                      userID: JasperFBAuth.user!.uid,
                      documentRefID: ''));
                } else {
                  // We're editing an existing weight entry.
                  widget.onSubmit(Weight(
                      weight: int.parse(value),
                      timestamp: widget.weight!.timestamp,
                      userID: widget.weight!.userID,
                      documentRefID: widget.weight!.documentRefID));
                }
              }

              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel')),
        ElevatedButton(
            onPressed: () {
              _formKey.currentState?.save();
            },
            child: const Text('Submit'))
      ],
    );
  }
}
