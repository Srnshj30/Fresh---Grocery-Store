import 'package:flutter/material.dart';
import 'package:fresh_grocery_app/widgets/count.dart';
import 'package:fresh_grocery_app/widgets/product_unit.dart';

class SingleProduct extends StatefulWidget {
  final String productImage;
  final String productName;
  final String productId;
  final int productPrice;
  var productUnit;
  final Function() onTap;
  SingleProduct({
    super.key,
    required this.productImage,
    required this.productName,
    required this.onTap,
    required this.productPrice,
    required this.productId,
    this.productUnit,
  });

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  var unitData;
  var firstValue;

  @override
  Widget build(BuildContext context) {
    widget.productUnit.productUnit.firstWhere(
      (element) {
        setState(() {
          firstValue = element;
        });
        return true;
      },
    );
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Container(
        height: 200,
        width: 150,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 251, 248, 248),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            GestureDetector(
                onTap: widget.onTap,
                child: Container(
                  height: 120,
                  width: double.infinity,
                  padding: const EdgeInsets.all(5),
                  child: Image(
                    image: AssetImage(widget.productImage),
                  ),
                )),
            Expanded(
              flex: 4,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 8, right: 8, top: 3, bottom: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Rs ${widget.productPrice}/${unitData == null ? firstValue : unitData}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 154, 154, 154),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 10,
                            child: ProductUnit(
                              onTap: () {
                                showModalBottomSheet<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: widget.productUnit.productUnit
                                            .map<Widget>((data) {
                                          return Column(
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  setState(() {
                                                    unitData = data;
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 8.0,
                                                      horizontal: 60),
                                                  child: Text(
                                                    data,
                                                    style: const TextStyle(
                                                        fontSize: 20),
                                                  ),
                                                ),
                                              ),
                                              const Divider(
                                                thickness: 2,
                                              )
                                            ],
                                          );
                                        }).toList(),
                                      );
                                    });
                              },
                              title: unitData == null ? firstValue : unitData,
                            ),
                          ),
                          const Expanded(
                            child: SizedBox(
                              width: 7,
                            ),
                          ),
                          Count(
                            productName: widget.productName,
                            productId: widget.productId,
                            productImage: widget.productImage,
                            productPrice: widget.productPrice,
                            productUnit:
                                unitData == null ? firstValue : unitData,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
