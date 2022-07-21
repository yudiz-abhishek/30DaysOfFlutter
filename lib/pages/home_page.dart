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
  final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final cateloagJosn =
        await rootBundle.loadString("assets/files/catelog.json");
    final decodedData = jsonDecode(cateloagJosn);
    var productData = decodedData["products"];
    print(productData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (content, index) {
            return ItemWidget(
              item: dummyList[index],
            );
          }),
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