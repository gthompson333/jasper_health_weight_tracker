import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jasper_health_weight_tracker/src/ui/screens/sign_in_screen.dart';
import 'package:jasper_health_weight_tracker/src/ui/screens/user_weights_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          debugPrint('FirebaseAuth: User currently signed OUT.');
          return const SignInScreen();
        }
        debugPrint('FirebaseAuth: User currently signed IN.');
        return const UserWeightsScreen();
      },
    );
  }
}
