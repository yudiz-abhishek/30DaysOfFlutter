import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';
import 'package:flutter_catalog/widgets/themes.dart';

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
                  Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            ),
          ),
        ));
  }
}

//For Header
class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        "Trending products".text.xl2.make(),
      ],
    );
  }
}

//For Listing Items
class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return CatalogItem(catelog: catalog);
        });
  }
}

//For One Item
class CatalogItem extends StatelessWidget {
  const CatalogItem({
    Key? key,
    required this.catelog,
  })  : assert(catelog != null),
        super(key: key);

  final Item catelog;

  @override
  Widget build(BuildContext context) {
    return VxBox(
            child: Row(
      children: [
        CatalogImage(
          image: catelog.image,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catelog.name.text.lg //lg => textScaleFactor
                .color(MyTheme.darkBluishColor)
                .bold
                .make(),
            catelog.desc.text
                .textStyle(context.captionStyle) //for Caption Style
                .make(),
            10.heightBox, //For Spacing Empty Box
            ButtonBar(
              alignment:
                  MainAxisAlignment.spaceBetween, //For Equal Spacing for both
              buttonPadding: EdgeInsets
                  .zero, //For Right Padding //For Remove Padding (EdgeInsets.zero)
              // For Button Bar
              children: [
                "\$${catelog.price}".text.bold.xl.make(),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(MyTheme.darkBluishColor),
                      shape: MaterialStateProperty.all(
                          StadiumBorder()), //For Give the shpae for Button
                    ),
                    child: "Buy".text.make())
              ],
            ).pOnly(right: 8)
          ],
        ))
      ],
    ))
        .white
        .roundedLg //RoundedLg => Large (Velocity_X)
        .square(150)
        .make()
        .py16();
  }
}

//For Image
class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({
    Key? key,
    required this.image,
  })  : assert(image != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8 //Padding
        .color(MyTheme.creamColor)
        .make()
        .p16()
        .w40(context); //For Width half wHalf same as for width 40
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
