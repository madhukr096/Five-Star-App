/*import 'package:five_star/config/color.dart';
import 'package:five_star/models/order_item.dart';
import 'package:five_star/providers/check_out_provider.dart';
import 'package:five_star/providers/order_provider.dart';
import 'package:five_star/providers/review_cart_provider.dart';
import 'package:five_star/screens/Homepage.dart';
import 'package:five_star/screens/check_out/payment_summary/order_item.dart';
import 'package:five_star/screens/check_out/payment_summary/order_single_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../delivery_details/single_delivery_item.dart';

class MyOrder extends StatefulWidget {
  final total;
  MyOrder({this.total});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

late OrderProvider orderProvider;

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    orderProvider = Provider.of(context);
    orderProvider.getReviewCartData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "My Order",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          ListView.builder(
            itemCount: orderProvider.getOrderDataList.length,
            itemBuilder: (context, index) {
              OrderModel data = orderProvider.getOrderDataList[index];
              return Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  OrderSingleItem(
                    product_Image: data.product_Image,
                    product_Name: data.product_Name,
                    product_Qunaity: data.product_Qunaity,
                    product_price: data.product_price,
                    addressType: data.addressType,
                    area: data.area,
                    city: data.city,
                    discount: data.discount,
                    firstName: data.firstName,
                    homeNo: data.homeNo,
                    landmark: data.landmark,
                    mobileNo: data.mobileNo,
                    lastName: data.lastName,
                    pincode: data.pincode,
                    shipping_charge: data.shipping_charge,
                    street: data.street,
                    total_price: data.total_price,
                    total: data.total,
                    onDelete: () {},
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}*/
