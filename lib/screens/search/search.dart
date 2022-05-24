import 'package:five_star/config/color.dart';
import 'package:five_star/models/product_models.dart';
import 'package:five_star/widgets/single_item.dart';
import 'package:flutter/material.dart';

enum SinginCharcter { lowToHigh, highToLow, alphabeticaly }

class Search extends StatefulWidget {
  final List<ProductModel> search;
  Search({required this.search});
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String query = "";

  var _charcter = SinginCharcter.alphabeticaly;
  List<ProductModel> searchItem(String query) {
    List<ProductModel> searchFood = widget.search.where((element) {
      return element.productName.toLowerCase().contains(query);
    }).toList();
    return searchFood;
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> _searchItem = searchItem(query);
    void bottomSheet() => showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(30),
            ),
          ),
          builder: (context) {
            return Column(
              // mainAxisAlignment: MainAxisAlignment.min,
              children: <Widget>[
                ListTile(
                  title: new Text(
                    'Sort By',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                RadioListTile(
                  value: SinginCharcter,
                  groupValue: _charcter,
                  title: Text("Price - Low to High"),
                  onChanged: (vav) {
                    setState(() {
                      _charcter = SinginCharcter.lowToHigh;
                    });
                    Navigator.of(context).pop();
                  },
                ),
                RadioListTile(
                  value: SinginCharcter,
                  groupValue: _charcter,
                  title: Text("Price - High to Low"),
                  onChanged: (vav) {
                    setState(() {
                      _charcter = SinginCharcter.highToLow;
                    });
                    Navigator.of(context).pop();
                  },
                ),
                RadioListTile(
                  value: SinginCharcter,
                  groupValue: _charcter,
                  title: Text("Alphabeticaly"),
                  onChanged: (vav) {
                    setState(() {
                      _charcter = SinginCharcter.alphabeticaly;
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Search",
          style: TextStyle(
            color: textColor,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                bottomSheet();
              },
              icon: Icon(Icons.sort),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Items'),
          ),
          Container(
            height: 52,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: Color(0xffc2c2c2),
                filled: true,
                hintText: "Search for items in the store",
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: _searchItem.map((data) {
              return SingleItem(
                  isBool: false,
                  productImage: data.productImage,
                  productName: data.productName,
                  productId: data.productId,
                  productPrice: data.productPrice);
            }).toList(),
          ),
        ],
      ),
    );
  }
}
