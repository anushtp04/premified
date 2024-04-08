import 'package:freezed_annotation/freezed_annotation.dart';

part 'usedcar_model.freezed.dart';
part 'usedcar_model.g.dart';

@freezed
abstract class UsedCarModel with _$UsedCarModel {
  factory UsedCarModel({
    required String name,
    required String id,
    required String brand,
    required String color,
    required String price,
    required String fuel,
    required String state,
    required String image,
    required String back,
    required String front,
    required String side1,
    required String side2,
    required String inside,
    required String kilometers,
    required String ownership,
    required String year,
    required String type,
    required String range,
    required bool sold,
  }) = _UsedCarModel;

  factory UsedCarModel.fromJson(Map<String, dynamic> json) =>
      _$UsedCarModelFromJson(json);
}
