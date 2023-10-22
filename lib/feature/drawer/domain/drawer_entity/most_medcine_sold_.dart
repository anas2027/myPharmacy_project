import 'package:equatable/equatable.dart';

class MostMedcineSold  extends Equatable{
  int id,mg,price_pharmacy,price_customer,quantity,status,warehouse_id,category_id;
  String name_med,image,exp,descrption;
  MostMedcineSold({required this.id,required this.name_med,required this.mg,required this.descrption,required this.category_id,required this.exp,required this.image,required this.price_customer,required this.price_pharmacy,required this.quantity,required this.status,required this.warehouse_id });

  @override
  // TODO: implement props
  List<Object?> get props => [id,mg,price_pharmacy,price_customer,quantity,status,warehouse_id,category_id, name_med,image,exp,descrption];
}