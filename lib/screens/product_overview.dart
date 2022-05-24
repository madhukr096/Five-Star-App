import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:five_star/config/color.dart';
import 'package:five_star/providers/wish_list.dart';
import 'package:five_star/screens/review_cart/review_cart.dart';
import 'package:five_star/widgets/count.dart';
import 'package:five_star/widgets/count1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum SinginCharacter { fill, outline }

class ProductOverView extends StatefulWidget {
  final String product_Name;
  final String product_Image;
  final String product_details;
  final String product_price;
  final String productId;
  final int productQuality;
  ProductOverView({
    required this.product_Image,
    required this.product_Name,
    required this.product_details,
    required this.product_price,
    required this.productId,
    required this.productQuality,
  });
  @override
  State<ProductOverView> createState() => _ProductOverViewState();
}

class _ProductOverViewState extends State<ProductOverView> {
  SinginCharacter _character = SinginCharacter.fill;

  Widget bonntonNavigatorBar({
    required Color iconColor,
    required Color backgroundColor,
    required Color color,
    required String title,
    required IconData iconData,
    final VoidCallback? onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(20),
          color: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 20,
                color: iconColor,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                title,
                style: TextStyle(color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool wishListBool = false;
  getWishListBool() {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("MyWishList")
        .get()
        .then((value) => {
              value.docs.forEach((element) {
                if (this.mounted) {
                  setState(() {
                    wishListBool = element.get("wishList");
                  });
                }
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    //getWishListBool();
    WishListProvider wishListProvider = Provider.of(context);
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bonntonNavigatorBar(
              backgroundColor: textColor,
              color: Colors.white70,
              iconColor: Colors.grey,
              title: "Add to WhishList",
              iconData: wishListBool == false
                  ? Icons.favorite_outline
                  : Icons.favorite,
              onTap: () {
                setState(() {
                  wishListBool = !wishListBool;
                });
                if (wishListBool == true) {
                  wishListProvider.addWishListData(
                    wishListId: widget.productId,
                    wishListImage: widget.product_Image,
                    wishListName: widget.product_Name,
                    wishListPrice: widget.product_price,
                    wishListQuantity: widget.productQuality,
                  );
                } else {
                  wishListProvider.deleteWishList(widget.productId);
                }
              }),
          bonntonNavigatorBar(
              backgroundColor: primaryColor,
              color: textColor,
              iconColor: Colors.white70,
              title: "Go to Cart",
              iconData: Icons.shop_outlined,
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ReviewCart()));
              }),
        ],
      ),
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          "Product Overview",
          style: TextStyle(color: textColor),
        ),
      ),
      body: Column(children: [
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                ListTile(
                  title: Text(widget.product_Name),
                  subtitle: Text(widget.product_details),
                ),
                Container(
                  height: 250,
                  padding: EdgeInsets.all(40),
                  child: Image.network(widget.product_Image),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: Text(
                    "Available Options",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: textColor, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: Colors.green[700],
                            ),
                            Radio(
                              value: SinginCharacter.fill,
                              groupValue: _character,
                              activeColor: Colors.green[700],
                              onChanged: (value) {
                                setState(() {
                                  _character:
                                  value;
                                });
                              },
                            ),
                          ],
                        ),
                        Text(widget.product_price),
                        Count(
                            productName: widget.product_Name,
                            productId: widget.productId,
                            productImage: widget.product_Image,
                            productPrice: widget.product_price),
                        /* Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 17,
                                color: primaryColor,
                              ),
                              Text(
                                "ADD",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),*/
                      ]),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About This Product",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "In marketing, a product is an object, or system, or service made available for consumer use as of the consumer demand; it is anything that can be offered to a market to satisfy the desire or need of a customer.",
                  style: TextStyle(
                    fontSize: 16,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
