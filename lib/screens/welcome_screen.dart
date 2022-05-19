import 'package:five_star/login.dart';
import 'package:five_star/screens/location.dart';
import 'package:five_star/screens/on_boarding_screen.dart';
import 'package:five_star/screens/product_overview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../auth/sign_in.dart';
import '../providers/auth_provider.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);

    bool _validPhoneNumber = false;
    var _phoneNumberController = TextEditingController();
    void showBottomSheet(context) {
      bool _validPhoneNumber = false;
      showModalBottomSheet(
        context: context,
        builder: (context) => StatefulBuilder(
          builder: (context, StateSetter myState) {
            return Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: auth.error == 'Invalid OTP' ? true : false,
                        child: Container(
                          child: Column(
                            children: [
                              Text(auth.error),
                              SizedBox(
                                height: 3,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Enter your phone number to process',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          prefixText: '+91 ',
                          labelText: '10 digit mobile number',
                        ),
                        autofocus: true,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        onChanged: (value) {
                          if (value.length == 10) {
                            myState(() {
                              _validPhoneNumber = true;
                            });
                          } else {
                            myState(() {
                              _validPhoneNumber = false;
                            });
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: AbsorbPointer(
                              absorbing: _validPhoneNumber ? false : true,
                              child: FlatButton(
                                color: _validPhoneNumber
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey,
                                child: Text(
                                  _validPhoneNumber
                                      ? 'CONTINUE'
                                      : 'ENTER PHONE NUMBER',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  String number =
                                      '+91 ${_phoneNumberController.text}';
                                  auth.verifyPhone(context, number);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            );
          },
        ),
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            /* Positioned(
              right: 0.0,
              top: 10.0,
              child: FlatButton(
                child: Text(
                  'SKIP',
                  style: TextStyle(
                    color: Colors.deepOrangeAccent,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductOverView(),
                    ),
                  );
                },
              ),
            ),*/
            Column(
              children: [
                Expanded(
                  child: onBoardingScreen(),
                ),
                Text(
                  'Ready to order from your nearest shop?',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
               /* FlatButton(
                  color: Colors.deepOrangeAccent,
                  child: Text(
                    'Set Delivery Location',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LocationScreen(),
                      ),
                    );
                  },
                ),*/
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  child: RichText(
                    text: TextSpan(
                      text: 'Already a customer ?',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    //  showBottomSheet(context);
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignIn()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
