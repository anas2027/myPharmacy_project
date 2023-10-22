import 'package:pharmcy_app/feature/drawer/domain/drawer_entity/user_order_detail.dart';

class UserMedcineOrderDetailModel extends UserMedcineOrderDetail {
  UserMedcineOrderDetailModel(
      {required super.id,
      required super.name_med,
      required super.image,
      required super.mg,
      required super.exp,
      required super.descrption,
      required super.price_customer,
      required super.status,
      required super.quantity,
      required super.price,
      required super.name_user,
      required super.city_user,
      required super.street_user,
      required super.phone_user});
  factory UserMedcineOrderDetailModel.fromJson(Map<String, dynamic> json) {
    return UserMedcineOrderDetailModel(
      id: json['id'],
      name_med: json['name_med'],
      image: json['image'],
      mg: json['mg'],
      exp: json['exp'],
      descrption: json['descrption'],
      price_customer: json['price_customer'],
      status: json['status'],
      quantity: json['quantity'],
      price: json['price'],
      name_user: json['name_user'],
      city_user: json['city_user'],
      street_user: json['street_user'],
      phone_user: json['phone_user'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_med': name_med,
      'image': image,
      'mg': mg,
      'exp': exp,
      'descrption': descrption,
      'price_customer': price_customer,
      'status': status,
      'quantity': quantity,
      'price': price,
      'name_user': name_user,
      'city_user': city_user,
      'street_user': street_user,
      'phone_user': phone_user
    };
  }
}

class UserProductOrderDetailModel extends UserProductOrderDetail {
  UserProductOrderDetailModel(
      {required super.id,
      required super.name,
      required super.images,
      required super.description,
      required super.price,
      required super.status,
      required super.quantity,
      required super.user_id,
      required super.name_user,
      required super.city_user,
      required super.street_user,
      required super.phone_user});
  factory UserProductOrderDetailModel.fromJson(Map<String, dynamic> json) {
    return UserProductOrderDetailModel(
      id: json['id'],
      name: json['name'],
      images: json['images'],
      description: json['description'],
      price: json['price'],
      status: json['status'],
      quantity: json['quantity'],
      user_id: json['user_id'],
      name_user: json['name_user'],
      city_user: json['city_user'],
      street_user: json['street_user'],
      phone_user: json['phone_user'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'images': images,
      'description': description,
      'price': price,
      'status': status,
      'quantity': quantity,
      'user_id': user_id,
      'name_user': name_user,
      'city_user': status,
      'street_user': street_user,
      'phone_user': phone_user,
    };
  }
}
