import 'package:flutter/material.dart';
import 'package:fresh_grocery_app/config/config.dart';
import 'package:fresh_grocery_app/model/wishlist_model.dart';
import 'package:fresh_grocery_app/provider/wishlist_provider.dart';
import 'package:provider/provider.dart';

import '../../widgets/single_item.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  late WishlistProvider wishlistProvider;
  showAlertDialog(BuildContext context, var delete) {
    Widget cancelButton = TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text("No"),
    );
    Widget continueButton = TextButton(
      onPressed: () {
        wishlistProvider.wishlistDeleteData(delete.productId);
        Navigator.of(context).pop();
      },
      child: const Text("Yes"),
    );
    AlertDialog alertDialog = AlertDialog(
      title: const Text("Delete Wishlist Product"),
      content: const Text(
          "Do you want to delete this Item from your wishlist product"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    showDialog(
      context: context = context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    wishlistProvider = Provider.of(context);
    wishlistProvider.getWishlistData();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wish List'),
        backgroundColor: taskbarColor,
      ),
      body: wishlistProvider.getWishlistDataList.isEmpty
          ? const Center(
              child: Text("No Data"),
            )
          : ListView.builder(
              itemCount: wishlistProvider.getWishlistDataList.length,
              itemBuilder: (context, index) {
                WishlistModel data =
                    wishlistProvider.getWishlistDataList[index];
                return SingleItem(
                  wishlist: true,
                  productUnit: data.productUnit,
                  productImage: data.productImage,
                  productName: data.productName,
                  productPrice: data.productPrice,
                  productId: data.productId,
                  onDelete: () {
                    showAlertDialog(
                      context,
                      data,
                    );
                  },
                );
              },
            ),
    );
  }
}
