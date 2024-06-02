import 'package:flutter/material.dart';
import 'package:fresh_grocery_app/widgets/count.dart';

// ignore: must_be_immutable
class SingleItem extends StatefulWidget {
  final String productId;
  final String productImage;
  final String productName;
  final int productPrice;
  var productUnit;
  bool wishlist;
  void Function() onDelete;
  SingleItem({
    this.productUnit,
    required this.wishlist,
    super.key,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.onDelete,
    required this.productId,
  });

  @override
  State<SingleItem> createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
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
                      Padding(
                        padding: EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          "${widget.productUnit}",
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              widget.wishlist == false
                  ? Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 17),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: widget.onDelete,
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
                                productName: widget.productName,
                                productId: widget.productId,
                                productImage: widget.productImage,
                                productPrice: widget.productPrice,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: widget.onDelete,
                      child: const Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(
                          Icons.delete_rounded,
                          color: Colors.black87,
                          size: 40,
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
