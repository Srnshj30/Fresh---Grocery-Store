import 'package:flutter/material.dart';
import 'package:fresh_grocery_app/config/config.dart';
import 'package:fresh_grocery_app/model/delivery_address_model.dart';
import 'package:fresh_grocery_app/provider/check_out_provider.dart';
import 'package:fresh_grocery_app/screen/check_out/add_delivery_address/add_delivery_address.dart';
import 'package:fresh_grocery_app/screen/check_out/delivery_details/single_delivery.dart';
import 'package:fresh_grocery_app/screen/check_out/payment_summary/payment_summary.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class DeliveryDetails extends StatefulWidget {
  const DeliveryDetails({super.key});

  @override
  State<DeliveryDetails> createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  late DeliveryAddressModel value;
  @override
  Widget build(BuildContext context) {
    CheckOutProvider deliveryAddressProvider = Provider.of(context);
    deliveryAddressProvider.getDeliveryAddressData();
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
            deliveryAddressProvider.getDeliveryAddressList.isEmpty
                ? Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddDeliveryAddress(),
                    ),
                  )
                : Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PaymentSummary(
                        deliveryAddressList: value,
                      ),
                    ),
                  );
          },
          color: taskbarColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: deliveryAddressProvider.getDeliveryAddressList.isEmpty
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
              deliveryAddressProvider.getDeliveryAddressList.isEmpty
                  ? const Center(
                      child: Text("No Data"),
                    )
                  : Column(
                      children: deliveryAddressProvider.getDeliveryAddressList
                          .map((e) {
                        setState(() {
                          value = e;
                        });
                        return SingleDelivery(
                          title: "${e.firstName} ${e.lastName}",
                          address:
                              "${e.houseNo}, ${e.streetNo}, ${e.city}, ${e.state}, ${e.country} - ${e.pincode}, Landmark : ${e.landmark}",
                          addressType: e.addressType == "AddressTypes.other"
                              ? "Other"
                              : e.addressType == "AddressTypes.home"
                                  ? "Home"
                                  : "Office",
                          number: e.mobileNo,
                          email: e.email,
                        );
                      }).toList(),
                    )
            ],
          )
        ],
      ),
    );
  }
}
