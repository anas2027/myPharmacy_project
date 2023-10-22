// ignore_for_file: must_be_immutable

import 'package:pharmcy_app/feature/home_page/domain/entity/medpharamcy_expired.dart';

class MedpharamcyExpiredModel extends MedpharamcyExpired {
  MedpharamcyExpiredModel(
      {required super.name_med,
      required super.image,
      required super.descrption,
      required super.mg,
      required super.exp,
      required super.quantity});

  factory MedpharamcyExpiredModel.fromJson(Map<String, dynamic> json) {
    return MedpharamcyExpiredModel(
        name_med: json['name_med'],
        image: json['image'],
        descrption: json['descrption'],
        mg: json['mg'],
        exp: json['exp'],
        quantity: json['quantity']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name_med': name_med,
      'image': image,
      'descrption': descrption,
      'mg': mg,
      'exp': exp,
      'quantity': quantity
    };
  }
}
