import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WishListProvider with ChangeNotifier {
  void addWishListData({
    required String wishListImage,
    required String wishListName,
    required String wishListId,
    required int wishListPrice,
    required int wishListQuantity,
  }) async {
    await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("MyReviewCart")
        .doc(wishListId)
        .set(
      {
        "wishListId": wishListId,
        "wishListName": wishListName,
        "wishListImage": wishListImage,
        "wishListPrice": wishListPrice,
        "wishListQuantity": wishListQuantity,
        "wishList": true,
      },
    );
  }
}
