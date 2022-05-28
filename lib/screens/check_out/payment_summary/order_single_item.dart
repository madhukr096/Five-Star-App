import 'package:five_star/config/color.dart';
import 'package:five_star/providers/check_out_provider.dart';
import 'package:five_star/providers/review_cart_provider.dart';
import 'package:five_star/screens/check_out/delivery_details/single_delivery_item.dart';
import 'package:five_star/screens/check_out/order/my_order.dart';
import 'package:five_star/screens/check_out/payment_summary/order_item.dart';
import 'package:flutter/material.dart';
import 'package:five_star/widgets/count.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class OrderSingleItem extends StatefulWidget {
  bool isBool = false;
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
  final VoidCallback? onDelete;
  OrderSingleItem({
    this.onDelete,
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

  @override
  State<OrderSingleItem> createState() => _OrderSingleItemState();
}

enum paymentType {
  Cash_on_Delivery,
  UPI,
}

class _OrderSingleItemState extends State<OrderSingleItem> {
  late ReviewCartProvider reviewCartProvider;

  @override
  Widget build(BuildContext context) {
    var myType = paymentType.Cash_on_Delivery;
    CheckOutProvider deliveryAddreesProvider = Provider.of(context);
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    deliveryAddreesProvider.getDeliveryAddrressData();
    reviewCartProvider.getReviewCartData();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Payment Summary",
            style: TextStyle(
              color: textColor,
              fontSize: 18,
            ),
          ),
        ),
        bottomNavigationBar: ListTile(
          title: Text("Total Amount"),
          subtitle: Text(
            widget.total,
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
                if (myType == paymentType.Cash_on_Delivery) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyOrder(),
                    ),
                  );
                }
              },
              child: Text(
                "Place order",
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
                      "\ ${widget.total_price}",
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
                      "\ ${widget.shipping_charge}",
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
                      "\ ${widget.discount}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Text("Payment Options"),
                  ),
                  RadioListTile(
                    value: paymentType.Cash_on_Delivery,
                    groupValue: myType,
                    title: Text("Cash On Delivery"),
                    onChanged: (value) {
                      setState(() {
                        myType = paymentType.Cash_on_Delivery;
                      });
                    },
                  ),
                  RadioListTile(
                    value: paymentType.UPI,
                    groupValue: myType,
                    title: Text("UPI"),
                    onChanged: (value) {
                      setState(
                        () {
                          myType = paymentType.UPI;
                        },
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ));
  }
}
