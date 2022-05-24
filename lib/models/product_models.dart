import 'package:flutter/material.dart';

class ProductModel {
  late String productImage;
  late String productName;
  String productDetails = '';
  late String productPrice;
  late String productId;
  int? productQuantity;
  ProductModel({
    required this.productImage,
    required this.productName,
    this.productDetails = '',
    required this.productPrice,
    required this.productId,
    this.productQuantity,
  });
}
