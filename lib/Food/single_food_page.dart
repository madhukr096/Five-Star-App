import 'package:five_star/screens/product_overview.dart';
import 'package:five_star/widgets/count.dart';
import 'package:flutter/material.dart';

class SingalFoodProduct extends StatelessWidget {
  final String productImage;
  final String productName;
  final String productDetails;
  final Function onTap;
  final int price;
  final String productId;

  SingalFoodProduct(
      {required this.productImage,
      required this.productName,
      required this.productDetails,
      required this.onTap,
      required this.price,
      required this.productId});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            height: 230,
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
                        builder: (context) => ProductOverView(
                              product_Image: productImage,
                              product_Name: productName,
                              product_details: productDetails,
                              product_price: '$price',
                            )));
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
                        Text(
                          productDetails,
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 25,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      '$price',
                                      style: TextStyle(
                                        fontSize: 11,
                                      ),
                                    )),
                                    Center(
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Count(
                              productId: productId,
                              productName: productName,
                              productImage: productImage,
                              productPrice: price,
                              productQuality: '1',
                            ),
                          ],
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
