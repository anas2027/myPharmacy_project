import 'package:equatable/equatable.dart';

class UserOrder extends Equatable {
  int id, status, phone_user, status_user, total_price;
  String street_user, name_user, city_user;

  UserOrder(
      {required this.id,
      required this.name_user,
      required this.city_user,
      required this.street_user,
      required this.phone_user,
      required this.status,
      required this.status_user,
      required this.total_price});
  @override
  List<Object?> get props => [
        id,
        name_user,
        city_user,
        street_user,
        phone_user,
        status,
        status_user,
        total_price
      ];
}
