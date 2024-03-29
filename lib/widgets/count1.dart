import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:five_star/providers/review_cart_provider.dart';
import 'package:five_star/screens/review_cart/review_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Count1 extends StatefulWidget {
  late String productImage;
  late String productName;
  late String productId;
  late int productPrice;
  Count1({
    required this.productName,
    required this.productId,
    required this.productImage,
    required this.productPrice,
  });
  @override
  State<Count1> createState() => _Count1State();
}

class _Count1State extends State<Count1> {
  int count = 1;
  bool isTrue = false;

  getAddQuantity() {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("MyReviewCart")
        .doc(widget.productId)
        .get()
        .then((value) => {
              if (this.mounted)
                {
                  if (value.exists)
                    {
                      setState(() {
                        count = value.get("cartQuantity");
                        isTrue = value.get("isAdd");
                      })
                    }
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    getAddQuantity();
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    return Container(
      height: 25,
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: isTrue == true
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    if (count == 1) {
                      setState(() {
                        isTrue = false;
                      });
                      reviewCartProvider.reviewCartDelete(widget.productId);
                    } else if (count > 1) {
                      setState(() {
                        count--;
                      });
                      reviewCartProvider.updateReviewCartData(
                        cartId: widget.productId,
                        cartImage: widget.productImage,
                        cartName: widget.productName,
                        cartPrice: '',
                        cartQuantity: count,
                      );
                    }
                  },
                  child: Icon(
                    Icons.remove,
                    size: 15,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "$count",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      count++;
                    });
                    reviewCartProvider.updateReviewCartData(
                      cartId: widget.productId,
                      cartImage: widget.productImage,
                      cartName: widget.productName,
                      cartPrice: '',
                      cartQuantity: count,
                    );
                  },
                  child: Icon(
                    Icons.add,
                    size: 15,
                    color: Colors.black,
                  ),
                ),
              ],
            )
          : Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    isTrue = true;
                  });
                  reviewCartProvider.addReviewCartData(
                    cartId: widget.productId,
                    cartImage: widget.productImage,
                    cartName: widget.productName,
                    cartPrice: '',
                    cartQuantity: count,
                  );
                },
                child: Text(
                  "ADD",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
    );
  }
}
