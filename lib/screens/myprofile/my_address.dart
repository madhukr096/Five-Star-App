import 'package:five_star/config/color.dart';
import 'package:five_star/providers/check_out_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../check_out/add_delivery_address/add_delivery_address.dart';
import '../check_out/delivery_details/single_delivery_item.dart';

class MyAddress extends StatefulWidget {
  MyAddress({Key? key}) : super(key: key);

  @override
  State<MyAddress> createState() => _MyAddressState();
}

class _MyAddressState extends State<MyAddress> {
  @override
  Widget build(BuildContext context) {
    CheckOutProvider deliveryAddreesProvider = Provider.of(context);
    deliveryAddreesProvider.getDeliveryAddrressData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "My Address",
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
      body: ListView(
        children: [
          ListTile(
            title: Text("My Location"),
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
        ],
      ),
    );
  }
}
