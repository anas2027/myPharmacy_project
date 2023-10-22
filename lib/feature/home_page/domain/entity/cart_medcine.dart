// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:equatable/equatable.dart';

class CartMedcine extends Equatable {
  String name_med,
      image,
      exp,
      name_warehouse,
      street_warehouse,
      city_warehouse,
      name_category;
  int mg, price_pharmacy, price_customer, phone_warehouse, status, id, quantity;

  CartMedcine({
    required this.name_med,
    required this.image,
    required this.mg,
    required this.exp,
    required this.price_pharmacy,
    required this.price_customer,
    required this.status,
    required this.city_warehouse,
    required this.id,
    required this.phone_warehouse,
    required this.name_category,
    required this.name_warehouse,
    required this.quantity,
    required this.street_warehouse,
  });
  @override
  List<Object?> get props => [
        name_med,
        image,
        mg,
        exp,
        price_pharmacy,
        price_customer,
        status,
        city_warehouse,
        name_category,
        name_warehouse,
        quantity,
        street_warehouse
      ];
}
