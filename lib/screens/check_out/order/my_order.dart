import 'package:five_star/config/color.dart';
import 'package:five_star/providers/check_out_provider.dart';
import 'package:five_star/providers/review_cart_provider.dart';
import 'package:five_star/screens/Homepage.dart';
import 'package:five_star/screens/check_out/payment_summary/order_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../delivery_details/single_delivery_item.dart';

class MyOrder extends StatefulWidget {
  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    CheckOutProvider deliveryAddreesProvider = Provider.of(context);
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    deliveryAddreesProvider.getDeliveryAddrressData();
    reviewCartProvider.getReviewCartData();
    double discount;
    double shippingCharge;
    double discountValue;
    double total = 0;
    double totalPrice = reviewCartProvider.getTotalPrice();
    if (totalPrice > 1000) {
      discount = 30;
      shippingCharge = 0;
      discountValue = (totalPrice * discount) / 100;
      total = totalPrice - discountValue + shippingCharge;
    } else if (totalPrice > 500) {
      discount = 20;
      shippingCharge = 20;
      discountValue = (totalPrice * discount) / 100;
      total = totalPrice - discountValue + shippingCharge;
    } else {
      discount = 0;
      shippingCharge = 40;
      discountValue = (totalPrice * discount) / 100;
      total = totalPrice - discountValue + shippingCharge;
    }
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
      bottomNavigationBar: ListTile(
        title: Text(""),
        subtitle: Text(
          " ",
          style: TextStyle(
            color: Colors.green[900],
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Text(
              "Return Home",
              style: TextStyle(
                color: textColor,
              ),
            ),
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Text("Thank you for Buying"),
                Divider(
                  color: Colors.black,
                ),
                Column(
                  children: deliveryAddreesProvider.getDeliveryAddressList
                      .map<Widget>((e) {
                    return SingleDeliveryItem(
                      title: '${e.firstName}, ${e.lastName}',
                      address:
                          "${e.homeNo},${e.street},${e.landmark},${e.area},${e.city},${e.pincode}",
                      number: '${e.mobileNo}',
                      addressType: e.addressType == "addressType.Home"
                          ? "Home"
                          : e.addressType == "addressType.Work"
                              ? "Work"
                              : "Other",
                    );
                  }).toList(),
                ),
                Divider(),
                ExpansionTile(
                  children: reviewCartProvider.getReviewCartDataList.map((e) {
                    return OrderItem(
                      e: e,
                    );
                  }).toList(),
                  title: Text(
                      "Order Item  ${reviewCartProvider.getReviewCartDataList.length}"),
                ),
                Divider(),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Sub Total",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Text(
                    "\ $totalPrice",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Shipping Charge",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  trailing: Text(
                    "\ $shippingCharge",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Discount",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  trailing: Text(
                    "\ $discount",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Total Amount",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  trailing: Text(
                    "\ $total",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
