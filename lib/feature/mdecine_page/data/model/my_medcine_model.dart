// ignore_for_file: non_constant_identifier_names

import 'package:pharmcy_app/feature/mdecine_page/domain/entity/my_medcine.dart';

class PhMedcineModel extends MyMedcine {
  const PhMedcineModel(
      {required super.name_med,
      required super.image,
      required super.mg,
      required super.exp,
      required super.price_pharmacy,
      required super.price_customer,
      required super.quantity,
      required super.id});
  factory PhMedcineModel.fromJson(Map<String, dynamic> json) {
    return PhMedcineModel(
      name_med: json['name_med'],
      image: json['image'],
      mg: json['mg'],
      exp: json['exp'],
      price_pharmacy: json['price_pharmacy'],
      price_customer: json['price_customer'],
      quantity: json['quantity'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_med': name_med,
      'image': image,
      'mg': mg,
      'exp': exp,
      'price_pharmacy': price_pharmacy,
      'price_customer': price_customer,
      'quantity': quantity
    };
  }
}
