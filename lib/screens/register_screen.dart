import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Hero(
                tag: 'logo',
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 250,
                  width: 100,
                  alignment: Alignment.center,
                )),
            TextField(),
            TextField(),
            TextField(),
            TextField(),
          ],
        ),
      ),
    );
  }
}
