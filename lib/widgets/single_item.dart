import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fresh_grocery_app/config/config.dart';
import 'package:fresh_grocery_app/widgets/count.dart';

// ignore: must_be_immutable
class SingleItem extends StatelessWidget {
  bool isBool = false;
  final String productId;
  final String productImage;
  final String productName;
  final int productPrice;
  void Function() onDelete;
  SingleItem({
    required this.isBool,
    super.key,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.onDelete,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 100,
                  child: Center(
                    child: Image.asset(productImage),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: 85,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 1.0, bottom: 5),
                            child: Text(
                              productName,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            "Rs $productPrice",
                            style: const TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      isBool == false
                          ? Container(
                              width: 100,
                              height: 31,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '1 KG',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down_sharp,
                                      color: Colors.black87,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : const Padding(
                              padding: EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                '1 kg',
                                style: TextStyle(fontSize: 16),
                              ),
                            )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 17),
                    child: isBool == false
                        ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: Container(
                              height: 10,
                              width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "ADD",
                                      style: TextStyle(color: taskbarColor),
                                    ),
                                    Icon(
                                      Icons.add,
                                      size: 18,
                                      color: taskbarColor,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Column(
                            children: [
                              InkWell(
                                onTap: onDelete,
                                child: const Icon(
                                  Icons.delete_rounded,
                                  color: Colors.black87,
                                  size: 30,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Count(
                                productName: productName,
                                productId: productId,
                                productImage: productImage,
                                productPrice: productPrice,
                              ),
                              // Container(
                              //   height: 30,
                              //   width: 80,
                              //   decoration: BoxDecoration(
                              //     border: Border.all(color: Colors.grey),
                              //     borderRadius: BorderRadius.circular(30),
                              //   ),
                              //   child: Center(
                              //     child: Row(
                              //       mainAxisAlignment: MainAxisAlignment.center,
                              //       children: [
                              //         Text(
                              //           "ADD",
                              //           style: TextStyle(color: taskbarColor),
                              //         ),
                              //         Icon(
                              //           Icons.add,
                              //           size: 18,
                              //           color: taskbarColor,
                              //         )
                              //       ],
                              //     ),
                              //   ),
                              // )
                            ],
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 5,
        )
      ],
    );
  }
}
