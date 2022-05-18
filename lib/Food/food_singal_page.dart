import 'package:five_star/screens/product_overview.dart';
import 'package:flutter/material.dart';

import 'foodHomePage.dart';

class FoodSingalPage extends StatelessWidget {
  final String productImage;
  final String productName;
  final Function onTap;
  FoodSingalPage({
    required this.productImage,
    required this.productName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            height: 185,
            width: 165,
            decoration: BoxDecoration(
              color: Color(0xffd9dad9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FoodHomeScreen()));
                  },
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    child: Image.network(productImage),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(productName,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
