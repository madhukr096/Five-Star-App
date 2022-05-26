import 'package:five_star/config/color.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "About FiveStar",
          style: TextStyle(
            color: textColor,
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/logo.png',
          ),
          Text(
            "FIVE STAR",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            "FIVE STAR",
          ),
        ],
      ),
    );
  }
}
