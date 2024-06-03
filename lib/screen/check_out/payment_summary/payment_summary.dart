// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fresh_grocery_app/screen/check_out/delivery_details/single_delivery.dart';
import 'package:provider/provider.dart';

import 'package:fresh_grocery_app/config/config.dart';
import 'package:fresh_grocery_app/model/delivery_address_model.dart';
import 'package:fresh_grocery_app/provider/review_cart_provider.dart';
import 'package:fresh_grocery_app/screen/check_out/payment_summary/order_item.dart';

class PaymentSummary extends StatefulWidget {
  final DeliveryAddressModel deliveryAddressList;
  const PaymentSummary({
    super.key,
    required this.deliveryAddressList,
  });

  @override
  State<PaymentSummary> createState() => _PaymentSummaryState();
}

enum PaymentTypes {
  netBanking,
  card,
  upi,
  cash,
}

class _PaymentSummaryState extends State<PaymentSummary> {
  var myType = PaymentTypes.upi;
  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: taskbarColor,
        title: const Text("Payment Summary"),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10.0, left: 8, right: 8),
        child: ListTile(
          title: const Text(
            "Total Amount",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            'Rs ${(reviewCartProvider.getTotalPrice() + 50 + (reviewCartProvider.getTotalPrice() + 50) * 0.05)}',
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          trailing: SizedBox(
            width: 160,
            height: 50,
            child: MaterialButton(
              onPressed: () {},
              color: taskbarColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text(
                "Place Order",
                style: TextStyle(fontSize: 19),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            children: [
              SingleDelivery(
                title:
                    "${widget.deliveryAddressList.firstName} ${widget.deliveryAddressList.lastName}",
                address:
                    "${widget.deliveryAddressList.houseNo}, ${widget.deliveryAddressList.streetNo}, ${widget.deliveryAddressList.city}, ${widget.deliveryAddressList.state}, ${widget.deliveryAddressList.country} - ${widget.deliveryAddressList.pincode}, Landmark : ${widget.deliveryAddressList.landmark}",
                addressType: widget.deliveryAddressList.addressType ==
                        "AddressTypes.other"
                    ? "Other"
                    : widget.deliveryAddressList.addressType ==
                            "AddressTypes.home"
                        ? "Home"
                        : "Office",
                number: widget.deliveryAddressList.mobileNo,
                email: widget.deliveryAddressList.email,
              ),
              // const Divider(),
              ExpansionTile(
                title: const Text("Item Summary"),
                children: reviewCartProvider.getReviewCartDataList.map((e) {
                  return OrderItem(
                    e: e,
                  );
                }).toList(),
              ),
              const Divider(),
              // const ListTile(
              //   minVerticalPadding: 5,
              //   leading: Text(
              //     "Sub Total",
              //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              //   ),
              //   trailing: Text(
              //     "Rs 200",
              //     style: TextStyle(fontSize: 13),
              //   ),
              // ),
              // const ListTile(
              //   leading: Text(
              //     "Shipping Charges",
              //     style: TextStyle(fontSize: 13),
              //   ),
              //   trailing: Text(
              //     "Rs 50",
              //     style: TextStyle(fontSize: 13),
              //   ),
              // ),
              // const ListTile(
              //   leading: Text(
              //     "Tax and Service Charge",
              //     style: TextStyle(fontSize: 13),
              //   ),
              //   trailing: Text(
              //     "Rs 50",
              //     style: TextStyle(fontSize: 13),
              //   ),
              // ),
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Sub Total",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text('Rs ${reviewCartProvider.getTotalPrice()}'),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Shipping Charges"),
                        Text("Rs 50.0"),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("GST"),
                        Text(
                            'Rs ${(reviewCartProvider.getTotalPrice() + 50) * 0.05}'),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(),
              const ListTile(
                title: Text("Payment Options"),
              ),
              RadioListTile(
                value: PaymentTypes.netBanking,
                groupValue: myType,
                onChanged: (abc) {
                  setState(() {
                    myType = PaymentTypes.netBanking;
                  });
                },
                title: const Text("Net Banking"),
                secondary: const Icon(Icons.computer_rounded),
              ),
              RadioListTile(
                value: PaymentTypes.card,
                groupValue: myType,
                onChanged: (abc) {
                  setState(() {
                    myType = PaymentTypes.card;
                  });
                },
                title: const Text("Debit/Credit Card"),
                secondary: const Icon(Icons.credit_card),
              ),
              RadioListTile(
                value: PaymentTypes.upi,
                groupValue: myType,
                onChanged: (abc) {
                  setState(() {
                    myType = PaymentTypes.upi;
                  });
                },
                title: const Text("UPI"),
                secondary: const Icon(Icons.qr_code_2),
              ),
              RadioListTile(
                value: PaymentTypes.cash,
                groupValue: myType,
                onChanged: (abc) {
                  setState(() {
                    myType = PaymentTypes.cash;
                  });
                },
                title: const Text("Cash on Delivery"),
                secondary: const Icon(Icons.money),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
