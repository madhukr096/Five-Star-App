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
                    price: FoodProductData.productPrice);
              },
            ).toList(),

            /*children: [ SingalGroceryProduct(
                  onTap: () {},
                  productImage:
                      'https://freepngimg.com/thumb/coconut/10-2-coconut-png-clipart.png',
                  productName: 'Coconut',
                  productDetails: '1 pc-22',
                  price: '22'),
              SingalGroceryProduct(
                productImage:
                    'https://freepngimg.com/thumb/onion/33971-5-red-onion-clipart.png',
                productName: 'Onion',
                productDetails: '1kg-19rs',
                price: '19',
                onTap: () {},
              ),
              SingalGroceryProduct(
                productImage:
                    'https://freepngimg.com/thumb/potato/11-potato-png-images-pictures-download.png',
                productName: 'Potato',
                productDetails: '1kg-70',
                price: '70',
                onTap: () {},
              ),
              SingalGroceryProduct(
                productImage:
                    'https://i.pinimg.com/originals/3c/42/5a/3c425a418d2c6b4670ee7d47c799a80d.png',
                productName: 'Green Chilli',
                productDetails: '1kg-Rs:100',
                price: '100',
                onTap: () {},
              ),
            ],*/
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
            /*children: [
              SingalGroceryProduct(
                onTap: () {},
                productImage:
                    'https://www.pngmart.com/files/15/Fresh-Beans-Vegetable-Transparent-PNG.png',
                productName: 'Stringless Beans',
                productDetails: '1kg-20',
                price: '20',
              ),
              SingalGroceryProduct(
                productImage:
                    'https://pngimg.com/uploads/carrot/carrot_PNG4985.png',
                productName: 'Carrot',
                productDetails: '1kg-Rs:29',
                price: '29',
                onTap: () {},
              ),
              SingalGroceryProduct(
                productImage:
                    'https://purepng.com/public/uploads/large/purepng.com-tomatovegetables-tomato-941524727884qqxpa.png',
                productName: 'Tomato',
                productDetails: '1kg-54',
                price: '54',
                onTap: () {},
              ),
              SingalGroceryProduct(
                productImage:
                    'https://freepngimg.com/thumb/ladyfinger/42370-2-lady-finger-png-free-photo.png',
                productName: 'Ladies Finger',
                productDetails: '1kg-Rs.32',
                price: '32',
                onTap: () {},
              ),
            ],*/
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
            /*children: [
              SingalGroceryProduct(
                onTap: () {},
                productImage:
                    'https://proofmart.com/wp-content/uploads/2021/06/112.png',
                productName: 'Curry Leaves',
                productDetails: '50g/200g-Rs:15',
                price: '15',
              ),
              SingalGroceryProduct(
                productImage:
                    'http://assets.stickpng.com/images/58bf1e87e443f41d77c734b6.png',
                productName: 'Coriander Leaf ',
                productDetails: '50g/200g-Rs:20',
                price: '20',
                onTap: () {},
              ),
              SingalGroceryProduct(
                productImage:
                    'https://pngimg.com/uploads/cauliflower/cauliflower_PNG12679.png',
                productName: 'Cauliflower ',
                productDetails: '600g/1000g-Rs:27',
                price: '27',
                onTap: () {},
              ),
              SingalGroceryProduct(
                productImage:
                    'https://www.seekpng.com/png/full/94-942323_cabbage-png-free-download-cabbage-png.png',
                productName: 'Cabbage',
                productDetails: '600g/1000g-Rs:17',
                price: '17',
                onTap: () {},
              ),
              SingalGroceryProduct(
                productImage:
                    'https://cdn.pixabay.com/photo/2020/01/06/06/13/anethum-4744673__340.png',
                productName: 'Dill Leaves',
                productDetails: '1pc-Rs:20',
                price: '20',
                onTap: () {},
              ),
            ],*/
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
