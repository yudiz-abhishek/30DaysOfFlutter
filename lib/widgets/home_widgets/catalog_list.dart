import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/home_detail_page.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';
import '../../widgets/themes.dart';
import 'catalog_image.dart';

//For Listing Items
class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.getByPosition(index);
          return InkWell(
              //For On Tap Event InkWell
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeDetailPage(
                          catelog:
                              catalog))), //For Passing Data using Navigator push MatericalPageRoute
              child: CatalogItem(catelog: catalog));
        });
  }
}

//For One Item (List)
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
        Hero(
          tag: Key(catelog.id.toString()),
          child: CatalogImage(
            image: catelog.image,
          ),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catelog.name.text.lg //lg => textScaleFactor
                .color(context.accentColor)
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
                          MaterialStateProperty.all(context.theme.buttonColor),
                      shape: MaterialStateProperty.all(
                          StadiumBorder()), //For Give the shpae for Button
                    ),
                    child: "Add to cart".text.make())
              ],
            ).pOnly(right: 8)
          ],
        ))
      ],
    ))
        .color(context.cardColor)
        .roundedLg //RoundedLg => Large (Velocity_X)
        .square(150)
        .make()
        .py16();
  }
}
