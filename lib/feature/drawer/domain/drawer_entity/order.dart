// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  int id, status,id_ph,id_warehouse, phone_warehouse, status_user;

  String name_warehouse, city_warehouse, street_warehouse, created_at;
  int total_price;
  OrderEntity(
      {required this.id,
      required this.id_warehouse,
      required this.id_ph,
      required this.name_warehouse,
      required this.city_warehouse,
      required this.street_warehouse,
      required this.phone_warehouse,
      required this.total_price,
      required this.status,
      required this.created_at,
      required this.status_user});
  @override
  List<Object?> get props => [
        id,
        name_warehouse,
        city_warehouse,
        street_warehouse,
        phone_warehouse,
        status,
        status_user,
        total_price,
        created_at
      ];
}
