import 'package:flutter/material.dart';
import 'package:fresh_grocery_app/config/config.dart';
import 'package:fresh_grocery_app/screen/check_out/add_delivery_address/add_delivery_address.dart';
import 'package:fresh_grocery_app/screen/check_out/delivery_details/single_delivery.dart';
import 'package:fresh_grocery_app/screen/check_out/payment_summary/payment_summary.dart';

// ignore: must_be_immutable
class DeliveryDetails extends StatelessWidget {
  DeliveryDetails({super.key});

  List<Widget> adrs = [
    const SingleDelivery(
      title: "Saransh Jindal",
      address: "Bh - 205, Sector - 70, Noida, UP",
      addressType: "Home",
      number: "8851625921",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: taskbarColor,
        title: const Text("Delivery Details"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddDeliveryAddress(),
            ),
          );
        },
        backgroundColor: taskbarColor,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: Container(
        height: 55,
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 10),
        child: MaterialButton(
          onPressed: () {
            adrs.isEmpty
                ? Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddDeliveryAddress(),
                    ),
                  )
                : Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PaymentSummary(),
                    ),
                  );
          },
          color: taskbarColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: adrs.isEmpty
              ? const Text(
                  "Add Address",
                  style: TextStyle(fontSize: 17),
                )
              : const Text(
                  "Payment Summary",
                  style: TextStyle(fontSize: 17),
                ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Deliver To"),
            leading: Image.asset(
              "assets/location.png",
              height: 30,
            ),
          ),
          const Divider(
            height: 1,
          ),
          Column(
            children: [
              adrs.isEmpty
                  ? Container()
                  : const SingleDelivery(
                      title: "Saransh Jindal",
                      address: "Bh - 205, Sector - 70, Noida, UP",
                      addressType: "Home",
                      number: "8851625921",
                    )
            ],
          )
        ],
      ),
    );
  }
}
