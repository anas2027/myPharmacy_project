// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:equatable/equatable.dart';

class MedpharamcyExpired extends Equatable {
  String name_med, image, descrption, exp;
  int mg, quantity;
  MedpharamcyExpired(
      {required this.name_med,
      required this.image,
      required this.descrption,
      required this.mg,
      required this.exp,
      required this.quantity});
  @override
  List<Object?> get props => [name_med, image, descrption, mg, exp, quantity];
}
