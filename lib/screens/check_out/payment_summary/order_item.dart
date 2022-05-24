import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  late bool isTrue;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        "https://images.freekaamaal.com/post_images/1606817930.jpg",
        width: 60,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "product_Name",
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          Text(
            "1kg-20",
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          Text(
            "20",
          ),
        ],
      ),
      subtitle: Text("5"),
    );
  }
}
