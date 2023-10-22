// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:pharmcy_app/feature/product_page/data/model/add_or_edit_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../error/exception.dart';
import '../model/product_model_data.dart';
import 'package:http/http.dart' as http;

abstract class ProoductRemoteDataSource {
  Future<List<ProductModelData>> getProduct();
  Future<Unit> addProduct(AddProductDataModel addProductDataModel);
  Future<Unit> editProduct(AddProductDataModel addProductDataModel);
  Future<Unit> deleteProduct(String id);
  Future<Unit> addnewQuantity(String idMed, String newQuantity);
  Future<Unit> deletenewQuantity(String idMed, String newQuantity);
}

class ProductRemoteDataSorurceimpl extends ProoductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSorurceimpl({required this.client});

  @override
  Future<List<ProductModelData>> getProduct() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var idph = sharedPreferences.getString('phId');

    String url = 'http://10.0.2.2:8000/api/product?id=$idph';
    final response = await client.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;

      final List<ProductModelData> WarehouseListResponse = decodeJson
          .map<ProductModelData>((e) => ProductModelData.fromJson(e))
          .toList();
      return WarehouseListResponse;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addProduct(AddProductDataModel addProductDataModel) async {
    var body = {
      'pharmacy_id': addProductDataModel.pharmacy_id,
      'name': addProductDataModel.name,
      'price': addProductDataModel.price,
      'description': addProductDataModel.description,
      'images': addProductDataModel.images,
      'quantity': addProductDataModel.quantity
    };
    String url = 'http://10.0.2.2:8000/api/product';
    final response = await client.post(Uri.parse(url), body: body);

    if (response.statusCode == 200) {
      Get.showSnackbar(
        const GetSnackBar(
          isDismissible: true,
          borderRadius: 15,
          message: 'your product is add sucssuflly ',
          duration: Duration(seconds: 3),
        ),
      );
      Get.offAndToNamed('/MyProduct');

      return unit;
    } else {
      Get.showSnackbar(
        const GetSnackBar(
          isDismissible: true,
          borderRadius: 15,
          message: 'check your internet ',
          duration: Duration(seconds: 3),
        ),
      );
      throw ServerException();
    }
  }

  @override
  Future<Unit> editProduct(AddProductDataModel addProductDataModel) async {
    var body = {
      'id': addProductDataModel.pharmacy_id,
      'name': addProductDataModel.name,
      'price': addProductDataModel.price,
      'description': addProductDataModel.description,
      'images': addProductDataModel.images,
      'quantity': addProductDataModel.quantity
    };
    String url = 'http://10.0.2.2:8000/api/product';
    final response = await client.put(Uri.parse(url), body: body);
    if (response.statusCode == 200) {
      Get.showSnackbar(
        const GetSnackBar(
          isDismissible: true,
          borderRadius: 15,
          message: 'your product is updated sucssuflly ',
          duration: Duration(seconds: 3),
        ),
      );
      Get.offAndToNamed('/MyProduct');
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deleteProduct(String id) async {
    String url = 'http://10.0.2.2:8000/api/product';
    final response = await client.delete(Uri.parse(url), body: {'id': id});
    if (response.statusCode == 200) {
      Get.showSnackbar(
        const GetSnackBar(
          isDismissible: true,
          borderRadius: 15,
          message: 'your product is updated sucssuflly ',
          duration: Duration(seconds: 3),
        ),
      );
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addnewQuantity(String idMed, String newQuantity) async {
    String url = 'http://10.0.2.2:8000/api/product/quantity';
    var body = {'id': idMed, 'new': newQuantity};
    final response = await client.post(Uri.parse(url), body: body);
    if (response.statusCode == 200) {
      Get.showSnackbar(
        const GetSnackBar(
          isDismissible: true,
          borderRadius: 15,
          message: 'your product is updated sucssuflly ',
          duration: Duration(seconds: 3),
        ),
      );
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deletenewQuantity(String idMed, String newQuantity) async {
    String url = 'http://10.0.2.2:8000/api/product_quantity/{id}';
    var body = {'id': idMed, 'requested_quantity': newQuantity};
    final response = await client.post(Uri.parse(url), body: body);
    if (response.statusCode == 200) {
      Get.showSnackbar(
        const GetSnackBar(
          isDismissible: true,
          borderRadius: 15,
          message: 'your product is delte sucssuflly ',
          duration: Duration(seconds: 3),
        ),
      );

      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
