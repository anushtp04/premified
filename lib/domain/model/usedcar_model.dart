class UsedCarModel {
  final String name;
  final String id;
  final String brand;
  final String color;
  final String price;
  final String fuel;
  final String state;
  final String image;
  final String back;
  final String front;
  final String side1;
  final String side2;
  final String inside;
  final String kilometers;
  final String ownership;
  final String year;
  final String type;
  final String range;
  final bool sold;

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

  factory UsedCarModel.fromJson(Map<String, dynamic> json) {
    return UsedCarModel(
      name: json['name'] as String,
      id: json['id'] as String,
      brand: json['brand'] as String,
      color: json['color'] as String,
      price: json['price'] as String,
      fuel: json['fuel'] as String,
      state: json['state'] as String,
      image: json['image'] as String,
      back: json['back'] as String,
      front: json['front'] as String,
      side1: json['side1'] as String,
      side2: json['side2'] as String,
      inside: json['inside'] as String,
      kilometers: json['kilometers'] as String,
      ownership: json['ownership'] as String,
      year: json['year'] as String,
      type: json['type'] as String,
      range: json['range'] as String,
      sold: json['sold'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'brand': brand,
      'color': color,
      'price': price,
      'fuel': fuel,
      'state': state,
      'image': image,
      'back': back,
      'front': front,
      'side1': side1,
      'side2': side2,
      'inside': inside,
      'kilometers': kilometers,
      'ownership': ownership,
      'year': year,
      'type': type,
      'range': range,
      'sold': sold,
    };
  }
}
