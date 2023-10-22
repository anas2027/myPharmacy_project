// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:pharmcy_app/error/exception.dart';
import 'package:http/http.dart' as http;
import 'package:pharmcy_app/feature/home_page/data/model/med_category_data_model.dart';
import 'package:pharmcy_app/feature/home_page/data/model/medpharamcyexpired_model.dart';
import 'package:pharmcy_app/feature/home_page/data/model/warehouse_medcine_data_model.dart';
import 'package:pharmcy_app/feature/home_page/data/model/warehouses_data_model.dart';
import '../model/cart_medcine_data_model.dart';

abstract class HomeRemoteDataSorce {
  Future<List<WarehousesDataModel>> getwarehouse();
  Future<List<WarehouseMedcineModel>> getMyMed(int warehouse);
  Future<int> createOrder({required String idph, required String idwarehouse});
  Future<Unit> addMedcineToOrder(
      {required String orderid,
      required String quqntity,
      required String medcineId});
  Future<List<CartMedcineModel>> getCartMedcine({required String orderId});
  Future<Unit> ConfirmCartMedcine({required String orderId});
  Future<List<MedCategoryDataModel>> getMedCategor();
  Future<List<WarehouseMedcineModel>> getWarehouseMedcinebyCategor(
      {required String categoryName, required String warehouseID});
  Future<Unit> deleteOrder({required String orderId});
  Future<List<WarehousesDataModel>> getwarehousebyCategoru(
      {required String category});
  Future<int> getTotalPrice({required String orderId});
  Future<List<WarehousesDataModel>> getWarehouseByCity({required String city});
  Future<List<MedpharamcyExpiredModel>> getMedpharamcyExpired(
      {required String phId});
  Future<List<MedpharamcyExpiredModel>> getMedpharamcyEmpty(
      {required String phId});
  Future<List<WarehousesDataModel>> getWarehouseById({required String id});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSorce {
  final http.Client client;

  HomeRemoteDataSourceImpl({required this.client});

  @override
  Future<List<WarehousesDataModel>> getwarehouse() async {
    String url = 'http://10.0.2.2:8000/api/warehouse';
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;

      final List<WarehousesDataModel> WarehouseListResponse = decodeJson
          .map<WarehousesDataModel>((e) => WarehousesDataModel.fromJson(e))
          .toList();
      return WarehouseListResponse;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<WarehouseMedcineModel>> getMyMed(int warehouse) async {
    String url = 'http://10.0.2.2:8000/api/med';

    final response =
        await client.post(Uri.parse(url), body: {'warehouse_id': '$warehouse'});
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;

      final List<WarehouseMedcineModel> myMedcineModels = decodeJson
          .map<WarehouseMedcineModel>((e) => WarehouseMedcineModel.fromJson(e))
          .toList();

      return myMedcineModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<int> createOrder(
      {required String idph, required String idwarehouse}) async {
    String url = 'http://10.0.2.2:8000/api/addorder';
    var body = {'id_ph': idph, 'id_warehouse': idwarehouse};
    final response = await client.post(Uri.parse(url), body: body);
    if (response.statusCode == 200) {
      var decodeJson = jsonDecode(response.body);
      int oderid = decodeJson['orders']['id'];
      String warehouseid = decodeJson['orders']['id_warehouse'];

      Get.showSnackbar(
        const GetSnackBar(
          isDismissible: true,
          borderRadius: 15,
          message: 'your order is created sucssuflly you can add med',
          duration: Duration(seconds: 3),
        ),
      );
      return oderid;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addMedcineToOrder(
      {required String orderid,
      required String quqntity,
      required String medcineId}) async {
    String url = 'http://10.0.2.2:8000/api/order/details';
    var body = {
      'order_id': orderid,
      'quantity': quqntity,
      'medicine_id': medcineId
    };
    final response = await client.post(Uri.parse(url), body: body);
       
    if (response.statusCode == 200) {
      var myresponse = jsonDecode(response.body);

      '$myresponse' == "{message: This quantity is not available}"
          ? Get.showSnackbar(
              GetSnackBar(
                isDismissible: true,
                borderRadius: 15,
                message: response.body,
                duration: const Duration(seconds: 3),
              ),
            )
          : Get.showSnackbar(
              const GetSnackBar(
                isDismissible: true,
                borderRadius: 15,
                message: 'Medcine Add sucssfly to your cart',
                duration: Duration(seconds: 3),
              ),
            );
      return unit;
    } else {
      Get.showSnackbar(
        GetSnackBar(
          isDismissible: true,
          borderRadius: 15,
          message: response.body,
          duration: const Duration(seconds: 3),
        ),
      );
      throw ServerException();
    }
  }

  @override
  Future<List<CartMedcineModel>> getCartMedcine(
      {required String orderId}) async {
    String url =
        'http://10.0.2.2:8000/api/get/order/detail/pharmacy?id=$orderId';

    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;

      final List<CartMedcineModel> myMedcineModels = decodeJson
          .map<CartMedcineModel>((e) => CartMedcineModel.fromJson(e))
          .toList();

      return myMedcineModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> ConfirmCartMedcine({required String orderId}) async {
    String url = 'http://10.0.2.2:8000/api/order/acceptforpharmacy';
    var body = {
      'id': orderId,
    };

    final response = await client.post(Uri.parse(url), body: body);
    if (response.statusCode == 200) {
      Get.offAndToNamed('/homePage');
      Get.showSnackbar(
        const GetSnackBar(
          isDismissible: true,
          borderRadius: 15,
          message: 'your order is confirmed succssufly',
          duration: Duration(seconds: 3),
        ),
      );
      return unit;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MedCategoryDataModel>> getMedCategor() async {
    String url = 'http://10.0.2.2:8000/api/Category/all';

    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;

      final List<MedCategoryDataModel> myMedcineModels = decodeJson
          .map<MedCategoryDataModel>((e) => MedCategoryDataModel.fromJson(e))
          .toList();

      return myMedcineModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<WarehouseMedcineModel>> getWarehouseMedcinebyCategor(
      {required String categoryName, required String warehouseID}) async {
    String url =
        'http://10.0.2.2:8000/api/getmedcineCategory?category=$categoryName&id=$warehouseID';

    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;

      final List<WarehouseMedcineModel> myMedcineModels = decodeJson
          .map<WarehouseMedcineModel>((e) => WarehouseMedcineModel.fromJson(e))
          .toList();

      return myMedcineModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deleteOrder({required String orderId}) async {
    String url = 'http://10.0.2.2:8000/api/order/delete';

    final response = await client.delete(Uri.parse(url), body: {'id': orderId});

    if (response.statusCode == 200) {
      Get.offAndToNamed('/homePage');
      return unit;
    } else {
      print(response.body);
      Get.showSnackbar(
        const GetSnackBar(
          isDismissible: true,
          borderRadius: 15,
          message: 'check you internt to delete the order',
          duration: Duration(seconds: 15),
        ),
      );
      throw ServerException();
    }
  }

  @override
  Future<List<WarehousesDataModel>> getwarehousebyCategoru(
      {required String category}) async {
    String url = 'http://10.0.2.2:8000/api/order/delete';

    final response =
        await client.delete(Uri.parse(url), body: {'category': category});
    print(response.body);
    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;

      final List<WarehousesDataModel> WarehouseListResponse = decodeJson
          .map<WarehousesDataModel>((e) => WarehousesDataModel.fromJson(e))
          .toList();
      return WarehouseListResponse;
    } else {
      Get.showSnackbar(
        const GetSnackBar(
          isDismissible: true,
          borderRadius: 15,
          message: 'check you internt to delete the order',
          duration: Duration(seconds: 3),
        ),
      );
      throw ServerException();
    }
  }

  @override
  Future<int> getTotalPrice({required String orderId}) async {
    String url = 'http://10.0.2.2:8000/api/get/total';

    final response = await client.post(Uri.parse(url), body: {'id': orderId});

    if (response.statusCode == 200) {
      var jsonresponse = jsonDecode(response.body);
      return jsonresponse;
    } else {
      Get.showSnackbar(
        const GetSnackBar(
          isDismissible: true,
          borderRadius: 15,
          message: 'check you internt to delete the order',
          duration: Duration(seconds: 3),
        ),
      );
      throw ServerException();
    }
  }

  @override
  Future<List<WarehousesDataModel>> getWarehouseByCity(
      {required String city}) async {
    String url = 'http://10.0.2.2:8000/api/get/warehouse/city';

    final response = await client.post(Uri.parse(url), body: {'city': city});

    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;

      final List<WarehousesDataModel> WarehouseListResponse = decodeJson
          .map<WarehousesDataModel>((e) => WarehousesDataModel.fromJson(e))
          .toList();
      return WarehouseListResponse;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MedpharamcyExpiredModel>> getMedpharamcyExpired(
      {required String phId}) async {
    String url =
        'http://10.0.2.2:8000/api/med_pharmacies/exp?id=$phId';

    final response = await client.get(
      Uri.parse(url),
    );
    print(response.body);
    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;

      final List<MedpharamcyExpiredModel> medcineAboutToExpierd = decodeJson
          .map<MedpharamcyExpiredModel>(
              (e) => MedpharamcyExpiredModel.fromJson(e))
          .toList();
      return medcineAboutToExpierd;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MedpharamcyExpiredModel>> getMedpharamcyEmpty(
      {required String phId}) async {
    String url =
        'http://10.0.2.2:8000/api/med_pharmacies/notification?id=$phId';

    final response = await client.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;

      final List<MedpharamcyExpiredModel> medcineAboutToExpierd = decodeJson
          .map<MedpharamcyExpiredModel>(
              (e) => MedpharamcyExpiredModel.fromJson(e))
          .toList();
      return medcineAboutToExpierd;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<WarehousesDataModel>> getWarehouseById(
      {required String id}) async {
    String url = 'http://10.0.2.2:8000/api/warehouseinfo';

    final response = await client.post(Uri.parse(url), body: {'id': id});

    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;

      final List<WarehousesDataModel> medcineAboutToExpierd = decodeJson
          .map<WarehousesDataModel>((e) => WarehousesDataModel.fromJson(e))
          .toList();
      return medcineAboutToExpierd;
    } else {
      throw ServerException();
    }
  }
}
