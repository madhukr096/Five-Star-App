import 'package:five_star/config/color.dart';
import 'package:flutter/material.dart';

class Notify extends StatelessWidget {
  const Notify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: primaryColor,
        title: Text(
          "Notification",
          style: TextStyle(color: textColor, fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Text("Empty Notifications"),
          ),
        ],
      ),
    );
  }
}
