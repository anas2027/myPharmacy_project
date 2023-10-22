// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class MyMedcine extends Equatable {
  final String name_med, image, exp;
  final int id, mg, price_pharmacy, price_customer, quantity;

  const MyMedcine(
      {required this.id,
      required this.name_med,
      required this.image,
      required this.mg,
      required this.exp,
      required this.price_pharmacy,
      required this.price_customer,
      required this.quantity});
  @override
  List<Object?> get props => [
        id,
        name_med,
        image,
        exp,
        mg,
        quantity,
        price_pharmacy,
        price_customer,
      ];
}
