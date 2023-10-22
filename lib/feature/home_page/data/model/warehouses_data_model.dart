// ignore_for_file: must_be_immutable

import 'package:pharmcy_app/feature/home_page/domain/entity/warehouse.dart';

class WarehousesDataModel extends Warehouse {
  WarehousesDataModel(
      {required super.id,
      required super.name,
      required super.city,
      required super.street,
      required super.phone});
  factory WarehousesDataModel.fromJson(Map<String, dynamic> json) {
    return WarehousesDataModel(
        id: json['id'],
        name: json['name_warehouse'],
        city: json['city_warehouse'],
        street: json['street_warehouse'],
        phone: json['phone_warehouse']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_warehouse': name,
      'city_warehouse': city,
      'street_warehouse': street,
      'phone_warehouse': phone
    };
  }
}
