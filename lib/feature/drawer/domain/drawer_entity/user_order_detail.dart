import 'package:equatable/equatable.dart';

class UserMedcineOrderDetail extends Equatable {
  String name_med, image, exp, descrption, name_user, city_user, street_user;
  int id, mg, price_customer, status, quantity, price, phone_user;
  UserMedcineOrderDetail({
    required this.id,
    required this.name_med,
    required this.image,
    required this.mg,
    required this.exp,
    required this.descrption,
    required this.price_customer,
    required this.status,
    required this.quantity,
    required this.price,
    required this.name_user,
    required this.city_user,
    required this.street_user,
    required this.phone_user,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name_med,
        image,
        exp,
        descrption,
        name_user,
        city_user,
        street_user,
        mg,
        price_customer,
        status,
        quantity,
        price,
        phone_user
      ];
}

class UserProductOrderDetail extends Equatable {
  int id, price, status, quantity, user_id, phone_user;
  String name, images, description, name_user, city_user, street_user;

  UserProductOrderDetail(
      {required this.id,
      required this.name,
      required this.images,
      required this.description,
      required this.price,
      required this.status,
      required this.quantity,
      required this.user_id,
      required this.name_user,
      required this.city_user,
      required this.street_user,
      required this.phone_user});
  @override
  List<Object?> get props => [
        id,
        name,
        images,
        description,
        price,
        status,
        quantity,
        user_id,
        name_user,
        city_user,
        street_user,
        phone_user
      ];
}
