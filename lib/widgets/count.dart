import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:five_star/providers/review_cart_provider.dart';
import 'package:five_star/screens/review_cart/review_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Count extends StatefulWidget {
  late String productImage;
  late String productName;
  late String productId;
  late int productPrice;
  Count({
    required this.productName,
    required this.productId,
    required this.productImage,
    required this.productPrice,
  });
  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 1;
  bool isTrue = false;

  getAddQuantity() {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("MyReviewCart")
        .get()
        .then((value) => {});
  }

  @override
  Widget build(BuildContext context) {
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
                    if (count > 1) {
                      setState(() {
                        count--;
                      });
                      if (count == 1) {
                        setState(() {
                          isTrue = false;
                        });
                      }
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
                    cartPrice: widget.productPrice,
                    cartQuantity: count,
                    isAdd: true,
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
