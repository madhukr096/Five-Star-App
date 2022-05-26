import 'package:flutter/material.dart';

class DeliveryAddressModel {
  late String firstName;
  late String lastName;
  late String mobileNo;
  late String alternativeMobileNo;
  late String homeNo;
  late String street;
  late String landmark;
  late String area;
  late String city;
  late String pincode;
  late String addressType;

  DeliveryAddressModel({
    required this.firstName,
    required this.lastName,
    required this.mobileNo,
    required this.alternativeMobileNo,
    required this.homeNo,
    required this.street,
    required this.landmark,
    required this.area,
    required this.city,
    required this.pincode,
    required this.addressType,
  });
}
