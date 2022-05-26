import 'package:five_star/models/review_cart_model.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  late bool isTrue;
  final ReviewCartModel e;
  OrderItem({required this.e});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        e.cartImage,
        width: 60,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            e.cartName,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          /*Text(
            "",
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),*/
          Text(
            "RS : ${e.cartPrice}",
          ),
        ],
      ),
      subtitle: Text(e.cartQuantity.toString()),
    );
  }
}
