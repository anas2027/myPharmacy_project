// ignore_for_file: non_constant_identifier_names

import 'package:pharmcy_app/feature/product_page/domain/entity/product.dart';

// ignore: must_be_immutable
class ProductModelData extends Product {
  ProductModelData(
      {required super.id,
      required super.description,
      required super.images,
      required super.name,
      required super.pharmacy_id,
      required super.price,
      required super.quantity});
  factory ProductModelData.fromJson(Map<String, dynamic> json) {
    return ProductModelData(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      quantity: json['quantity'],
      description: json['description'],
      images: json['images'],
      pharmacy_id: json['pharmacy_id'],
    );
  }
  // its done hahahahaha
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
      'description': description,
      'images': images,
      'pharmacy_id': pharmacy_id,
    };
  }
}
