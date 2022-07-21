import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import '../widgets/drawer.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;
  final String name = "Abhishek";
  //For Dummy List with same items
  // final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    //For Dealy and check for null data
    await Future.delayed(Duration(seconds: 2));
    final cateloagJosn =
        await rootBundle.loadString("assets/files/catelog.json");
    final decodedData = jsonDecode(cateloagJosn);
    var productData = decodedData["products"];
    // List<Item> list =
    // List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    //For Storing this Data
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ? ListView.builder(
                itemCount: CatalogModel.items.length,
                // itemBuilder: (content, index) {
                //   return ItemWidget(
                //     item: CatalogModel.items[index],
                //   );
                // })
                //Using Shorhand operator
                itemBuilder: (content, index) => ItemWidget(
                      item: CatalogModel.items[index],
                    ))
            : Center(
                child:
                    CircularProgressIndicator(), //Process Indicator for Loading Data from DB
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}

//Only For this Page but give it to whole app we need to give it in themeData appBarTheme, bottomAppBarColor, etc
// appBar: AppBar(
//   backgroundColor: Colors.white,
//   elevation: 0.0,
//   iconTheme: IconThemeData(color: Colors.black),
//   title: Text(
//     "Catalog App",
//     style: TextStyle(color: Colors.black),
//   ),
// )
