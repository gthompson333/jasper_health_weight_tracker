import 'package:flutter/material.dart';
import '../../data/jasper_fb_auth.dart';

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
              await JasperFBAuth.signInAnonymously();
            },
            child: const Text(
              'Sign In',
            ),
          ),
        ));
  }
}
