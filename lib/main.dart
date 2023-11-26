import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:jasper_health_weight_tracker/src/ui/screens/weight_list.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const WeightList());
  }
}
