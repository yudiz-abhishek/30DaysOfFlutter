// class Item {
//   final String id;
//   final String name;
//   final String desc;
//   final num price;
//   final String color;
//   final String image;

//   Item({this.id, this.name, this.desc, this.price, this.color, this.image});
// }

// final prodcuts = [Item()];

class CatalogModel {
  static final items = [
    Item(
        id: 1,
        name: "iPhone 12 Pro",
        desc: "12th Generation Desc",
        price: 999,
        color: "#33505a",
        image: "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-12-2.jpg")
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
