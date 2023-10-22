// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/feature/drawer/domain/drawer_entity/order.dart';

class OrderModel extends OrderEntity {
  OrderModel(
      {required super.id,
      required super.name_warehouse,
      required super.city_warehouse,
      required super.street_warehouse,
      required super.phone_warehouse,
      required super.status,
      required super.created_at,
      required super.total_price,
      required super.status_user, required super.id_ph, required super.id_warehouse});
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
        id: json['id'],
        name_warehouse: json['name_warehouse'],
        city_warehouse: json['city_warehouse'],
        street_warehouse: json['street_warehouse'],
        phone_warehouse: json['phone_warehouse'],
        status: json['status'],
        created_at: json['created_at'],
        status_user: json['status_user'],
        total_price: json['total_price'], id_ph: json['id_ph'], id_warehouse: json['id_warehouse']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_ph':id_ph,
      'id_warehouse':id_warehouse,
      'name_warehouse': name_warehouse,
      'city_warehouse': city_warehouse,
      'street_warehouse': street_warehouse,
      'phone_warehouse': phone_warehouse,
      'status': status,
      'total_price': total_price,
      'status_user': status_user,
      'created_at': created_at
    };
  }
}
