// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catelog;

  const HomeDetailPage({
    Key? key,
    required this.catelog,
  })  : assert(catelog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: catelog.name.text.bold.color(MyTheme.darkBluishColor).make(),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment:
              MainAxisAlignment.spaceBetween, //For Equal Spacing for both
          buttonPadding: EdgeInsets
              .zero, //For Right Padding //For Remove Padding (EdgeInsets.zero)
          // For Button Bar
          children: [
            "\$${catelog.price}".text.bold.xl3.red800.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(context.theme.buttonColor),
                shape: MaterialStateProperty.all(
                    StadiumBorder()), //For Give the shpae for Button
              ),
              child: "Add to cart".text.make(),
            ).wh(120, 50) //For Give Width and Heigh (for Elevated Button)
          ],
        ).p16(),
      ),
      body: SafeArea(
        bottom: false, //For Remove Safe Edge from Bottom area
        child: Column(children: [
          Hero(
            tag: Key(catelog.id.toString()),
            child: Image.network(catelog.image),
          ).h32(context),
          Expanded(
              child: VxArc(
            //for Arc
            height: 30.0,
            edge: VxEdge.TOP, //Arc to Top
            arcType: VxArcType.CONVEY,
            child: Container(
              color: context.cardColor,
              width: context.screenWidth,
              child: Column(
                children: [
                  catelog.name.text.xl2 //lg => textScaleFactor
                      .color(context.accentColor)
                      .bold
                      .make(),
                  catelog.desc.text.xl
                      .textStyle(context.captionStyle) //for Caption Style
                      .make(),
                  10.heightBox, //For Spacing Empty Box
                  "Amet sanctus diam aliquyam tempor amet, nonumy sed ipsum rebum et dolores ea, rebum magna duo sed vero nonumy, labore rebum sanctus ut takimata duo, duo et est et gubergren dolor sed dolores eirmod. Takimata dolor nonumy amet voluptua lorem dolores, sit no ipsum rebum sit, dolor stet erat aliquyam."
                      .text
                      .textStyle(context.captionStyle)
                      .make()
                      .p16()
                ],
              ).py64(),
            ),
          ))
        ]),
      ),
    );
  }
}
