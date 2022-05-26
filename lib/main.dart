import 'dart:async';
import 'package:five_star/providers/auth_provider.dart';
import 'package:five_star/providers/check_out_provider.dart';
import 'package:five_star/providers/product_provider.dart';
import 'package:five_star/providers/review_cart_provider.dart';
import 'package:five_star/providers/user_provider.dart';
import 'package:five_star/providers/wish_list.dart';
import 'package:five_star/screens/Homepage.dart';
import 'package:five_star/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:five_star/Food/foodHomepage.dart';
import 'package:provider/provider.dart';
import 'package:five_star/auth/sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider<ReviewCartProvider>(
          create: (context) => ReviewCartProvider(),
        ),
        ChangeNotifierProvider<WishListProvider>(
          create: (context) => WishListProvider(),
        ),
        ChangeNotifierProvider<CheckOutProvider>(
          create: (context) => CheckOutProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.deepOrangeAccent),
        home: splashscreen(),
      ),
    );
  }
}

class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    Timer(
        Duration(
          seconds: 3,
        ), () {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => WelcomeScreen(),
              ));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ));
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(tag: 'logo', child: Image.asset('assets/images/logo.png')),
      ),
    );
  }
}
