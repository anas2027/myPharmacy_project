// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:pharmcy_app/feature/drawer/data/drawer_model/most_medcine_sold_model.dart';
import 'package:pharmcy_app/feature/drawer/data/drawer_model/order_descrption_model.dart';
import 'package:pharmcy_app/feature/drawer/data/drawer_model/order_model.dart';
import 'package:pharmcy_app/feature/drawer/data/drawer_model/order_user_descrption_model.dart';
import 'package:pharmcy_app/feature/drawer/data/drawer_model/rachita_model.dart';
import 'package:pharmcy_app/feature/drawer/data/drawer_model/user_order_model.dart';
import 'package:pharmcy_app/feature/drawer/data/drawer_model/wallet_model.dart';
import 'package:http/http.dart' as http;
import 'package:pharmcy_app/feature/drawer/domain/drawer_entity/most_medcine_sold_.dart';

import '../../../../error/exception.dart';

abstract class DrawerRemoteDataSource {
  Future<WalletModel> getwallet({required String ph_id});
  Future<List<OrderModel>> getOrder({required String phId});
  Future<List<OrderDescrptionModel>> getOrderDescrption(
      {required String orderId});
  Future<Unit> cansleConfirmatonOrder({required String orderId});
  Future<Unit> ConfirmatonOrder({required String orderId});
  Future<Unit> deleteOrderDetail({required String deleteorderDetail});
  Future<List<UserOrderModel>> getuserOrder({required String phId});
  Future<List<UserMedcineOrderDetailModel>> getUsermedcineorderDetail(
      {required String orderId});
  Future<List<UserProductOrderDetailModel>> getUserProductorderDetail(
      {required String orderId});
  Future<Unit> confirmUserMedcineOrderDetail({required String orderDetail});
    Future<List<RachitaModel>> getRachitaImage({required String id});
    Future<List<MostMedcineSoldModel>> mostMedcineSold();

}

class DrawerRemoteDataSourceImpl extends DrawerRemoteDataSource {
  final http.Client client;
  DrawerRemoteDataSourceImpl({required this.client});
  @override
  Future<WalletModel> getwallet({required String ph_id}) async {
    String url = 'http://10.0.2.2:8000/api/wallet?ph_id=$ph_id';
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;

      final List<WalletModel> mywalletModels =
          decodeJson.map<WalletModel>((e) => WalletModel.fromJson(e)).toList();
      WalletModel walletModel = WalletModel(
          id: mywalletModels[0].id,
          funds: mywalletModels[0].funds,
          ph_id: mywalletModels[0].ph_id);
   print(walletModel);
      return walletModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<OrderModel>> getOrder({required String phId}) async {
    String url = 'http://10.0.2.2:8000/api/get/order/pharmacy?id=$phId';
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;

      final List<OrderModel> myMedcineModels =
          decodeJson.map<OrderModel>((e) => OrderModel.fromJson(e)).toList();

      return myMedcineModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<OrderDescrptionModel>> getOrderDescrption(
      {required String orderId}) async {
    String url =
        'http://10.0.2.2:8000/api/get/order/detail/pharmacy?id=$orderId';

    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;

      final List<OrderDescrptionModel> myMedcineModels = decodeJson
          .map<OrderDescrptionModel>((e) => OrderDescrptionModel.fromJson(e))
          .toList();

      return myMedcineModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> cansleConfirmatonOrder({required String orderId}) async {
    String url = 'http://10.0.2.2:8000/api/order/acceptforpharmacy';

    final response = await client.post(Uri.parse(url), body: {"id": orderId});
    if (response.statusCode == 200) {
      var body = response.body;
      var jsonbody = jsonDecode(body);
      Get.showSnackbar(
        GetSnackBar(
          isDismissible: true,
          borderRadius: 15,
          message: jsonbody['message'],
          duration: const Duration(seconds: 3),
        ),
      );
      return unit;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> ConfirmatonOrder({required String orderId}) async {
    String url = 'http://10.0.2.2:8000/api/order/acceptforpharmacy';

    final response = await client.post(Uri.parse(url), body: {"id": orderId});
    if (response.statusCode == 200) {
      return unit;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deleteOrderDetail({required String deleteorderDetail}) async {
    String url = 'http://10.0.2.2:8000/api/orderdetail/delete';

    final response =
        await client.delete(Uri.parse(url), body: {"id": deleteorderDetail});
    if (response.statusCode == 200) {
      return unit;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<UserOrderModel>> getuserOrder({required String phId}) async {
    String url = 'http://10.0.2.2:8000/api/view/order?id=$phId';

    final response = await client.get(Uri.parse(url));
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;

      final List<UserOrderModel> myMedcineModels = decodeJson
          .map<UserOrderModel>((e) => UserOrderModel.fromJson(e))
          .toList();

      return myMedcineModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<UserProductOrderDetailModel>> getUserProductorderDetail(
      {required String orderId}) async {
    var body = {"id": orderId};
    String url = 'http://10.0.2.2:8000/api/get/order/product/pharmacy';

    final response = await client.post(Uri.parse(url), body: body);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;

      final List<UserProductOrderDetailModel> myMedcineModels = decodeJson
          .map<UserProductOrderDetailModel>(
              (e) => UserProductOrderDetailModel.fromJson(e))
          .toList();

      return myMedcineModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<UserMedcineOrderDetailModel>> getUsermedcineorderDetail(
      {required String orderId}) async {
    var body = {"id": orderId};
    String url = 'http://10.0.2.2:8000/api/get/order/detail';

    final response = await client.post(Uri.parse(url), body: body);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;

      final List<UserMedcineOrderDetailModel> myMedcineModels = decodeJson
          .map<UserMedcineOrderDetailModel>(
              (e) => UserMedcineOrderDetailModel.fromJson(e))
          .toList();

      return myMedcineModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> confirmUserMedcineOrderDetail(
      {required String orderDetail}) async {
    var body = {"id": orderDetail};
    String url = 'http://10.0.2.2:8000/api/pharmacy/order/details';

    final response = await client.post(Uri.parse(url), body: body);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      Get.showSnackbar(
        GetSnackBar(
          isDismissible: true,
          borderRadius: 15,
          message: 'orderDetail have been confiremd',
          duration: const Duration(seconds: 3),
        ),
      );

      return unit;
    } else {
      throw ServerException();
    }
  }
  @override
  Future<List<RachitaModel>> getRachitaImage({required String id})async {
   String url = 'http://10.0.2.2:8000/api/get/description?id=$id';

    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
       final List decodeJson = json.decode(response.body) as List;

      final List<RachitaModel> myMedcineModels = decodeJson
          .map<RachitaModel>((e) => RachitaModel.fromJson(e))
          .toList();
          return myMedcineModels;
    } else {
      throw ServerException();
    }
  }
  
  @override
  Future<List<MostMedcineSoldModel>> mostMedcineSold() async{
     String url = 'http://10.0.2.2:8000/api/count/med';

    final response = await client.post(Uri.parse(url));

    if (response.statusCode == 200) {
       final List decodeJson = json.decode(response.body) as List;

      final List<MostMedcineSoldModel> myMedcineModels = decodeJson
          .map<MostMedcineSoldModel>((e) => MostMedcineSoldModel.fromJson(e))
          .toList();
          return myMedcineModels;
    } else {
      throw ServerException();
    }
  }
}
