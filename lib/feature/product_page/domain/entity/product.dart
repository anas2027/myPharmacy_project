// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Product extends Equatable {
  int id, price, quantity, pharmacy_id;
  String name, description, images;
  Product(
      {required this.id,
      required this.description,
      required this.images,
      required this.name,
      required this.pharmacy_id,
      required this.price,
      required this.quantity});
  @override
  List<Object?> get props =>
      [id, name, price, quantity, description, images, pharmacy_id];
}
