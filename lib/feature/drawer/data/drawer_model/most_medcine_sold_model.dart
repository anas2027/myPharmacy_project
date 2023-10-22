import 'package:pharmcy_app/feature/drawer/domain/drawer_entity/most_medcine_sold_.dart';

class MostMedcineSoldModel extends MostMedcineSold{
  MostMedcineSoldModel({required super.id, required super.name_med, required super.mg, required super.descrption, required super.category_id, required super.exp, required super.image, required super.price_customer, required super.price_pharmacy, required super.quantity, required super.status, required super.warehouse_id});
 

  factory MostMedcineSoldModel.fromJson(Map<String, dynamic> json) {
    return MostMedcineSoldModel(
     id:json['id'],
     category_id: json['category_id'],
     descrption: json['descrption'],
     warehouse_id: json['warehouse_id'],
      exp: json['exp'],
      name_med: json['name_med'],
      image: json['image'],
      mg: json['mg'],
      price_pharmacy: json['price_pharmacy'],
      price_customer: json['price_customer'],
      status: json['status'],
      quantity: json['quantity'],


    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category_id': category_id,
      'descrption': descrption,
      'warehouse_id': warehouse_id,
      'exp': exp,
      'name_med': name_med,
      'image': image,
      'mg': mg,
      'price_pharmacy': price_pharmacy,
      'price_customer': price_customer,
      'status': status,
      'quantity': quantity,


    };
  }
}