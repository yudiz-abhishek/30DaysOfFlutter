import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cartModel.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';

//For Add to Cart StateFul Widget
class AddToCart extends StatefulWidget {
  final Item catalog;

  const AddToCart({
    Key? key,
    required this.catalog, //For Required data
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _catelog = CatalogModel(); //_ for private member
  final _cart = CartModel(); //_ for private member

  @override
  Widget build(BuildContext context) {
    bool isInCart =
        _cart.items.contains(widget.catalog); //Same Item conatine in Cart

    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            isInCart = isInCart.toggle();
            _cart.catalog = _catelog;
            _cart.add(widget.catalog);
            setState(() {});
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
          shape: MaterialStateProperty.all(
              StadiumBorder()), //For Give the shpae for Button
        ),
        child:
            isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus));
  }
}
