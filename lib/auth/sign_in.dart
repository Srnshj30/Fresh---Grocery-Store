// import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});
  @override
  Widget build(BuildContext context) {
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
            Container(
              height: 400,
              width: double.infinity,
              // color: Colors.blue,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Sign In to continue',
                    style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: Color.fromARGB(255, 127, 127, 127)),
                  ),
                  Text(
                    'Fresh',
                    style: TextStyle(
                      fontSize: 100,
                      color: Color.fromARGB(236, 42, 118, 108),
                      fontStyle: FontStyle.normal,
                      fontFamily: 'Great Vibes',
                      shadows: [
                        BoxShadow(
                          blurRadius: 19,
                          color: Color.fromARGB(220, 81, 228, 132),
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                  ),
                  Column(
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
