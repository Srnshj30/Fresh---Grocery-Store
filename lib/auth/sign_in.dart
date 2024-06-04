// import 'package:auth_buttons/auth_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:auth_buttons/auth_buttons.dart';
// import 'package:fresh_grocery_app/auth/auth_servies.dart';
import 'package:fresh_grocery_app/provider/user_provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of(context);
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

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/background.png'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 450,
              width: double.infinity,
              // color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Sign In to continue',
                    style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: Color.fromARGB(255, 127, 127, 127)),
                  ),
                  // const Text(
                  //   'Fresh',
                  //   style: TextStyle(
                  //     fontSize: 100,
                  //     color: Color.fromARGB(236, 42, 118, 108),
                  //     fontStyle: FontStyle.normal,
                  //     fontFamily: 'Great Vibes',
                  //     shadows: [
                  //       BoxShadow(
                  //         blurRadius: 19,
                  //         color: Color.fromARGB(220, 81, 228, 132),
                  //         offset: Offset(0, 0),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Image.asset("assets/logo.png"),
                  const SizedBox(
                    height: 5,
                  ),
                  GoogleAuthButton(
                    onPressed: () => signInWithGoogle(),
                  ),
                  const Column(
                    children: [
                      Text(
                        'By signing in you are agreeing to our',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(205, 132, 128, 128),
                        ),
                      ),
                      Text(
                        'Terms and Privacy Policy',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(205, 132, 128, 128),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
