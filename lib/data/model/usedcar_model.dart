class UsedCarModel {
  String? name;
  String? brand;
  String? color;
  String? price;
  String? image;
  int? kilometers;
  String? fuel;
  int? year;
  String? state;
  int? ownership;
  bool? sold;

  UsedCarModel(
      {this.name,
      this.brand,
      this.color,
      this.price,
      this.fuel,
      this.state,
        this.image,
      this.kilometers,
      this.ownership,
      this.sold,
      this.year});

  UsedCarModel.fromJson(Map<String, Object?> json) : this (
    name: json["name"] as String,
    brand: json["brand"] as String,
    color: json["color"] as String,
    price: json["price"] as String,
    image: json["image"] as String,
    kilometers: json["kilometers"] as int,
    fuel: json["fuel"] as String,
    year: json["year"] as int,
    state: json["state"] as String,
    ownership: json["ownership"] as int,
    sold: json["sold"] as bool,
  );

  UsedCarModel copyWith({
    String? name,
    String? brand,
    String? color,
    String? price,
    String? image,
    int? kilometers,
    String? fuel,
    int? year,
    String? state,
    int? ownership,
    bool? sold,
}){
    return UsedCarModel(
      name: name ?? this.name,
      brand: brand ?? this.brand,
      color: color ?? this.color,
      price: price ?? this.price,
      image: image ?? this.image,
      kilometers: kilometers ?? this.kilometers,
      fuel: fuel ?? this.fuel,
      year: year ?? this.year,
      state: state ?? this.state,
      ownership: ownership ?? this.ownership,
      sold: sold ?? this.sold
    );
  }

  Map<String, Object?> toJson(){
    return {
      "name" : name,
      "brand" : brand,
      "color" : color,
      "price" : price ,
      "image" : image ,
      "kilometers" : kilometers,
      "fuel" : fuel,
      "year" : year,
      "state" : state,
      "ownership" : ownership,
      "sold" : sold
    };
  }

}
