import 'package:five_star/models/delivery_address_model.dart';
import 'package:five_star/providers/check_out_provider.dart';
import 'package:five_star/screens/check_out/add_delivery_address/add_delivery_address.dart';
import 'package:five_star/screens/check_out/delivery_details/single_delivery_item.dart';
import 'package:five_star/screens/check_out/payment_summary/payment_summary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/color.dart';

class DeliveryDetails extends StatelessWidget {
  bool isAddress = false;
  @override
  Widget build(BuildContext context) {
    CheckOutProvider deliveryAddreesProvider = Provider.of(context);
    deliveryAddreesProvider.getDeliveryAddrressData();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Delivery Details",
            style: TextStyle(
              color: textColor,
              fontSize: 18,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddDeliveryAddress(),
              ),
            );
          },
        ),
        bottomNavigationBar: Container(
          //width: 160,
          height: 40,
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: MaterialButton(
            child: deliveryAddreesProvider.getDeliveryAddressList.isEmpty
                ? Text("Add new Address")
                : Text("Payment Summary"),
            onPressed: () {
              deliveryAddreesProvider.getDeliveryAddressList == null
                  ? Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddDeliveryAddress()))
                  : Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PaymentSummary()));
            },
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                30,
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            ListTile(
              title: Text("Deliver To"),
              leading: Image.asset(
                'assets/images/location.png',
                height: 30,
              ),
            ),
            Divider(
              height: 1,
            ),
            deliveryAddreesProvider.getDeliveryAddressList.isEmpty
                ? Container(
                    child: Center(
                      child: Text("NO DATA"),
                    ),
                  )
                : Column(
                    children:
                        deliveryAddreesProvider.getDeliveryAddressList.map((e) {
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

                    /*children: [
                deliveryAddreesProvider.getDeliveryAddressList.isEmpty
                    ? Container(
                        child: Center(
                          child: Text("NO DATA"),
                        ),
                      )
                    : SingleDeliveryItem(
                        title: 'MADHU K R',
                        address:
                            'LVP Boys Hostel, Dairy Circle, Hassan  Pincode -573201',
                        number: '7259741181',
                        addressType: 'Home',
                      ),
              ],*/
                  )
          ],
        ));
  }
}
