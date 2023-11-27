import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class JasperFBAuth {
  static User? user;
  static Future<User?> signInAnonymously() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      debugPrint('User signed in with temporary anonymous account.');
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          debugPrint("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          debugPrint("Unknown error.");
      }
    }
    return user;
  }

  static signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}