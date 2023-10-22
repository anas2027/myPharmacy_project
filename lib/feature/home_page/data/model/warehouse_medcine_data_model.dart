// ignore_for_file: non_constant_identifier_names

import 'package:pharmcy_app/feature/home_page/domain/entity/warehouse_medcine.dart';

class WarehouseMedcineModel extends WarehouseMedcine {
  const WarehouseMedcineModel(
      {required super.exp,
      required super.mg,
      required super.name,
      required super.price_customer,
      required super.quantity,
      required super.imageUrl,
      required super.pharmcyPrice,
      required super.description,
      required super.id,
      required super.status});
  factory WarehouseMedcineModel.fromJson(Map<String, dynamic> json) {
    return WarehouseMedcineModel(
        name: json['name_med'],
        description: json['descrption'],
        imageUrl: json['image'],
        mg: json['mg'],
        exp: json['exp'],
        quantity: json['quantity'],
        price_customer: json['price_customer'],
        pharmcyPrice: json['price_pharmacy'],
        id: json['id'],
        status: json['status']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'exp': exp,
      'mg': mg,
      'price_customer': price_customer,
      'quantity': quantity,
      'image': imageUrl,
      'price_pharmacy': pharmcyPrice,
      'status': status
    };
  }
}
