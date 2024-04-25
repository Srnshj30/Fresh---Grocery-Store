// ignore: avoid_web_libraries_in_flutter
import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import 'package:fresh_grocery_app/provider/user_provider.dart';

class AuthServies {
  UserProvider userProvider = Provider.of(context as BuildContext);
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: [
          'email',
        ],
      );

      final FirebaseAuth auth = FirebaseAuth.instance;

      final GoogleSignInAccount? gUser = await googleSignIn.signIn();

      final GoogleSignInAuthentication? gAuth = await gUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth?.accessToken,
        idToken: gAuth?.idToken,
      );
      User? user = (await auth.signInWithCredential(credential)).user;
      userProvider.addUserData(
        currentUser: user!,
        userName: user.displayName!,
        userEmail: user.email!,
        userImage: user.photoURL!,
      );
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }
}
