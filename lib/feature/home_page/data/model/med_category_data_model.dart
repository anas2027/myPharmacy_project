// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:pharmcy_app/feature/home_page/domain/entity/category.dart';

class MedCategoryDataModel extends MedCategory {
  MedCategoryDataModel({required super.id, required super.name_category});
  factory MedCategoryDataModel.fromJson(Map<String, dynamic> json) {
    return MedCategoryDataModel(
        id: json['id'], name_category: json['name_category']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_category': name_category,
    };
  }
}
