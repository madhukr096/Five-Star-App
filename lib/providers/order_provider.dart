import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/order_item.dart';

class OrderProvider with ChangeNotifier {
  void addOrderData({
    required String productImage,
    required String productName,
    required String productPrice,
    required int productQuantity,
    required String firstName,
    required String lastName,
    required String mobileNo,
    required String homeNo,
    required String street,
    required String landmark,
    required String area,
    required String city,
    required String pincode,
    required String addressType,
    required double total_price,
    required double shipping_charge,
    required double discount,
    required double total,
  }) async {
    await FirebaseFirestore.instance
        .collection("OrderData")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("MyOrder")
        .doc()
        .set(
      {
        "productName": productName,
        "productImage": productImage,
        "productPrice": productPrice,
        "productQuantity": productQuantity,
        "isAdd": true,
      },
    );
  }

  List<OrderModel> orderDataList = [];
  void getReviewCartData() async {
    List<OrderModel> newList = [];
    QuerySnapshot orderValue = await FirebaseFirestore.instance
        .collection("OrderData")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("MyOrder")
        .get();
    orderValue.docs.forEach((element) {
      OrderModel reviewCartModel = OrderModel(
        product_Image: element.get("productImage"),
        product_Name: element.get("productName"),
        product_Qunaity: element.get("productQuantity"),
        product_price: element.get("productPrice"),
        firstName: element.get("firstName"),
        lastName: element.get("lastName"),
        mobileNo: element.get("mobileNo"),
        homeNo: element.get("homeNo"),
        street: element.get("street"),
        landmark: element.get("landmark"),
        area: element.get("area"),
        city: element.get("city"),
        pincode: element.get("productPrice"),
        addressType: element.get("productName"),
        total_price: element.get("productQuantity"),
        shipping_charge: element.get("productPrice"),
        discount: element.get("productName"),
        total: element.get("productQuantity"),
      );
      newList.add(reviewCartModel);
    });
    orderDataList = newList;
    notifyListeners();
  }

  List<OrderModel> get getOrderDataList {
    return orderDataList;
  }

/////////Total Price/////////////////////////
/*  getTotalPrice() {
    double total = 0.0;
    reviewCartDatList.forEach((element) {
      total += element.cartQuantity * int.parse(element.cartPrice);
    });

    return total;
  }

////////////////////////////////RewviewCart Delete Function/////
  reviewCartDelete(cartId) {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("MyReviewCart")
        .doc(cartId)
        .delete();
    notifyListeners();
  }*/
}
