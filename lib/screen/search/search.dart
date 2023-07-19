import 'package:flutter/material.dart';
import 'package:fresh_grocery_app/config/config.dart';
import 'package:fresh_grocery_app/single_item.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search',
        ),
        backgroundColor: taskbarColor,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Icon(Icons.menu_rounded),
          )
        ],
      ),
      body: ListView(
        children: [
          const ListTile(
            title: Text("Items"),
          ),
          Container(
            height: 52,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: const Color.fromARGB(255, 221, 218, 218),
                filled: true,
                hintText: "Search for the Item",
                suffixIcon: const Icon(Icons.search_rounded),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SingleItem(isBool: false),
          SingleItem(isBool: false),
          SingleItem(isBool: false),
          SingleItem(isBool: false),
        ],
      ),
    );
  }
}
