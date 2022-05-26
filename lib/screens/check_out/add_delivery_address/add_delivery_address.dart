import 'package:five_star/providers/check_out_provider.dart';
import 'package:five_star/screens/check_out/google_map/google_map.dart';
import 'package:flutter/material.dart';
import 'package:five_star/widgets/costom_text_field.dart';
import '../../../config/color.dart';
import 'package:provider/provider.dart';

class AddDeliveryAddress extends StatefulWidget {
  @override
  State<AddDeliveryAddress> createState() => _AddDeliveryAddressState();
}

enum addressType {
  Home,
  Work,
  Other,
}

class _AddDeliveryAddressState extends State<AddDeliveryAddress> {
  var myType = addressType.Home;
  @override
  Widget build(BuildContext context) {
    CheckOutProvider checkOutProvider = Provider.of(context);
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
        child: checkOutProvider.isloading == false
            ? MaterialButton(
                onPressed: () {
                  checkOutProvider.validate(context, myType);
                },
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
              )
            : Center(
                child: CircularProgressIndicator(),
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
              controller: checkOutProvider.firstName,
            ),
            CostomTextField(
              labText: "Last Name",
              controller: checkOutProvider.lastName,
            ),
            CostomTextField(
              labText: "Mobile Number",
              controller: checkOutProvider.mobileNo,
            ),
            CostomTextField(
              labText: "Alternative Mobile Number",
              controller: checkOutProvider.alternativeMobileNo,
            ),
            CostomTextField(
              labText: "Home Number",
              controller: checkOutProvider.homeNo,
            ),
            CostomTextField(
              labText: "Street",
              controller: checkOutProvider.street,
            ),
            CostomTextField(
              labText: "Landmark",
              controller: checkOutProvider.landmark,
            ),
            CostomTextField(
              labText: "Area",
              controller: checkOutProvider.area,
            ),
            CostomTextField(
              labText: "City",
              controller: checkOutProvider.city,
            ),
            CostomTextField(
              labText: "Pincode",
              controller: checkOutProvider.pincode,
            ),
            InkWell(
              onTap: () {
                /*Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CostomGoogleMap(),
                  ),
                );*/
              },
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
              value: addressType.Home,
              groupValue: myType,
              title: Text("Home"),
              onChanged: (value) {
                setState(() {
                  myType = addressType.Home;
                });
              },
              secondary: Icon(
                Icons.home,
                color: textColor,
              ),
            ),
            RadioListTile(
              value: addressType.Work,
              groupValue: myType,
              title: Text("Work"),
              onChanged: (value) {
                setState(() {
                  myType = addressType.Work;
                });
              },
              secondary: Icon(
                Icons.work,
                color: textColor,
              ),
            ),
            RadioListTile(
              value: addressType.Other,
              groupValue: myType,
              title: Text("Other"),
              onChanged: (value) {
                setState(() {
                  myType = addressType.Other;
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
