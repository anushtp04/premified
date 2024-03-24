
class UsedCarModel {
  String name;
  String id;
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
  String type;
  String range;
  bool   sold;

  UsedCarModel copyWith({
    String? name,
    String? brand,
    String? color,
    String? id,
    String? price,
    String? image,
    String? front,
    String? back,
    String? side1,
    String? side2,
    String? inside,
    String? kilometers,
    String? fuel,
    String? year,
    String? state,
    String? type,
    String? range,
    String? ownership,
    bool? sold,
  }) {
    return UsedCarModel(
      name: name ?? this.name,
      brand: brand ?? this.brand,
      color: color ?? this.color,
      id: id ?? this.id,
      price: price ?? this.price,
      fuel: fuel ?? this.fuel,
      state: state ?? this.state,
      image: image ?? this.image,
      back: back ?? this.back,
      front: front ?? this.front,
      side1: side1 ?? this.side1,
      side2: side2 ?? this.side2,
      inside: inside ?? this.inside,
      kilometers: kilometers ?? this.kilometers,
      ownership: ownership ?? this.ownership,
      type: type ?? this.type,
      range: range ?? this.range,
      year: year ?? this.year,
      sold: sold ?? this.sold,
    );
  }



  UsedCarModel({
    required this.name,
    required this.id,
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
    required this.type,
    required this.range,
    required this.sold,
  });
  Map<String, Object?> toDocument() {
    return {
      "name": name,
      "brand": brand,
      "color": color,
      "id": id,
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
      "type": type,
      "range": range,
      "sold": sold,
    };
  }

  static UsedCarModel fromDocument(Map<String, dynamic> doc) {
    return UsedCarModel(
      name: doc["name"],
      brand: doc["brand"],
      id: doc["id"],
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
      type: doc["type"],
      range : doc["range"],
      sold: doc["sold"],
    );
  }
}
