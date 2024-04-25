import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> vegeProductList = [];
  List<ProductModel> fruitProductList = [];
  List<ProductModel> herbProductList = [];

  late ProductModel productModel;
  List<ProductModel> search = [];
  productModels(QueryDocumentSnapshot element) {
    productModel = ProductModel(
      productImage: element.get("productImage"),
      productName: element.get("productName"),
      productPrice: element.get("productPrice"),
      productAbout: element.get("productAbout"),
      productId: element.get("productId"),
    );
    search.add(productModel);
  }

  fetchVegeProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot productData =
        await FirebaseFirestore.instance.collection("VegeProduct").get();

    for (var element in productData.docs) {
      productModels(element);
      newList.add(productModel);
    }
    vegeProductList = newList;
    notifyListeners();
  }

  fetchFruitProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot productData =
        await FirebaseFirestore.instance.collection("FruitProduct").get();

    for (var element in productData.docs) {
      productModels(element);
      newList.add(productModel);
    }
    fruitProductList = newList;
    notifyListeners();
  }

  fetchHerbProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot productData =
        await FirebaseFirestore.instance.collection("HerbProduct").get();

    for (var element in productData.docs) {
      productModels(element);
      newList.add(productModel);
    }
    herbProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getVegeProductDataList {
    return vegeProductList;
  }

  List<ProductModel> get getFruitProductDataList {
    return fruitProductList;
  }

  List<ProductModel> get getHerbProductDataList {
    return herbProductList;
  }

  List<ProductModel> get getAllProductSearch {
    return search;
  }
}
