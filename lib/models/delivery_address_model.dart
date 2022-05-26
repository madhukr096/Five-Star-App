import 'package:flutter/material.dart';

class DeliveryAddressModel {
  String? firstName;
  String? lastName;
  String? mobileNo;
  String? alternativeMobileNo;
  String? homeNo;
  String? street;
  String? landmark;
  String? area;
  String? city;
  String? pincode;
  String? addressType;

  DeliveryAddressModel({
    this.firstName,
    this.lastName,
    this.mobileNo,
    this.alternativeMobileNo,
    this.homeNo,
    this.street,
    this.landmark,
    this.area,
    this.city,
    this.pincode,
    this.addressType,
  });
}
