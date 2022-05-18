import 'package:five_star/otp.dart';
import 'package:flutter/material.dart';
import 'package:five_star/otp.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('Login',style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Center(
                  child: Text(
                    'Phone Authentication',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40, right: 10, left: 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    prefix: Padding(
                      padding: EdgeInsets.all(4),
                      child: Text('+91'),
                    ),
                  ),
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  controller: _controller,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            child: FlatButton(
              color: Color.fromRGBO(255, 110, 64, 1),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => OTPScreen(_controller.text)),
                );
              },
              child: Text(
                'Next',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
