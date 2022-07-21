import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/themes.dart';

import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';

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
        backgroundColor: MyTheme.creamColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m32, //For all EdgeInsets
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().expand() //For Expending list
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}

//For ListView
/*ListView.builder(
                itemCount: CatalogModel.items.length,
                // itemBuilder: (content, index) {
                //   return ItemWidget(
                //     item: CatalogModel.items[index],
                //   );
                // })
                //Using Shorhand operator
                itemBuilder: (content, index) => ItemWidget(
                      item: CatalogModel.items[index],
                    )) */

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

//With Out Velocity_X
/*@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ? GridView.builder(
                //For Fixed Corss Axis Count (Row) (One Row Containt 2 Items)
                //MainAxisSpacing Vertical Spacing (Up-Down Spacing)
                //crossAxisSpacing  (Side by Side Spacing)
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16),
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  //For Grid Tile
                  return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: GridTile(
                        header: Container(
                          child: Text(
                            item.name,
                            style: TextStyle(color: Colors.white),
                          ),
                          padding: const EdgeInsets.all(
                              12), //Once set complier not check again
                          decoration: BoxDecoration(color: Colors.deepPurple),
                        ),
                        child: Image.network(item.image),
                        footer: Container(
                          child: Text(
                            item.price.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          padding: const EdgeInsets.all(
                              12), //Once set complier not check again
                          decoration: BoxDecoration(color: Colors.black),
                        ),
                      ));
                },
                itemCount: CatalogModel.items.length,
              )
            : Center(
                child:
                    CircularProgressIndicator(), //Process Indicator for Loading Data from DB
              ),
      ),
      drawer: MyDrawer(),
    );
  } */
