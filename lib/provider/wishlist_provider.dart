import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fresh_grocery_app/model/wishlist_model.dart';

class WishlistProvider with ChangeNotifier {
  void addwishlistData({
    required String wishlistName,
    required String wishlistId,
    required String wishlistImage,
    required int wishlistPrice,
    var wishlistUnit,
  }) async {
    FirebaseFirestore.instance
        .collection("Wishlist")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishlist")
        .doc(wishlistId)
        .set(
      {
        "wishlistId": wishlistId,
        "wishlistName": wishlistName,
        "wishlistImage": wishlistImage,
        "wishlistPrice": wishlistPrice,
        "wishlist": true,
        "wishlistUnit": wishlistUnit,
      },
    );
  }

  List<WishlistModel> wishlistDataList = [];
  void getWishlistData() async {
    List<WishlistModel> newList = [];

    QuerySnapshot wishlistValue = await FirebaseFirestore.instance
        .collection("Wishlist")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishlist")
        .get();
    for (var element in wishlistValue.docs) {
      WishlistModel wishlistModel = WishlistModel(
        productUnit: element.get("wishlistUnit"),
        productId: element.get("wishlistId"),
        productImage: element.get("wishlistImage"),
        productName: element.get("wishlistName"),
        productPrice: element.get("wishlistPrice"),
      );
      newList.add(wishlistModel);
    }
    wishlistDataList = newList;
    notifyListeners();
  }

  List<WishlistModel> get getWishlistDataList {
    return wishlistDataList;
  }

  wishlistDeleteData(wishlistId) {
    FirebaseFirestore.instance
        .collection("Wishlist")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourWishlist")
        .doc(wishlistId)
        .delete();
    notifyListeners();
  }
}
