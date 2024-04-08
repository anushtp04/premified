// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usedcar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UsedCarModelImpl _$$UsedCarModelImplFromJson(Map<String, dynamic> json) =>
    _$UsedCarModelImpl(
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

Map<String, dynamic> _$$UsedCarModelImplToJson(_$UsedCarModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'brand': instance.brand,
      'color': instance.color,
      'price': instance.price,
      'fuel': instance.fuel,
      'state': instance.state,
      'image': instance.image,
      'back': instance.back,
      'front': instance.front,
      'side1': instance.side1,
      'side2': instance.side2,
      'inside': instance.inside,
      'kilometers': instance.kilometers,
      'ownership': instance.ownership,
      'year': instance.year,
      'type': instance.type,
      'range': instance.range,
      'sold': instance.sold,
    };
