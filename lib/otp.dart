import 'package:firebase_auth/firebase_auth.dart';
import 'package:five_star/Food/foodHomepage.dart';
import 'package:five_star/screens/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  OTPScreen(this.phone);
  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();
  late String _verficationCode;
  final TextEditingController _pinputController = TextEditingController();
  final FocusNode _pinputFocusNode = FocusNode();
  final BoxDecoration pinputDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          'OTP Verification',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Center(
              child: Text(
                'Verify +91-${widget.phone}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Pinput(
              length: 6,
              //fieldsCount:4,
              // textStyle:const TextStyle (fontSize:25.0,color:Colors.white),
              //  eachFieldWidth:40.0,
              // eachFieldHieght:55.0,
              //onSubmit:(String pin)=>_showneckBar(pin),
              focusNode: _pinputFocusNode,
              controller: _pinputController,
              //  submittedFieldDecoration:pinputDecoration,
              // selectedFieldDecoration:pinputDecoration,
              // followingFieldDecoration:pinputDecoration,
              pinAnimationType: PinAnimationType.fade,
              onSubmitted: (pin) async {
                try {
                  await FirebaseAuth.instance
                      .signInWithCredential(PhoneAuthProvider.credential(
                          verificationId: _verficationCode, smsCode: pin))
                      .then((value) async {
                    if (value.user != null) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                          (route) => false);
                    }
                  });
                } catch (e) {
                  FocusScope.of(context).unfocus();
                  // _scafoldKey.currentState
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Invalid OTP')));
                }
              },
            ),
          )
        ],
      ),
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                  (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, resendToken) {
          setState(() {
            _verficationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verficationID) {
          setState(() {
            _verficationCode = verficationID;
          });
        },
        timeout: Duration(seconds: 60));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyPhone();
  }
}
