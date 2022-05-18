import 'package:five_star/widgets/single_item.dart';
import 'package:flutter/material.dart';

import '../../config/color.dart';

class ReviewCart extends StatelessWidget {
  const ReviewCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: Text("Total Amount"),
        subtitle: Text(
          "RS 200.00",
          style: TextStyle(
            color: Colors.green[900],
          ),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            child: Text("Submit"),
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                30,
              ),
            ),
            onPressed: () {},
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Review Cart",
          style: TextStyle(
            color: textColor,
            fontSize: 18,
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          /* SingleItem(
            isBool: true,
            productImage: '',
            productName: '',
            productDetails: '',
            productPrice: '',
          ),
          SingleItem(
            isBool: true,
            productImage: '',
            productName: '',
            productDetails: '',
            productPrice: '',
          ),
          SingleItem(
            isBool: true,
            productImage: '',
            productName: '',
            productDetails: '',
            productPrice: '',
          ),
          SingleItem(
            isBool: true,
            productImage: '',
            productName: '',
            productDetails: '',
            productPrice: '',
          ),*/
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
