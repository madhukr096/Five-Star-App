import 'package:flutter/material.dart';

class ProductModel {
  late String productImage;
  late String productName;
  late String productDetails;
  late int productPrice;
  late String productId;
  ProductModel({
    required this.productImage,
    required this.productName,
    required this.productDetails,
    required this.productPrice,
    required this.productId,
  });
}
