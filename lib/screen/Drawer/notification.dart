import 'package:flutter/material.dart';
import 'package:fresh_grocery_app/config/config.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: taskbarColor,
        title: const Text("Notifications"),
      ),
    );
  }
}
