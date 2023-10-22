// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:pharmcy_app/error/exception.dart';
import 'package:http/http.dart' as http;
import 'package:pharmcy_app/feature/mdecine_page/data/model/my_medcine_model.dart';

abstract class MyMedcineRemoteDataSource {
  Future<List<PhMedcineModel>> GetMymedcineModel({required String phId});
  Future<Unit> deleteQuantityOfMedcine(
      {required String medId, required String requested_quantity});
      Future<Unit>deleteMedcine({required String medID});
     Future<List<PhMedcineModel>> GetMymedcineModelByCategory({required String phId,required String nameCategory});
}

const baseurl = 'http://10.0.2.2:8000/api';

class MyMedcineRemoteDataSourceImpl extends MyMedcineRemoteDataSource {
  final http.Client client;

  MyMedcineRemoteDataSourceImpl({required this.client});
  @override
  Future<List<PhMedcineModel>> GetMymedcineModel({required String phId}) async {
    String uri = 'http://10.0.2.2:8000/api/get/med';
    final body = {'ph_id': phId};
    final response = await client.post(Uri.parse(uri), body: body);
    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;

      final List<PhMedcineModel> myMedcineModels = decodeJson
          .map<PhMedcineModel>((e) => PhMedcineModel.fromJson(e))
          .toList();

      return myMedcineModels;
    } else {
      return throw ServerException();
    }
  }

  @override
  Future<Unit> deleteQuantityOfMedcine(
      {required String medId, required String requested_quantity}) async {
    String uri = 'http://10.0.2.2:8000/api/med_pharmacies/{id}/deduct_quantity';
    final body = {'id': medId, 'requested_quantity': requested_quantity};
    final response = await client.post(Uri.parse(uri), body: body);
    if (response.statusCode == 200) {
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
      return throw ServerException();
    }
  }
  
  @override
  Future<Unit> deleteMedcine({required String medID}) async{
   String uri = 'http://10.0.2.2:8000/api/med_pharmacies';
    final response = await client.delete(Uri.parse(uri), body: {'id':medID});
    print(response.statusCode);
    if (response.statusCode == 200) {
     Get.showSnackbar(
        const GetSnackBar(
          isDismissible: true,
          borderRadius: 15,
          message: 'Your Medcien is deleted',
          duration: Duration(seconds: 3),
        ),
      );

      return unit;
    } else {
      return throw ServerException();
    }
  }
  
  @override
  Future<List<PhMedcineModel>> GetMymedcineModelByCategory({required String phId, required String nameCategory}) async{
    String uri = 'http://10.0.2.2:8000/api/getmedPharmacybycategory';
    final response = await client.post(Uri.parse(uri), body: {'id':phId,'name':nameCategory});
    print(response.statusCode);
    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;

      final List<PhMedcineModel> myMedcineModels = decodeJson
          .map<PhMedcineModel>((e) => PhMedcineModel.fromJson(e))
          .toList();


      return myMedcineModels;
    } else {
      return throw ServerException();
    }
  }
}
