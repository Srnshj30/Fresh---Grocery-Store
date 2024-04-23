import 'package:flutter/material.dart';
import 'package:fresh_grocery_app/config/config.dart';
import 'package:fresh_grocery_app/model/product_model.dart';
import 'package:fresh_grocery_app/widgets/single_item.dart';

class Search extends StatefulWidget {
  final List<ProductModel> search;
  const Search({super.key, required this.search});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String query = "";
  List<ProductModel> searchItem(String query) {
    List<ProductModel> searchFood = widget.search.where(
      (element) {
        return element.productName.toLowerCase().contains(query);
      },
    ).toList();
    return searchFood;
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> _searchItem = searchItem(query);
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
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
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
          Column(
            children: _searchItem.map((data) {
              return SingleItem(
                isBool: false,
                productImage: data.productImage,
                productName: data.productName,
                productPrice: data.productPrice,
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
