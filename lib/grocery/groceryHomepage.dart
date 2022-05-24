import 'package:five_star/grocery/single_grocery_product.dart';
import 'package:five_star/screens/drawer.dart';
import 'package:five_star/screens/product_overview.dart';
import 'package:five_star/screens/review_cart/review_cart.dart';
import 'package:five_star/screens/search/search.dart';
import 'package:flutter/material.dart';
import 'package:five_star/screens/singal_product.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';

class GroceryHomeScreen extends StatefulWidget {
  const GroceryHomeScreen({Key? key}) : super(key: key);

  @override
  State<GroceryHomeScreen> createState() => _GroceryHomeScreenState();
}

class _GroceryHomeScreenState extends State<GroceryHomeScreen> {
  late ProductProvider productProvider;

  Widget _buildGroceryProduct1(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Fresh Order',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Search(
                        search: productProvider.getGroceryProductDataList,
                      ),
                    ),
                  );
                },
                child: Text(
                  'View all',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getGroceryProductDataList.map(
              (GroceryProductData) {
                return SingalGroceryProduct(
                  onTap: () {},
                  productId: GroceryProductData.productId,
                  productImage: GroceryProductData.productImage,
                  productName: GroceryProductData.productName,
                  productDetails: GroceryProductData.productDetails,
                  price: GroceryProductData.productPrice,
                  //  productQuantity: GroceryProductData.productQuantity,
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildGroceryProduct2(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Grocery',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Search(
                        search: productProvider.getGroceryProduct1DataList,
                      ),
                    ),
                  );
                },
                child: Text(
                  'View all',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getGroceryProduct1DataList.map(
              (GroceryProduct1Data) {
                return SingalGroceryProduct(
                  onTap: () {},
                  productImage: GroceryProduct1Data.productImage,
                  productName: GroceryProduct1Data.productName,
                  productDetails: GroceryProduct1Data.productDetails,
                  price: GroceryProduct1Data.productPrice,
                  productId: GroceryProduct1Data.productId,
                  // productQuantity: GroceryProduct1Data.productQuantity,
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildGroceryProduct3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'New Order',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Search(
                        search: productProvider.getGroceryProduct2DataList,
                      ),
                    ),
                  );
                },
                child: Text(
                  'View all',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getGroceryProduct2DataList.map(
              (GroceryProduct2Data) {
                return SingalGroceryProduct(
                  onTap: () {},
                  productImage: GroceryProduct2Data.productImage,
                  productName: GroceryProduct2Data.productName,
                  productDetails: GroceryProduct2Data.productDetails,
                  price: GroceryProduct2Data.productPrice,
                  productId: GroceryProduct2Data.productId,
                  //productQuantity: GroceryProduct2Data.productQuantity,
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.fatchGroceryProductData();
    productProvider.fatchGroceryProduct1Data();
    productProvider.fatchGroceryProduct2Data();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    return Scaffold(
      backgroundColor: Color(0xffccbcbcb),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Grocery',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
            )),
        actions: [
          CircleAvatar(
            radius: 15,
            backgroundColor: Color(0xffd4d181),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Search(
                      search: productProvider.getAllProductSearch,
                    ),
                  ),
                );
              },
              icon: Icon(
                Icons.search,
                size: 17,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Color(0xffd4d181),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ReviewCart()),
                  );
                },
                icon: Icon(
                  Icons.shopping_cart,
                  size: 17,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
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
                      'https://images.unsplash.com/photo-1542838132-92c53300491e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Z3JvY2VyeXxlbnwwfHwwfHw%3D&w=1000&q=80'),
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
                          Text(
                            '30% OFF',
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.green[100],
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              'On all Grocery Products',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
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
            _buildGroceryProduct1(context),
            _buildGroceryProduct2(context),
            _buildGroceryProduct3(),
          ],
        ),
      ),
    );
  }
}
