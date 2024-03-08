import '../entities/usedcar_entity.dart';

class UsedCarModel {
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

  UsedCarModel({
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

  UsedCarEntity toEntity() {
    return UsedCarEntity(
      name:  name,
      brand: brand,
      color: color,
      price: price,
      image: image,
      front: front,
      back:  back,
      side1: side1,
      side2: side2,
     inside: inside,
 kilometers: kilometers,
      fuel:  fuel,
      year:  year,
      state: state,
  ownership: ownership,
      sold:  sold,
      isFavourite:  isFavourite,
    );
  }

  static UsedCarModel fromEntity(UsedCarEntity entity){
    return UsedCarModel(
      name:  entity.name,
      brand: entity.brand,
      color: entity.color,
      price: entity.price,
      image: entity.image,
      front: entity.front,
      back:  entity.back,
      side1: entity.side1,
      side2: entity.side2,
      inside: entity.inside,
      kilometers: entity.kilometers,
      fuel:  entity.fuel,
      year:  entity.year,
      state: entity.state,
      ownership: entity.ownership,
      sold:  entity.sold,
      isFavourite:  entity.isFavourite,
    );
  }

}
