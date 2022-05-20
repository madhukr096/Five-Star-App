import 'package:five_star/grocery/groceryHomepage.dart';
import 'package:five_star/screens/Homepage.dart';
import 'package:five_star/screens/myprofile/my_profile.dart';
import 'package:five_star/screens/review_cart/review_cart.dart';
import 'package:five_star/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

import '../Food/foodHomePage.dart';

class DrawerSide extends StatelessWidget {
  const DrawerSide({Key? key}) : super(key: key);

  Widget listTile({icon, title, onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        size: 32,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.black54),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xffd1ad17),
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white54,
                    radius: 43,
                    child: CircleAvatar(
                      backgroundColor: Colors.yellow,
                      backgroundImage: NetworkImage(
                          "https://www.pngall.com/wp-content/uploads/5/User-Profile-PNG-Free-Image.png"),
                      radius: 40,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hello! User',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      /*Container(
                        height: 30,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => WelcomeScreen()),
                            );
                          },
                          child: Text('Sign Out'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(
                              width: 2,
                            ),
                          ),
                        ),
                      ),*/
                    ],
                  ),
                ],
              ),
            ),
            listTile(
                icon: Icons.home_outlined,
                title: "Home",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                }),
            listTile(
                icon: Icons.person_outline,
                title: "My Profile",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyProfile(),
                    ),
                  );
                }),
            listTile(icon: Icons.favorite_outline, title: "Wishlist"),
            listTile(icon: Icons.shop, title: "My Order"),
            listTile(
                icon: Icons.add_shopping_cart,
                title: "Cart",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ReviewCart(),
                    ),
                  );
                }),
            listTile(
                icon: Icons.shop,
                title: "Grocery",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => GroceryHomeScreen(),
                    ),
                  );
                }),
            listTile(
                icon: Icons.shop,
                title: "Food",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FoodHomeScreen(),
                    ),
                  );
                }),
            listTile(icon: Icons.notifications_outlined, title: "Notification"),
            listTile(icon: Icons.place_outlined, title: "My Address"),
            listTile(icon: Icons.star_outline, title: "Ratings & Reviews"),
            listTile(
                icon: Icons.privacy_tip_outlined, title: "Privacy & Security"),
            listTile(
                icon: Icons.logout_outlined,
                title: "SignOut",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => WelcomeScreen(),
                    ),
                  );
                }),
            Container(
              height: 350,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Customer Support'),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("Call us:"),
                      SizedBox(
                        width: 10,
                      ),
                      Text("+91-"),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text("Mail us:"),
                        SizedBox(
                          width: 10,
                        ),
                        Text("fivestar@gmail.com"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
