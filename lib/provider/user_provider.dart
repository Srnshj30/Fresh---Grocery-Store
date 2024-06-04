import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:fresh_grocery_app/model/user_model.dart';

class UserProvider with ChangeNotifier {
  void addUserData({
    required User currentUser,
    required String userName,
    required String userEmail,
    required String userImage,
  }) async {
    await FirebaseFirestore.instance
        .collection("UserData")
        .doc(currentUser.uid)
        .set(
      {
        "userName": userName,
        "userImage": userImage,
        "userEmail": userEmail,
        "userUid": currentUser.uid,
      },
    );
  }

  late UserModel currentData;

  void getUserData() async {
    UserModel usermodel;
    var value = await FirebaseFirestore.instance
        .collection("UserData")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (value.exists) {
      usermodel = UserModel(
        userImage: value.get("userImage"),
        userName: value.get("userName"),
        userUid: value.get("userUid"),
        userEmail: value.get("userEmail"),
      );
      currentData = usermodel;
      notifyListeners();
    }
  }

  UserModel get currentUserData {
    return currentData;
  }

  userDeleteData() {
    FirebaseFirestore.instance
        .collection("UserData")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .delete();
    notifyListeners();
  }
}
