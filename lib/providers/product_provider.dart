import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:five_star/models/product_models.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  late ProductModel productModel;
  List<ProductModel> search = [];
  productModels(QueryDocumentSnapshot element) {
    productModel = ProductModel(
      productImage: element.get("productImage"),
      productName: element.get("productName"),
      productDetails: element.get("productDetails"),
      productPrice: element.get("productPrice"),
      productId: element.get("productId"),
    );
    search.add(productModel);
  }

  ////////grocery Product 0//////////
  List<ProductModel> groceryProductList = [];

  fatchGroceryProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("GroceryProduct").get();
    value.docs.forEach(
      (element) {
        productModels(element);
        newList.add(productModel);
      },
    );
    groceryProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getGroceryProductDataList {
    return groceryProductList;
  }

  ////////grocery Product 1//////////
  List<ProductModel> groceryProduct1List = [];
  fatchGroceryProduct1Data() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("GroceryProduct1").get();
    value.docs.forEach(
      (element) {
        productModels(element);
        newList.add(productModel);
      },
    );
    groceryProduct1List = newList;
    notifyListeners();
  }

  List<ProductModel> get getGroceryProduct1DataList {
    return groceryProduct1List;
  }

  ////////grocery Product 2//////////
  List<ProductModel> groceryProduct2List = [];
  fatchGroceryProduct2Data() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("GroceryProduct2").get();
    value.docs.forEach(
      (element) {
        productModels(element);
        newList.add(productModel);
      },
    );
    groceryProduct2List = newList;
    notifyListeners();
  }

  List<ProductModel> get getGroceryProduct2DataList {
    return groceryProduct2List;
  }

  ////////food Product 0//////////
  List<ProductModel> foodProductList = [];

  fatchFoodProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("FoodProduct").get();
    value.docs.forEach(
      (element) {
        productModels(element);
        newList.add(productModel);
      },
    );
    foodProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getFoodProductDataList {
    return foodProductList;
  }

  ////////food Product 1//////////
  List<ProductModel> foodProduct1List = [];

  fatchFoodProduct1Data() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("FoodProduct1").get();
    value.docs.forEach(
      (element) {
        productModels(element);
        newList.add(productModel);
      },
    );
    foodProduct1List = newList;
    notifyListeners();
  }

  List<ProductModel> get getFoodProduct1DataList {
    return foodProduct1List;
  }

  ////////food Product 2//////////
  List<ProductModel> foodProduct2List = [];

  fatchFoodProduct2Data() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("FoodProduct2").get();
    value.docs.forEach(
      (element) {
        productModels(element);
        newList.add(productModel);
      },
    );
    foodProduct2List = newList;
    notifyListeners();
  }

  List<ProductModel> get getFoodProduct2DataList {
    return foodProduct2List;
  }

////////////Search Return//////////
  List<ProductModel> get getAllProductSearch {
    return search;
  }
}
