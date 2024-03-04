class CarModel {
  String? name;
  String? brand;
  String? color;
  String? price;
  String? image;
  String? front;
  String? back;
  String? side1;
  String? side2;
  String? inside;
  String? kilometers;
  String? fuel;
  int? year;
  String? state;
  int? ownership;
  bool? sold;

  CarModel(
      {this.name,
      this.brand,
      this.color,
      this.price,
      this.fuel,
      this.state,
      this.image,
      this.back,
      this.front,
      this.side1,
      this.side2,
      this.inside,
      this.kilometers,
      this.ownership,
      this.sold,
      this.year});

  factory CarModel.fromMap(Map<String,dynamic> map) {
    return CarModel(
        name: map["name"] ?? "",
        brand: map["brand"] ?? "",
        color: map["color"] ?? "",
        price: map["price"] ?? "",
        image: map["image"] ?? "",
        front: map["front"] ?? "",
        back: map["back"] ?? "",
        side1: map["side1"] ?? "",
        side2: map["side2"] ?? "",
        inside: map["inside"] ?? "",
        kilometers: map["kilometers"] ?? "",
        fuel: map["fuel"] ?? "",
        year: map["year"] ?? 0,
        state: map["state"] ?? "",
        ownership: map["ownership"] ?? 0,
        sold: map["sold"] ?? false
    );

  }
}
