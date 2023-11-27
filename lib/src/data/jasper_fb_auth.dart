import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class JasperFBAuth {
  static User? user;

  static Future<User?> signInAnonymously() async {
    user = null;
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      debugPrint('Firebase Auth: User signed in with anonymous account.');
      user = userCredential.user;
      debugPrint('Firebase Auth: User ID is ${user?.uid ?? 'Null'}.');
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          debugPrint("Firebase Auth: Anonymous auth hasn't been enabled for this Firebase project.");
          break;
        default:
          debugPrint("Firebase Auth: Unknown error.");
      }
    }
    return user;
  }

  static signOut() async {
    await FirebaseAuth.instance.signOut();
    debugPrint('Firebase Auth: User is signed out.');
    user = null;
  }
}
