// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class MedCategory extends Equatable {
  int id;
  String name_category;
  MedCategory({required this.id, required this.name_category});
  @override
  List<Object?> get props => [id, name_category];
}
