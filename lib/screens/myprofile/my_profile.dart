import 'package:five_star/config/color.dart';
import 'package:five_star/models/user_model.dart';
import 'package:five_star/providers/user_provider.dart';
import 'package:five_star/screens/about.dart';
import 'package:five_star/screens/drawer.dart';
import 'package:five_star/screens/myprofile/my_address.dart';
import 'package:five_star/screens/terms.dart';
import 'package:five_star/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  var userData;

  MyProfile({this.userData});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  late UserProvider userProvider;
  late UserModels userModels;
  Widget listTile({icon, title, onTap}) {
    return Column(
      children: [
        Divider(
          height: 1,
        ),
        ListTile(
          onTap: onTap,
          leading: Icon(icon),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffccbcbcb),
      //drawer: DrawerSide(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: primaryColor,
        title: Text(
          "MyProfile",
          style: TextStyle(color: textColor, fontSize: 18),
        ),
      ),
      // drawer: DrawerSide(userProvider: userProvider),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                color: primaryColor,
              ),
              Container(
                height: 600,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 250,
                          height: 80,
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.userData.userName,
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    widget.userData.userEmail,
                                  ),
                                ],
                              ),
                              /* CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.black,
                                child: CircleAvatar(
                                  radius: 15,
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.black,
                                  ),
                                  backgroundColor: scaffoldBackgroundColor,
                                ),
                              ),*/
                            ],
                          ),
                        ),
                      ],
                    ),
                    listTile(icon: Icons.shop_outlined, title: "My Orders"),
                    listTile(
                        icon: Icons.location_on_outlined,
                        title: "My Address",
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => MyAddress(),
                            ),
                          );
                        }),
                    listTile(
                        icon: Icons.person_outline, title: "Refer a Friends"),
                    listTile(
                        icon: Icons.file_copy_outlined,
                        title: "Terms & Conditions",
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => TermsAndCondition(),
                            ),
                          );
                        }),
                    listTile(
                        icon: Icons.policy_outlined, title: "Privacy Policy"),
                    listTile(
                        icon: Icons.add_chart,
                        title: "About",
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => About(),
                            ),
                          );
                        }),
                    listTile(
                        icon: Icons.exit_to_app_outlined,
                        title: "Logout",
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => WelcomeScreen(),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 30),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: primaryColor,
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.userData.userImage ??
                    "https://www.pngall.com/wp-content/uploads/5/User-Profile-PNG-Free-Image.png"),
                radius: 45,
                backgroundColor: scaffoldBackgroundColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
