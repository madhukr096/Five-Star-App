import 'package:firebase_auth/firebase_auth.dart';
import 'package:five_star/screens/Homepage.dart';
import 'package:five_star/services/user_services.dart';
import 'package:flutter/material.dart';

import '../Food/foodHomepage.dart';

class AuthProvider with ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  late String smsOtp;
  late String verificationId;
  String error = '';
  UserServices _userServices = UserServices();

  Future<void> verifyPhone(BuildContext context, String number) async {
    final PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential credential) async {
      await _auth.signInWithCredential(credential);
    };
    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException e) {
      print(e.code);
    };
    final PhoneCodeSent smsOtpSend = (String verId, int? resendToken) async {
      this.verificationId = verId;
      smsOtpDialog(context, number);
    };

    try {
      _auth.verifyPhoneNumber(
          phoneNumber: number,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: smsOtpSend,
          codeAutoRetrievalTimeout: (String verId) {
            this.verificationId = verId;
          });
    } catch (e) {
      print(e);
    }
  }

  Future smsOtpDialog(BuildContext context, String number) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Column(
              children: [
                Text('Verification Code'),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Enter 6 digit OTP recived as SMS',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            content: Container(
              height: 85,
              child: TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                maxLength: 6,
                onChanged: (value) {
                  this.smsOtp = value;
                },
              ),
            ),
            actions: [
              FlatButton(
                  onPressed: () async {
                    try {
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: verificationId, smsCode: smsOtp);
                      final User? user =
                          (await _auth.signInWithCredential(credential)).user;

                      _createUser(id: user!.uid, number: user.phoneNumber);
                      if (user != null) {
                        Navigator.of(context).pop();

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                      } else {
                        print('login Failed');
                      }
                    } catch (e) {
                      this.error = 'Invalid OTP';
                      notifyListeners();
                      print(e.toString());
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(
                    'DONE',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  )),
            ],
          );
        });
  }

  void _createUser({required String id, required number}) {
    _userServices.creteToUserData({
      'id': id,
      'number': number,
    });
  }
}
