import 'package:pharmcy_app/feature/drawer/domain/drawer_entity/user_order.dart';

class UserOrderModel extends UserOrder {
  UserOrderModel(
      {required super.id,
      required super.name_user,
      required super.city_user,
      required super.street_user,
      required super.phone_user,
      required super.status,
      required super.status_user,
      required super.total_price});
  factory UserOrderModel.fromJson(Map<String, dynamic> json) {
    return UserOrderModel(
        id: json['id'],
        name_user: json['name_user'],
        city_user: json['city_user'],
        street_user: json['street_user'],
        phone_user: json['phone_user'],
        status: json['status'],
        status_user: json['status_user'],
        total_price: json['total_price']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_user': name_user,
      'city_user': city_user,
      'street_user': street_user,
      'phone_user': phone_user,
      'status': status,
      'status_user': status_user,
      'totaxl_price': total_price,
    };
  }
}
