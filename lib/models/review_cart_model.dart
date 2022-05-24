import 'package:flutter/material.dart';

class ReviewCartModel {
  late String cartImage;
  late String cartName;
  late String cartId;
  late String cartPrice;
  late int cartQuantity;
  ReviewCartModel({
    required this.cartImage,
    required this.cartName,
    required this.cartId,
    required this.cartPrice,
    required this.cartQuantity,
  });
}
