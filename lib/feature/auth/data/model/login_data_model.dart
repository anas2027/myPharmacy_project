// ignore_for_file: prefer_const_constructors_in_immutables, non_constant_identifier_names

import 'package:pharmcy_app/feature/auth/domain/entity/login.dart';
import 'package:pharmcy_app/feature/auth/domain/entity/login_response.dart';

class LoginModel extends Login {
  LoginModel({required super.email, required super.password});
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(email: json['email'], password: json['password']);
  }

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
}

class LoginResponseModel extends LoginReponse {
  LoginResponseModel(
      {required super.id,
      required super.phone,
      required super.name,
      required super.name_ph,
      required super.email,
      required super.city,
      required super.street});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
        email: json['email'],
        name: json['name'],
        city: json['city'],
        id: json['id'],
        name_ph: json['name_ph'],
        phone: json['phone'],
        street: json['street']);
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'city': city,
      'id': id,
      'name_ph': name_ph,
      'phone': phone,
      'street': street
    };
  }
}
