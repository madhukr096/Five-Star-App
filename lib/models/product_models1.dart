import 'package:flutter/material.dart';

class ProductModel1 {
  late String productImage;
  late String productName;
  String productDetails = '';
  late String productPrice;
  late String productId;
  int? productQuantity;
  ProductModel1({
    required this.productImage,
    required this.productName,
    this.productDetails = '',
    required this.productPrice,
    required this.productId,
    this.productQuantity,
  });
}
