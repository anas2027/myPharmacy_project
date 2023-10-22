import 'package:equatable/equatable.dart';

class Rachita extends Equatable {

int id,ordetal_id;
String description;
  Rachita({required this.description,required this.id,required this.ordetal_id});
  @override
  // TODO: implement props
  List<Object?> get props =>[id,ordetal_id,description];


}