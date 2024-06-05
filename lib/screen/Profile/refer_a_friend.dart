import 'package:flutter/material.dart';
import 'package:fresh_grocery_app/config/config.dart';

class ReferAFriend extends StatelessWidget {
  const ReferAFriend({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: taskbarColor,
        title: const Text("Refer a Friend"),
      ),
    );
  }
}
