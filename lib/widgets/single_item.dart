import 'package:five_star/config/color.dart';
import 'package:five_star/providers/review_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:five_star/widgets/count.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class SingleItem extends StatefulWidget {
  bool isBool = false;
  String productImage;
  String productName;
  String productId;
  int? productQuatity;
  String? productDetails;
  String productPrice;
  final VoidCallback? onDelete;
  SingleItem({
    this.onDelete,
    this.productDetails,
    required this.isBool,
    required this.productImage,
    required this.productName,
    required this.productId,
    this.productQuatity,
    required this.productPrice,
  });

  @override
  State<SingleItem> createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  var count;
  getCount() {
    setState(() {
      count = widget.productQuatity;
    });
  }

  late ReviewCartProvider reviewCartProvider;
  /*@override
  void initState() {
    getCount();
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    getCount();
    reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    reviewCartProvider.getReviewCartData();
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
                    child: Image.network(widget.productImage),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: widget.isBool == false
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            widget.productName,
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\RS : ${widget.productPrice}',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      widget.isBool == false
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
                                      '${widget.productPrice}',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  /* Center(
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      size: 20,
                                      color: Colors.black,
                                    ),
                                  )*/
                                ],
                              ),
                            )
                          : Text('${widget.productPrice}'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  padding: widget.isBool == false
                      ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                      : EdgeInsets.only(left: 15, right: 15),
                  child: widget.isBool == false
                      ? Count(
                          productName: widget.productName,
                          productId: widget.productId,
                          productImage: widget.productImage,
                          productPrice: widget.productPrice)
                      /* Container(
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
                                  Icons.remove,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                Text(
                                  "ADD",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                Icon(
                                  Icons.add,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        )*/
                      : Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: widget.onDelete,
                                child: Icon(
                                  Icons.delete,
                                  size: 30,
                                  color: Colors.black54,
                                ),
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
                                      InkWell(
                                        onTap: () {
                                          if (count == 1) {
                                            Fluttertoast.showToast(
                                                msg: "You reach minimum limit");
                                          } else {
                                            setState(() {
                                              count--;
                                            });
                                            reviewCartProvider
                                                .updateReviewCartData(
                                                    cartImage:
                                                        widget.productImage,
                                                    cartName:
                                                        widget.productName,
                                                    cartId: widget.productId,
                                                    cartPrice:
                                                        widget.productPrice,
                                                    cartQuantity: count);
                                          }
                                        },
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.black,
                                          size: 20,
                                        ),
                                      ),
                                      Text(
                                        '$count',
                                        //"${widget.productQuatity}",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if (count >= 1) {
                                            setState(() {
                                              // widget.productQuatity+=1;
                                              count++;
                                            });
                                            reviewCartProvider
                                                .updateReviewCartData(
                                                    cartImage:
                                                        widget.productImage,
                                                    cartName:
                                                        widget.productName,
                                                    cartId: widget.productId,
                                                    cartPrice:
                                                        widget.productPrice,
                                                    cartQuantity: count);
                                          }
                                        },
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.black,
                                          size: 20,
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
              ),
            ],
          ),
        ),
        widget.isBool == false
            ? Container()
            : Divider(
                height: 1,
                color: Colors.black54,
              ),
      ],
    );
  }
}
