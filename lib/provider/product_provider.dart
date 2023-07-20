import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/provider_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProviderModel> vegeProductList = [];

  fetchVegeProductData() async {
    QuerySnapshot productData =
        await FirebaseFirestore.instance.collection("product").get();

    productData.docs.forEach((element) {
      print(element.data());
    });
  }
}
