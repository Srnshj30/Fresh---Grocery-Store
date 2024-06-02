import 'package:flutter/material.dart';
import 'package:fresh_grocery_app/widgets/count.dart';
import 'package:fresh_grocery_app/widgets/product_unit.dart';

// ignore: must_be_immutable
class SingleItemSearch extends StatefulWidget {
  final String productId;
  final String productImage;
  final String productName;
  final int productPrice;
  var productUnit;
  void Function() onDelete;
  SingleItemSearch({
    this.productUnit,
    super.key,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.onDelete,
    required this.productId,
  });

  @override
  State<SingleItemSearch> createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItemSearch> {
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 80,
                  child: Center(
                    child: Image.asset(widget.productImage),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                flex: 1,
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
                              widget.productName,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            "Rs ${widget.productPrice}",
                            style: const TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 100,
                        height: 31,
                        child: SizedBox(
                          height: 60,
                          width: 80,
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
                                                padding:
                                                    const EdgeInsets.symmetric(
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
                            title: unitData ?? firstValue,
                          ),
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: SizedBox(
                          height: 10,
                          width: 100,
                          child: Count(
                            productUnit: unitData ?? firstValue,
                            productName: widget.productName,
                            productId: widget.productId,
                            productImage: widget.productImage,
                            productPrice: widget.productPrice,
                          ),
                        ),
                      )),
                ),
              )
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
