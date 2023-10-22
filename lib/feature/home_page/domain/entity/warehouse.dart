import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Warehouse extends Equatable {
  int id, phone;
  String name, city, street;
  Warehouse(
      {required this.id,
      required this.name,
      required this.city,
      required this.street,
      required this.phone});
  @override
  List<Object?> get props => [id, name, city, street, phone];
}
