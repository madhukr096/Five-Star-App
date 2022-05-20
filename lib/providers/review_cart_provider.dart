import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/review_cart_model.dart';

class ReviewCartProvider with ChangeNotifier {
  void addReviewCartData({
    required String cartImage,
    required String cartName,
    required String cartId,
    required int cartPrice,
    required int cartQuantity,
  }) async {
    await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("MyReviewCart")
        .doc(cartId)
        .set(
      {
        "cartId": cartId,
        "cartName": cartName,
        "cartImage": cartImage,
        "cartPrice": cartPrice,
        "cartQuantity": cartQuantity,
        "isAdd": true,
      },
    );
  }

  void updateReviewCartData({
    required String cartImage,
    required String cartName,
    required String cartId,
    required int cartPrice,
    required int cartQuantity,
  }) async {
    await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("MyReviewCart")
        .doc(cartId)
        .update(
      {
        "cartId": cartId,
        "cartName": cartName,
        "cartImage": cartImage,
        "cartPrice": cartPrice,
        "cartQuantity": cartQuantity,
        "isAdd": true,
      },
    );
  }

  List<ReviewCartModel> reviewCartDatList = [];
  void getReviewCartData() async {
    List<ReviewCartModel> newList = [];
    QuerySnapshot reviewCartValue = await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("MyReviewCart")
        .get();
    reviewCartValue.docs.forEach((element) {
      ReviewCartModel reviewCartModel = ReviewCartModel(
        cartId: element.get("cartId"),
        cartImage: element.get("cartImage"),
        cartName: element.get("cartName"),
        cartPrice: element.get("cartPrice"),
        cartQuantity: element.get("cartQuantity"),
      );
      newList.add(reviewCartModel);
    });
    reviewCartDatList = newList;
    notifyListeners();
  }

  List<ReviewCartModel> get getReviewCartDataList {
    return reviewCartDatList;
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
  }
}
