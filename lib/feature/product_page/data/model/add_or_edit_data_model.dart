// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:pharmcy_app/feature/product_page/domain/entity/addproduct.dart';

class AddProductDataModel extends AddProduct {
  AddProductDataModel(
      {required super.description,
      required super.images,
      required super.name,
      required super.price,
      required super.quantity,
      required super.pharmacy_id});

  factory AddProductDataModel.fromJson(Map<String, dynamic> json) {
    return AddProductDataModel(
      pharmacy_id: json['pharmacy_id'],
      name: json['name'],
      price: json['price'],
      quantity: json['quantity'],
      description: json['description'],
      images: json['images'],
    );
  }
  // its done hahahahaha
  Map<String, dynamic> toJson() {
    return {
      'pharmacy_id': pharmacy_id,
      'name': name,
      'price': price,
      'quantity': quantity,
      'description': description,
      'images': images,
    };
  }
}
