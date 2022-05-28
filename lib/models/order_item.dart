import 'package:flutter/material.dart';

class OrderModel {
  String firstName;
  String lastName;
  String mobileNo;
  String homeNo;
  String street;
  String landmark;
  String area;
  String city;
  String pincode;
  String addressType;
  String product_Image;
  String product_Name;
  String product_Qunaity;
  String product_price;
  double total_price;
  double shipping_charge;
  double discount;
  String total;

  OrderModel({
    required this.firstName,
    required this.lastName,
    required this.mobileNo,
    required this.homeNo,
    required this.street,
    required this.landmark,
    required this.area,
    required this.city,
    required this.pincode,
    required this.addressType,
    required this.product_Image,
    required this.product_Name,
    required this.product_Qunaity,
    required this.product_price,
    required this.total_price,
    required this.shipping_charge,
    required this.discount,
    required this.total,
  });
}
