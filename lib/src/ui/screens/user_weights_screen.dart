import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/data_models/weight.dart';
import '../../data/jasper_fs_data.dart';
import '../widgets/weight_card.dart';

class UserWeightsScreen extends StatefulWidget {
  const UserWeightsScreen({super.key});

  @override
  UserWeightsScreenState createState() => UserWeightsScreenState();
}

class UserWeightsScreenState extends State<UserWeightsScreen> {
  final JasperFSData repository = JasperFSData();

  @override
  Widget build(BuildContext context) {
    return _buildWeightList(context);
  }

  Widget _buildWeightList(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weights'),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: repository.getStream(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const LinearProgressIndicator();

            return _buildList(context, snapshot.data?.docs ?? []);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Weight',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildItem(context, data)).toList(),
    );
  }

  Widget _buildItem(BuildContext context, DocumentSnapshot snapshot) {
    final weight = Weight.fromSnapshot(snapshot);
    return WeightCard(weight: weight);
  }
}
