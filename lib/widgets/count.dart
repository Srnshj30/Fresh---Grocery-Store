// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fresh_grocery_app/provider/review_cart_provider.dart';

// ignore: must_be_immutable
class Count extends StatefulWidget {
  final String productName;
  final String productId;
  final String productImage;
  final int productPrice;
  // ignore: prefer_typing_uninitialized_variables
  var productUnit;
  Count(
      {super.key,
      required this.productName,
      required this.productId,
      required this.productImage,
      required this.productPrice,
      this.productUnit});

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 1;
  bool isTrue = false;

  getAddAndQuantity() {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .doc(widget.productId)
        .get()
        .then(
          (value) => {
            if (mounted)
              {
                if (value.exists)
                  {
                    setState(
                      () {
                        count = value.get("cartQty");
                        isTrue = value.get("isAdd");
                      },
                    ),
                  }
                else
                  {
                    setState(
                      () {
                        isTrue = false;
                      },
                    ),
                  }
              },
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    getAddAndQuantity();
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    return Expanded(
      flex: 10,
      child: Container(
        height: 30,
        width: 68,
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 201, 199, 199)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: isTrue == true
            ? Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: InkWell(
                        onTap: () {
                          if (count == 1) {
                            setState(() {
                              // count = 1;
                              isTrue = false;
                            });

                            reviewCartProvider
                                .reviewCartDeleteData(widget.productId);
                          }
                          if (count > 1) {
                            setState(() {
                              count--;
                            });
                            reviewCartProvider.updateReviewCartData(
                              cartName: widget.productName,
                              cartId: widget.productId,
                              cartImage: widget.productImage,
                              cartPrice: widget.productPrice,
                              cartQty: count,
                            );
                          }
                        },
                        child: const Icon(
                          Icons.remove,
                          size: 18,
                          color: Color.fromARGB(255, 93, 134, 155),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        '$count',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 93, 134, 155),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: InkWell(
                        onTap: () {
                          if (count <= 8) {
                            setState(() {
                              count++;
                            });
                          }
                          if (count == 9) {
                            const snackBar = SnackBar(
                              content: Text(
                                  'Can\'t add more than 9 quantities of an Item'),
                              duration: Duration(
                                  seconds: 3), // Adjust the duration as needed
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                          reviewCartProvider.updateReviewCartData(
                            cartName: widget.productName,
                            cartId: widget.productId,
                            cartImage: widget.productImage,
                            cartPrice: widget.productPrice,
                            cartQty: count,
                          );
                        },
                        child: const Icon(
                          Icons.add,
                          size: 18,
                          color: Color.fromARGB(255, 93, 134, 155),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Center(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isTrue = true;
                    });
                    reviewCartProvider.addReviewCartData(
                      cartName: widget.productName,
                      cartId: widget.productId,
                      cartImage: widget.productImage,
                      cartPrice: widget.productPrice,
                      cartQty: count,
                      cartUnit: widget.productUnit,
                    );
                  },
                  child: const Text(
                    'ADD',
                    style: TextStyle(
                      color: Color.fromARGB(255, 93, 134, 155),
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
