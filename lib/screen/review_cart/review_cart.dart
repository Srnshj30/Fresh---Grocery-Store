import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fresh_grocery_app/config/config.dart';
import 'package:fresh_grocery_app/model/review_cart_model.dart';
import 'package:fresh_grocery_app/provider/review_cart_provider.dart';
import 'package:fresh_grocery_app/screen/check_out/delivery_details/delivery_details.dart';
import 'package:provider/provider.dart';

import '../../widgets/single_item.dart';

class ReviewCart extends StatefulWidget {
  const ReviewCart({super.key});

  @override
  State<ReviewCart> createState() => _ReviewCartState();
}

class _ReviewCartState extends State<ReviewCart> {
  late ReviewCartProvider reviewCartProvider;
  showAlertDialog(BuildContext context, var delete) {
    Widget cancelButton = TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text("No"),
    );
    Widget continueButton = TextButton(
      onPressed: () {
        reviewCartProvider.reviewCartDeleteData(delete.cartId);
        Navigator.of(context).pop();
      },
      child: const Text("Yes"),
    );
    AlertDialog alertDialog = AlertDialog(
      title: const Text("Delete Cart Product"),
      content: const Text("Do you want to delete this Item from your cart"),
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
    reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            'Total Amount',
            style: TextStyle(fontSize: 18),
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            'Rs ${reviewCartProvider.getTotalPrice()}',
            style: const TextStyle(
              fontSize: 17,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        trailing: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: SizedBox(
            width: 120,
            height: 50,
            child: MaterialButton(
              onPressed: () {
                if (reviewCartProvider.getReviewCartDataList.isEmpty) {
                  Fluttertoast.showToast(msg: "Cart Empty");
                  return;
                }
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DeliveryDetails(),
                  ),
                );
              },
              color: taskbarColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Review Cart'),
        backgroundColor: taskbarColor,
      ),
      body: reviewCartProvider.getReviewCartDataList.isEmpty
          ? const Center(
              child: Text("No Data"),
            )
          : ListView.builder(
              itemCount: reviewCartProvider.getReviewCartDataList.length,
              itemBuilder: (context, index) {
                ReviewCartModel data =
                    reviewCartProvider.getReviewCartDataList[index];
                return SingleItem(
                  wishlist: false,
                  productImage: data.cartImage,
                  productName: data.cartName,
                  productPrice: data.cartPrice,
                  productId: data.cartId,
                  productUnit: data.cartUnit,
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
