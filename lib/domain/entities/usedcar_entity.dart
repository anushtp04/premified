class UsedCarEntity {
  String name;
  String brand;
  String color;
  String price;
  String image;
  String front;
  String back;
  String side1;
  String side2;
  String inside;
  String kilometers;
  String fuel;
  String year;
  String state;
  String ownership;
  bool sold;
  bool isFavourite;

  UsedCarEntity({
    required this.name,
    required this.brand,
    required this.color,
    required this.price,
    required this.fuel,
    required this.state,
    required this.image,
    required this.back,
    required this.front,
    required this.side1,
    required this.side2,
    required this.inside,
    required this.kilometers,
    required this.ownership,
    required this.year,
    required this.sold,
    required this.isFavourite,
  });

  Map<String, Object?> toDocument() {
    return {
      "name": name,
      "brand": brand,
      "color": color,
      "price": price,
      "fuel": fuel,
      "state": state,
      "image": image,
      "back": back,
      "front": front,
      "side1": side1,
      "side2": side2,
      "inside": inside,
      "kilometers": kilometers,
      "ownership": ownership,
      "year": year,
      "sold": sold,
      "isFavourite": isFavourite,
    };
  }

  static UsedCarEntity fromDocument(Map<String, dynamic> doc) {
    return UsedCarEntity(
      name: doc["name"],
      brand: doc["brand"],
      color: doc["color"],
      price: doc["price"],
      fuel: doc["fuel"],
      state: doc["state"],
      image: doc["image"],
      back: doc["back"],
      front: doc["front"],
      side1: doc["side1"],
      side2: doc["side2"],
      inside: doc["inside"],
      kilometers: doc["kilometers"],
      ownership: doc["ownership"],
      year: doc["year"],
      sold: doc["sold"],
      isFavourite: doc["isFavourite"],
    );
  }
}