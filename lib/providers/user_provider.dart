import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:five_star/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {
  void addUserData({
    required User currentUser,
    required String userName,
    required String userImage,
    required String userEmail,
  }) async {
    await FirebaseFirestore.instance
        .collection("userData")
        .doc(currentUser.uid)
        .set(
      {
        "userName": userName,
        "userEmail": userEmail,
        "userImage": userImage,
        "userUid": currentUser.uid
      },
    );
  }

  late UserModels currentData;
  void getUserData() async {
    UserModels userModels;
    var value = await FirebaseFirestore.instance
        .collection("userData")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();
    if (value.exists) {
      userModels = UserModels(
          userName: value.get("userName"),
          userImage: value.get("userImage"),
          userEmail: value.get("userEmail"),
          uid: value.get("userUid"));
      currentData = userModels;
      notifyListeners();
    }
  }

  UserModels get currentUserData {
    return currentData;
  }
}
