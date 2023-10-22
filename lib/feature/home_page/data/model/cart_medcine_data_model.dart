// ignore_for_file: non_constant_identifier_names

import 'package:pharmcy_app/feature/home_page/domain/entity/cart_medcine.dart';

// ignore: must_be_immutable
class CartMedcineModel extends CartMedcine {
  CartMedcineModel(
      {required super.name_med,
      required super.image,
      required super.mg,
      required super.exp,
      required super.price_pharmacy,
      required super.price_customer,
      required super.status,
      required super.city_warehouse,
      required super.id,
      required super.name_category,
      required super.name_warehouse,
      required super.quantity,
      required super.street_warehouse,
      required super.phone_warehouse});

  factory CartMedcineModel.fromJson(Map<String, dynamic> json) {
    return CartMedcineModel(
      name_med: json['name_med'],
      image: json['image'],
      mg: json['mg'],
      exp: json['exp'],
      price_pharmacy: json['price_pharmacy'],
      price_customer: json['price_customer'],
      status: json['status'],
      phone_warehouse: json['phone_warehouse'],
      city_warehouse: json['city_warehouse'],
      id: json['id'],
      name_category: json['name_category'],
      name_warehouse: json['name_warehouse'],
      quantity: json['quantity'],
      street_warehouse: json['street_warehouse'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name_med': name_med,
      'image': image,
      'mg': mg,
      'exp': exp,
      'price_pharmacy': price_pharmacy,
      'price_customer': price_customer,
      'status': status,
      'phone_warehouse': phone_warehouse,
      'city_warehouse': city_warehouse,
      'id': id,
      'name_category': name_category,
      'name_warehouse': name_warehouse,
      'quantity': quantity,
      'street_warehouse': street_warehouse
    };
  }
}
