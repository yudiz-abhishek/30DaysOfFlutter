import 'package:flutter_catalog/models/catalog.dart';

class CartModel {
  //Singleton Class
  static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel() =>
      cartModel; //Using factory keyword when we are using cartModel obj it will send us same obj

  //Catalog Fields (private)
  late CatalogModel
      _catalog; //late => declare variables that will be initialized later. These are called non-nullable variables as they are initialized after the declaration.

  //Collection of ids
  final List<int> _itemIds = [];

  //Get catalog public access
  CatalogModel get catalog => _catalog;

  //Setting catalogmodel
  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //Get Items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //Get Total Price
  num get totalPrice => items.fold(
      0,
      (total, current) =>
          total + current.price); //Fold for previousValue and current total

  //Add Item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //Remove Item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
