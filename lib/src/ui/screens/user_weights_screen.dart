import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/data_models/weight.dart';
import '../../data/jasper_fb_auth.dart';
import '../../data/jasper_fs_data.dart';
import '../widgets/add_edit_weight_dialog.dart';
import '../widgets/weight_card.dart';

class UserWeightsScreen extends StatefulWidget {
  const UserWeightsScreen({super.key});

  @override
  UserWeightsScreenState createState() => UserWeightsScreenState();
}

class UserWeightsScreenState extends State<UserWeightsScreen> {
  final JasperFSData jasperFSData = JasperFSData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            JasperFBAuth.signOut();
          },
        ),
        title: const Text('Weights'),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: jasperFSData.getWeights(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const LinearProgressIndicator();
            return _buildListView(context, snapshot.data?.docs ?? []);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) {
                return AddEditWeightDialog(onSubmit: (newWeight) {
                  jasperFSData.addWeight(newWeight);
                });
              });
        },
        tooltip: 'Add Weight',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildListView(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) {
        Weight weightItem = Weight.fromSnapshot(data);
        return InkWell(
          onTap: () {
            showDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return AddEditWeightDialog(
                      weight: weightItem,
                      onSubmit: (editedWeight) {
                        jasperFSData.updateWeight(editedWeight);
                      });
                });
          },
          child: WeightCard(
              weight: weightItem,
              onDelete: () async {
                jasperFSData.deleteWeight(weightItem);
              }),
        );
      }).toList(),
    );
  }
}
