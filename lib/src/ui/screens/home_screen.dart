import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jasper_health_weight_tracker/src/data/jasper_fb_auth.dart';
import 'package:jasper_health_weight_tracker/src/ui/screens/sign_in_screen.dart';
import 'package:jasper_health_weight_tracker/src/ui/screens/user_weights_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Listen for changes in Firebase auth.
    // When user signs in or out, show the appropriate screen.
    // Note: This is a very lightweight navigation scheme. A more complex
    // app would use a proper navigation router package.
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          debugPrint('Home Screen: User not signed in. Show Sign In screen.');
          return const SignInScreen();
        }

        debugPrint('Home Screen: User signed in. Show User Weights screen.');
        JasperFBAuth.user = FirebaseAuth.instance.currentUser;
        return const UserWeightsScreen();
      },
    );
  }
}
