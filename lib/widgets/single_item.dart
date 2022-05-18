import 'package:five_star/config/color.dart';
import 'package:flutter/material.dart';

class SingleItem extends StatelessWidget {
  bool isBool = false;
  String productImage;
  String productName;
  String productDetails;
  int productPrice;
  SingleItem({
    required this.isBool,
    required this.productImage,
    required this.productName,
    required this.productDetails,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  child: Center(
                    child: Image.network(productImage),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: isBool == false
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            productName,
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            productDetails,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      isBool == false
                          ? Container(
                              margin: EdgeInsets.only(right: 15),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              height: 25,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      '$productPrice\$',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      size: 20,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Text('$productPrice\$'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  padding: isBool == false
                      ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                      : EdgeInsets.only(left: 15, right: 15),
                  child: isBool == false
                      ? Container(
                          height: 25,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                Text(
                                  "ADD",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Column(
                          children: [
                            Icon(
                              Icons.delete,
                              size: 30,
                              color: Colors.black54,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 25,
                              width: 70,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                    Text(
                                      "ADD",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
        isBool == false
            ? Container()
            : Divider(
                height: 1,
                color: Colors.black54,
              ),
      ],
    );
  }
}
