import 'package:flutter/material.dart';
import 'package:five_star/widgets/costom_text_field.dart';
import '../../../config/color.dart';

class AddDeliveryAddress extends StatefulWidget {
  @override
  State<AddDeliveryAddress> createState() => _AddDeliveryAddressState();
}

enum AddressType {
  Home,
  Work,
  Other,
}

class _AddDeliveryAddressState extends State<AddDeliveryAddress> {
  var myType = AddressType.Home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Add Delivery Address",
          style: TextStyle(
            color: textColor,
            fontSize: 18,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        height: 48,
        child: MaterialButton(
          onPressed: () {},
          child: Text(
            "Add Address",
            style: TextStyle(
              color: textColor,
            ),
          ),
          color: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView(
          children: [
            CostomTextField(
              labText: "First Name",
            ),
            CostomTextField(
              labText: "Last Name",
            ),
            CostomTextField(
              labText: "Mobile Number",
            ),
            CostomTextField(
              labText: "Alternative Mobile Number",
            ),
            CostomTextField(
              labText: "Home Number",
            ),
            CostomTextField(
              labText: "Street",
            ),
            CostomTextField(
              labText: "Landmark",
            ),
            CostomTextField(
              labText: "Area",
            ),
            CostomTextField(
              labText: "City",
            ),
            CostomTextField(
              labText: "Pincode",
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 47,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Set location"),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text("Address Type"),
            ),
            RadioListTile(
              value: AddressType.Home,
              groupValue: myType,
              title: Text("Home"),
              onChanged: (value) {
                setState(() {
                  myType = AddressType.Home;
                });
              },
              secondary: Icon(
                Icons.home,
                color: textColor,
              ),
            ),
            RadioListTile(
              value: AddressType.Work,
              groupValue: myType,
              title: Text("Work"),
              onChanged: (value) {
                setState(() {
                  myType = AddressType.Work;
                });
              },
              secondary: Icon(
                Icons.work,
                color: textColor,
              ),
            ),
            RadioListTile(
              value: AddressType.Other,
              groupValue: myType,
              title: Text("Other"),
              onChanged: (value) {
                setState(() {
                  myType = AddressType.Other;
                });
              },
              secondary: Icon(
                Icons.devices_other,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
