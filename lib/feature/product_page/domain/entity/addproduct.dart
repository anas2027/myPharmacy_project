// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class AddProduct extends Equatable {
  String name, description, images, price, quantity, pharmacy_id;
  AddProduct(
      {required this.pharmacy_id,
      required this.description,
      required this.images,
      required this.name,
      required this.price,
      required this.quantity});
  @override
  List<Object?> get props => [name, price, quantity, description, images];
}
