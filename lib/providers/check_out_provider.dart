import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CheckOutProvider with ChangeNotifier {
  bool isloading = false;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobileNo = TextEditingController();
  TextEditingController alternativeMobileNo = TextEditingController();
  TextEditingController homeNo = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController setLocation = TextEditingController();

  void validate(context, myType) async {
    if (firstName.text.isEmpty) {
      Fluttertoast.showToast(msg: "Firstname is Empty");
    } else if (lastName.text.isEmpty) {
      Fluttertoast.showToast(msg: "Lastname is Empty");
    } else if (mobileNo.text.isEmpty) {
      Fluttertoast.showToast(msg: "Mbile Number is Empty");
    } else if (alternativeMobileNo.text.isEmpty) {
      Fluttertoast.showToast(msg: "Alternative Mobile Number is Empty");
    } else if (homeNo.text.isEmpty) {
      Fluttertoast.showToast(msg: "Home Number is Empty");
    } else if (street.text.isEmpty) {
      Fluttertoast.showToast(msg: "Street is Empty");
    } else if (landmark.text.isEmpty) {
      Fluttertoast.showToast(msg: "Landmark is Empty");
    } else if (area.text.isEmpty) {
      Fluttertoast.showToast(msg: "Area is Empty");
    } else if (city.text.isEmpty) {
      Fluttertoast.showToast(msg: "City is Empty");
    } else if (pincode.text.isEmpty) {
      Fluttertoast.showToast(msg: "Pincode is Empty");
    } else {
      isloading = true;
      notifyListeners();
      await FirebaseFirestore.instance
          .collection("AddDeliveryAddress")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .set({
        "firstName": firstName.text,
        "lastName": lastName.text,
        "mobileNo": mobileNo.text,
        "alternativeMobileNo": alternativeMobileNo.text,
        "homeNo": homeNo.text,
        "street": street.text,
        "landmark": landmark.text,
        "area": area.text,
        "city": city.text,
        "pincode": pincode.text,
        "addressType": myType,
      }).then((value) async {
        isloading = false;
        notifyListeners();
        await Fluttertoast.showToast(msg: "Add your deliver address");
        Navigator.of(context).pop();
        notifyListeners();
      });
      notifyListeners();
    }
  }
}
