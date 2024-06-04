import 'package:flutter/material.dart';
import 'package:fresh_grocery_app/config/config.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: taskbarColor,
        title: const Text("About"),
      ),
      body: const Padding(
        padding: EdgeInsets.only(left: 20, top: 15, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About the Application",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Description : ",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "Developed a feature-rich Android application using Flutter for ordering fresh produce online, including fruits, vegetables, and herbs. The app features secure user authentication, advanced product search, a wish list for favorite items, a review cart for order management, and options to add and manage delivery addresses. It also supports multiple payment methods, ensuring smooth transactions.",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Tech Used : ",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "Flutter, Dart, FireBase, User Authentication, GitHub, FireStore",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
