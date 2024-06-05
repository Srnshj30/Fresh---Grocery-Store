import 'package:flutter/material.dart';
import 'package:fresh_grocery_app/config/config.dart';

class RatingsAndReviews extends StatelessWidget {
  const RatingsAndReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: taskbarColor,
        title: const Text("Ratings And Reviews"),
      ),
    );
  }
}
