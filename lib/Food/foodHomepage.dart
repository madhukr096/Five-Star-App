import 'package:five_star/food/single_food_page.dart';
import 'package:five_star/screens/drawer.dart';
import 'package:five_star/screens/product_overview.dart';
import 'package:five_star/screens/search/search.dart';
import 'package:flutter/material.dart';
import 'package:five_star/screens/singal_product.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';

class FoodHomeScreen extends StatefulWidget {
  const FoodHomeScreen({Key? key}) : super(key: key);

  @override
  State<FoodHomeScreen> createState() => _FoodHomeScreenState();
}

class _FoodHomeScreenState extends State<FoodHomeScreen> {
  late ProductProvider productProvider;

  Widget _buildFoodProduct1(context) {
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
                        search: productProvider.getFoodProductDataList,
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
            children: productProvider.getFoodProductDataList.map(
              (FoodProductData) {
                return SingalFoodProduct(
                  onTap: () {},
                  productImage: FoodProductData.productImage,
                  productName: FoodProductData.productName,
                  productDetails: FoodProductData.productDetails,
                  price: FoodProductData.productPrice,
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildFoodProduct2(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'First Order',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Search(
                        search: productProvider.getFoodProduct1DataList,
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
            children: productProvider.getFoodProduct1DataList.map(
              (FoodProduct1Data) {
                return SingalFoodProduct(
                    onTap: () {},
                    productImage: FoodProduct1Data.productImage,
                    productName: FoodProduct1Data.productName,
                    productDetails: FoodProduct1Data.productDetails,
                    price: FoodProduct1Data.productPrice);
              },
            ).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildFoodProduct3(context) {
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
                        search: productProvider.getFoodProduct2DataList,
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
            children: productProvider.getFoodProduct2DataList.map(
              (FoodProduct2Data) {
                return SingalFoodProduct(
                    onTap: () {},
                    productImage: FoodProduct2Data.productImage,
                    productName: FoodProduct2Data.productName,
                    productDetails: FoodProduct2Data.productDetails,
                    price: FoodProduct2Data.productPrice);
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
    productProvider.fatchFoodProductData();
    productProvider.fatchFoodProduct1Data();
    productProvider.fatchFoodProduct2Data();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    return Scaffold(
      backgroundColor: Color(0xffccbcbcb),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Food',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
            )),
        actions: [
          CircleAvatar(
            radius: 12,
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
              radius: 12,
              backgroundColor: Color(0xffd4d181),
              child: Icon(
                Icons.add_shopping_cart,
                size: 17,
                color: Colors.black,
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
                      'https://images.freekaamaal.com/post_images/1606817930.jpg'),
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
                              'On all Food Products',
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
            _buildFoodProduct1(context),
            _buildFoodProduct2(context),
            _buildFoodProduct3(context),
          ],
        ),
      ),
    );
  }
}
