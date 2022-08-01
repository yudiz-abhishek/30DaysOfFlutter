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
  static List<Item> items;

  //Get Item by Id
  static Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  //Get Item by position
  static Item getByPosition(int pos) => items[pos];
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

  // Factory Method is referred as a creational design pattern which provides an interface for creating objects in a superclass,
  //but allows subclasses to alter the type of objects that will be created. Also known as virtual constructors.
  // ::: IMP :::
  //dynamic: can change TYPE of the variable, & can change VALUE of the variable later in code.
  //var: can't change TYPE of the variable, but can change VALUE of the variable later in code.
  //final: can't change TYPE of the variable, & can't change VALUE of the variable later in code.

  //We can use also the dart class generator extension for generate this decoding and encoding map methods

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }

  //While save to Database this map for encoding data
  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image,
      };
}
