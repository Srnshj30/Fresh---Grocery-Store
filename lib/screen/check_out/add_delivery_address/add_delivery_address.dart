import 'package:flutter/material.dart';
import 'package:fresh_grocery_app/config/config.dart';
import 'package:fresh_grocery_app/provider/check_out_provider.dart';
import 'package:fresh_grocery_app/screen/check_out/google_maps/google_maps.dart';
import 'package:fresh_grocery_app/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class AddDeliveryAddress extends StatefulWidget {
  const AddDeliveryAddress({super.key});

  @override
  State<AddDeliveryAddress> createState() => _AddDeliveryAddressState();
}

enum AddressTypes {
  home,
  office,
  other,
}

class _AddDeliveryAddressState extends State<AddDeliveryAddress> {
  var myType = AddressTypes.home;
  @override
  Widget build(BuildContext context) {
    CheckOutProvider checkOutProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: taskbarColor,
        title: const Text("Add Delivery Address"),
      ),
      bottomNavigationBar: Container(
        height: 48,
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 10),
        child: checkOutProvider.isLoading == false
            ? MaterialButton(
                onPressed: () {
                  checkOutProvider.validator(context, myType);
                },
                color: taskbarColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: const Text("Add Address"),
              )
            : Center(
                child: CircularProgressIndicator(
                  color: taskbarColor,
                ),
              ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            CustomTextField(
              labText: "First Name",
              controller: checkOutProvider.firstName,
            ),
            CustomTextField(
              labText: "Last Name",
              controller: checkOutProvider.lastName,
            ),
            CustomTextField(
              labText: "Mobile Number",
              controller: checkOutProvider.mobileNo,
            ),
            CustomTextField(
              labText: "Alternate Mobile Number",
              controller: checkOutProvider.alternateMobileNo,
            ),
            CustomTextField(
              labText: "House No.",
              controller: checkOutProvider.houseNo,
            ),
            CustomTextField(
              labText: "Street No.",
              controller: checkOutProvider.streetNo,
            ),
            CustomTextField(
              labText: "City",
              controller: checkOutProvider.city,
            ),
            CustomTextField(
              labText: "State",
              controller: checkOutProvider.state,
            ),
            CustomTextField(
              labText: "Country",
              controller: checkOutProvider.country,
            ),
            CustomTextField(
              labText: "Pincode",
              controller: checkOutProvider.pincode,
            ),
            CustomTextField(
              labText: "Landmark",
              controller: checkOutProvider.landmark,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CustomGoogleMaps(),
                  ),
                );
              },
              child: const SizedBox(
                height: 47,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Set Location"),
                  ],
                ),
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            const ListTile(
              title: Text("Address Type*"),
            ),
            RadioListTile(
              value: AddressTypes.home,
              groupValue: myType,
              onChanged: (abc) {
                setState(() {
                  myType = AddressTypes.home;
                });
              },
              title: const Text("Home"),
              secondary: const Icon(Icons.home),
            ),
            RadioListTile(
              value: AddressTypes.office,
              groupValue: myType,
              onChanged: (abc) {
                setState(() {
                  myType = AddressTypes.office;
                });
              },
              title: const Text("Office"),
              secondary: const Icon(Icons.badge),
            ),
            RadioListTile(
              value: AddressTypes.other,
              groupValue: myType,
              onChanged: (abc) {
                setState(() {
                  myType = AddressTypes.other;
                });
              },
              title: const Text("Other"),
              secondary: const Icon(Icons.devices_other),
            ),
          ],
        ),
      ),
    );
  }
}
