// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:equatable/equatable.dart';

class OrderDescrtion extends Equatable {
  String name_warehouse,
      city_warehouse,
      street_warehouse,
      name_med,
      image,
      composition,
      exp,
      name_category;

  int phone_warehouse, mg, price_pharmacy, price_customer, status, quantity, id;

  OrderDescrtion(
      {required this.id,
      required this.name_category,
      required this.city_warehouse,
      required this.street_warehouse,
      required this.phone_warehouse,
      required this.exp,
      required this.name_med,
      required this.image,
      required this.mg,
      required this.price_pharmacy,
      required this.price_customer,
      required this.status,
      required this.composition,
      required this.quantity,
      required this.name_warehouse});
  @override
  List<Object?> get props => [
        name_category,
        city_warehouse,
        street_warehouse,
        phone_warehouse,
        exp,
        name_med,
        image,
        mg,
        id,
        price_pharmacy,
        price_customer,
        status,
        composition,
        status,
        street_warehouse
      ];
}
