import 'package:flutter/material.dart';
import 'package:fresh_grocery_app/provider/product_provider.dart';
// import 'package: fresh_grocery_app/auth/sign_in.dart';
import 'package:fresh_grocery_app/screen/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductProvider>(
      create: (context) => ProductProvider(),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
