import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:pharmcy_app/error/exception.dart';
import 'package:pharmcy_app/feature/auth/data/model/login_data_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthRemoteDataSorce {
  Future<Unit> login(LoginModel loginModel);
}

const baseusrl = 'http://10.0.2.2:8000/api/pharmacylogin';

class AuthRemoteDataSourceImpl extends AuthRemoteDataSorce {
  final http.Client client;

  AuthRemoteDataSourceImpl({required this.client});
  @override
  Future<Unit> login(LoginModel loginModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    LoginResponseModel loginResponseModel;
    final body = {'email': loginModel.email, 'password': loginModel.password};
    final response = await client.post(Uri.parse(baseusrl), body: body);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      loginResponseModel = LoginResponseModel(
          id: json['pharmacy']['id'],
          phone: json['pharmacy']['phone'],
          name: json['pharmacy']['name'],
          name_ph: json['pharmacy']['name_ph'],
          email: json['pharmacy']['email'],
          city: json['pharmacy']['city'],
          street: json['pharmacy']['street']);
      sharedPreferences.setString('phId', "${loginResponseModel.id}");
      sharedPreferences.setString('phname', loginResponseModel.name);
      Get.offAndToNamed('/homePage', parameters: {
        'id': '${loginResponseModel.id}',
        'name': loginResponseModel.name,
        'name_ph': loginResponseModel.name_ph,
        'email': loginResponseModel.email,
        'city': loginResponseModel.city,
        'street': loginResponseModel.street
      });
      return Future.value(unit);
    } else {
      Get.showSnackbar(
        const GetSnackBar(
          isDismissible: true,
          borderRadius: 15,
          message: 'email or password is incorrct ',
          duration: Duration(seconds: 3),
        ),
      );
      throw ServerException();
    }
  }
}
