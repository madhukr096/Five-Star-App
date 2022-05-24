import 'package:five_star/Food/foodHomePage.dart';
import 'package:five_star/config/color.dart';
import 'package:five_star/providers/user_provider.dart';
import 'package:five_star/screens/drawer.dart';
import 'package:five_star/Food/food_singal_page.dart';
import 'package:five_star/screens/product_overview.dart';
import 'package:five_star/grocery/grocery_singal_page.dart';
import 'package:five_star/screens/search/search.dart';
import 'package:flutter/material.dart';
import 'package:five_star/screens/singal_product.dart';
import 'package:provider/provider.dart';
import '../grocery/groceryHomepage.dart';
import '../providers/product_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ProductProvider productProvider;
  late UserProvider userProvider;
  Widget _buildHomePage(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Five star',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              GrocerySingalPage(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => GroceryHomeScreen()));
                  },
                  productImage:
                      'https://images.unsplash.com/photo-1542838132-92c53300491e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Z3JvY2VyeXxlbnwwfHwwfHw%3D&w=1000&q=80',
                  productName: 'Grocery'),
              FoodSingalPage(
                productImage:
                    'https://images.freekaamaal.com/post_images/1606817930.jpg',
                productName: 'Food',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FoodHomeScreen()));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    UserProvider userProvider = Provider.of(context);
    userProvider.getUserData();
    return Scaffold(
      backgroundColor: Color(0xffccbcbcb),
      drawer: DrawerSide(userProvider),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Home',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
            )),
        backgroundColor: Color(0xffd6b738),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://indian-retailer.s3.ap-south-1.amazonaws.com/s3fs-public/article6229.jpg'),
                ),
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 130, bottom: 10),
                            child: Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Color(0xffd1ad17),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50),
                                  bottomLeft: Radius.circular(50),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'FS',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    shadows: [
                                      BoxShadow(
                                        color: Colors.green,
                                        blurRadius: 10,
                                        offset: Offset(3, 3),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
            _buildHomePage(context),
          ],
        ),
      ),
    );
  }
}
