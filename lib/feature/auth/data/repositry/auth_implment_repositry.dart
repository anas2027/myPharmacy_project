// ignore_for_file: unused_local_variable

import 'package:pharmcy_app/error/exception.dart';
import 'package:pharmcy_app/error/network/network_info.dart';
import 'package:pharmcy_app/feature/auth/data/datasource/remote_data_source.dart';
import 'package:pharmcy_app/feature/auth/data/model/login_data_model.dart';
import 'package:pharmcy_app/feature/auth/domain/entity/login.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/feature/auth/domain/repositry/authrepositry.dart';

class AuthRepositryImp implements AuthRepositry {
  final NetworkInfo networkInfo;
  final AuthRemoteDataSorce authRemoteDataSorce;
  AuthRepositryImp(
      {required this.authRemoteDataSorce, required this.networkInfo});

  @override
  Future<Either<Failure, Unit>> login(Login login) async {
    final LoginModel loginModel =
        LoginModel(email: login.email, password: login.password);

    if (await networkInfo.isconnected) {
      try {
        final response = await authRemoteDataSorce.login(loginModel);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
