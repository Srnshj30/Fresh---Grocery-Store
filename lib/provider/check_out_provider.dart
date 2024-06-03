import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fresh_grocery_app/model/delivery_address_model.dart';
import 'package:location/location.dart';

class CheckOutProvider with ChangeNotifier {
  bool isLoading = false;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobileNo = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController houseNo = TextEditingController();
  TextEditingController streetNo = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController landmark = TextEditingController();
  LocationData? setLocation;

  void validator(context, myType) async {
    if (firstName.text.isEmpty) {
      Fluttertoast.showToast(msg: "First Name can't be empty");
    } else if (lastName.text.isEmpty) {
      Fluttertoast.showToast(msg: "Last Name can't be empty");
    } else if (mobileNo.text.isEmpty) {
      Fluttertoast.showToast(msg: "Mobile No. can't be empty");
    } else if (email.text.isEmpty) {
      Fluttertoast.showToast(msg: "Email Id can't be empty");
    } else if (houseNo.text.isEmpty) {
      Fluttertoast.showToast(msg: "House No. can't be empty");
    } else if (streetNo.text.isEmpty) {
      Fluttertoast.showToast(msg: "Street No. can't be empty");
    } else if (city.text.isEmpty) {
      Fluttertoast.showToast(msg: "City can't be empty");
    } else if (state.text.isEmpty) {
      Fluttertoast.showToast(msg: "State can't be empty");
    } else if (country.text.isEmpty) {
      Fluttertoast.showToast(msg: "Country can't be empty");
    } else if (pincode.text.isEmpty) {
      Fluttertoast.showToast(msg: "Pincode can't be empty");
    } else if (landmark.text.isEmpty) {
      Fluttertoast.showToast(msg: "Landmark can't be empty");
    } else if (setLocation?.latitude == null) {
      Fluttertoast.showToast(msg: "Set Location can't be empty");
    } else {
      isLoading = true;
      notifyListeners();
      await FirebaseFirestore.instance
          .collection("AddDeliveryAddress")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .set(
        {
          "firstName": firstName.text,
          "lastName": lastName.text,
          "mobileNo": mobileNo.text,
          "email": email.text,
          "houseNo": houseNo.text,
          "streetNo": streetNo.text,
          "city": city.text,
          "state": state.text,
          "country": country.text,
          "pincode": pincode.text,
          "landmark": landmark.text,
          "setLocation_latitude": setLocation?.latitude,
          "setLocation_longitude": setLocation?.longitude,
          "addressType": myType.toString(),
        },
      ).then((value) async {
        isLoading = false;
        notifyListeners();
        await Fluttertoast.showToast(msg: "Address Added Successfully");
        Navigator.of(context).pop();
        notifyListeners();
      });
      notifyListeners();
    }
  }

  List<DeliveryAddressModel> deliveryAddressList = [];
  getDeliveryAddressData() async {
    List<DeliveryAddressModel> newList = [];
    DeliveryAddressModel deliveryAddressModel;
    DocumentSnapshot db = await FirebaseFirestore.instance
        .collection("AddDeliveryAddress")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();
    if (db.exists) {
      deliveryAddressModel = DeliveryAddressModel(
        firstName: db.get("firstName"),
        lastName: db.get("lastName"),
        mobileNo: db.get("mobileNo"),
        email: db.get("email"),
        houseNo: db.get("houseNo"),
        streetNo: db.get("streetNo"),
        city: db.get("city"),
        state: db.get("state"),
        country: db.get("country"),
        pincode: db.get("pincode"),
        landmark: db.get("landmark"),
        addressType: db.get("addressType"),
      );
      newList.add(deliveryAddressModel);
      notifyListeners();
    }
    deliveryAddressList = newList;
    notifyListeners();
  }

  List<DeliveryAddressModel> get getDeliveryAddressList {
    return deliveryAddressList;
  }
}
