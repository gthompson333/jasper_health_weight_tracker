import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../data/jasper_auth.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Jasper Health Weight Tracker'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              User? user = await JasperAuth.signInAnonymously();

              if (user != null) {
                debugPrint('User successfully signed in: $user');
              }
            },
            child: const Text(
              'Sign In',
            ),
          ),
        ));
  }
}
