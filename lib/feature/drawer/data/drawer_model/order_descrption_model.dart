// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:pharmcy_app/feature/drawer/domain/drawer_entity/order_descrption.dart';

class OrderDescrptionModel extends OrderDescrtion {
  OrderDescrptionModel(
      {required super.name_category,
      required super.city_warehouse,
      required super.street_warehouse,
      required super.phone_warehouse,
      required super.exp,
      required super.name_med,
      required super.image,
      required super.mg,
      required super.price_pharmacy,
      required super.price_customer,
      required super.status,
      required super.composition,
      required super.quantity,
      required super.name_warehouse,
      required super.id});

  factory OrderDescrptionModel.fromJson(Map<String, dynamic> json) {
    return OrderDescrptionModel(
      name_category: json['name_category'],
      city_warehouse: json['city_warehouse'],
      street_warehouse: json['street_warehouse'],
      phone_warehouse: json['phone_warehouse'],
      exp: json['exp'],
      name_med: json['name_med'],
      image: json['image'],
      mg: json['mg'],
      price_pharmacy: json['price_pharmacy'],
      price_customer: json['price_customer'],
      status: json['status'],
      composition: json['image'],
      quantity: json['quantity'],
      name_warehouse: json['name_warehouse'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name_category': name_category,
      'city_warehouse': city_warehouse,
      'street_warehouse': street_warehouse,
      'phone_warehouse': phone_warehouse,
      'exp': exp,
      'name_med': name_med,
      'image': image,
      'mg': mg,
      'price_pharmacy': price_pharmacy,
      'price_customer': price_customer,
      'status': status,
      'composition': composition,
      'quantity': quantity,
      'name_warehouse': name_warehouse,
      'id': id
    };
  }
}
