import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:five_star/models/product_models1.dart';
import 'package:flutter/material.dart';

class WishListProvider with ChangeNotifier {
  late ProductModel1 productModel;
  void addWishListData({
    required String wishListImage,
    required String wishListName,
    required String wishListId,
    required String wishListPrice,
    required int wishListQuantity,
  }) async {
    await FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("MyWishList")
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

  //////////////////////Get WishList//////
  List<ProductModel1> wishList = [];
  getWishListData() async {
    List<ProductModel1> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("MyWishList")
        .get();
    value.docs.forEach((element) {
      ProductModel1 productModel = ProductModel1(
          productId: element.get("wishListId"),
          productName: element.get("wishListName"),
          productPrice: element.get("wishListPrice"),
          productImage: element.get("wishListImage"));
      newList.add(productModel);
    });
    wishList = newList;
    notifyListeners();
  }

  List<ProductModel1> get getWishList {
    return wishList;
  }

  //////Delete wishlist////
  deleteWishList(wishListId) {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("MyWishList")
        .doc(wishListId)
        .delete();
  }
}
