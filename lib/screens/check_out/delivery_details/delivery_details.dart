import 'package:five_star/screens/check_out/add_delivery_address/add_delivery_address.dart';
import 'package:five_star/screens/check_out/delivery_details/single_delivery_item.dart';
import 'package:five_star/screens/check_out/payment_summary/payment_summary.dart';
import 'package:flutter/material.dart';

import '../../../config/color.dart';

class DeliveryDetails extends StatelessWidget {
  List<Widget> address = [
    SingleDeliveryItem(
      title: 'FIVE STAR',
      address: 'LVP Boys Hostel, Dairy Circle, Hassan  Pincode -573201',
      number: '7259741181',
      addressType: 'Home',
    ),
  ];
  bool isAddress = false;
  @override
  Widget build(BuildContext context) {
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
          onPressed: () {},
        ),
        bottomNavigationBar: Container(
          //width: 160,
          height: 40,
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: MaterialButton(
            child: address.isEmpty
                ? Text("Add new Address")
                : Text("Payment Summary"),
            onPressed: () {
              address == null
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
            Column(
              children: [
                address.isEmpty
                    ? Container()
                    : SingleDeliveryItem(
                        title: 'MADHU K R',
                        address:
                            'LVP Boys Hostel, Dairy Circle, Hassan  Pincode -573201',
                        number: '7259741181',
                        addressType: 'Home',
                      ),
              ],
            )
          ],
        ));
  }
}
