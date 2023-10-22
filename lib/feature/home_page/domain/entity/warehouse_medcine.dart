// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class WarehouseMedcine extends Equatable {
  final String name, imageUrl, description;
  final int quantity, mg, price_customer, pharmcyPrice, id, status;

  final String exp;
  const WarehouseMedcine({
    required this.id,
    required this.description,
    required this.imageUrl,
    required this.pharmcyPrice,
    required this.exp,
    required this.mg,
    required this.name,
    required this.price_customer,
    required this.quantity,
    required this.status,
  });
  @override
  List<Object?> get props => [
        id,
        name,
        description,
        exp,
        quantity,
        mg,
        price_customer,
        pharmcyPrice,
        imageUrl,
        status
      ];
}
