// ignore_for_file: non_constant_identifier_names

import 'package:pharmcy_app/feature/mdecine_page/data/remotedatasource/remote_data_source.dart';
import 'package:pharmcy_app/feature/mdecine_page/domain/entity/my_medcine.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/feature/mdecine_page/domain/repositry/medcine_repositry.dart';

import '../../../../error/exception.dart';
import '../../../../error/network/network_info.dart';

class MyMedcineRepoImpl extends MyMedcineRepositry {
  final NetworkInfo networkInfo;
  final MyMedcineRemoteDataSource myMedcineReomteDataSource;
  MyMedcineRepoImpl(
      {required this.myMedcineReomteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, List<MyMedcine>>> getMyMedcine(
      {required String phId}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine =
            await myMedcineReomteDataSource.GetMymedcineModel(phId: phId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine =
            await myMedcineReomteDataSource.GetMymedcineModel(phId: phId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteQuantityOfMedcine(
      {required String medId, required String requested_quantity}) async {
    if (await networkInfo.isconnected) {
      try {
        final remoteMedcine =
            await myMedcineReomteDataSource.deleteQuantityOfMedcine(
                medId: medId, requested_quantity: requested_quantity);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine =
            await myMedcineReomteDataSource.deleteQuantityOfMedcine(
                medId: medId, requested_quantity: requested_quantity);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }
  
  @override
  Future<Either<Failure, Unit>> deleteMedcine({required String medId})async {
 if (await networkInfo.isconnected) {
      try {
        final remoteMedcine =
            await myMedcineReomteDataSource.deleteMedcine(
               medID: medId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine =
              await myMedcineReomteDataSource.deleteMedcine(
               medID: medId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }
  
  @override
  Future<Either<Failure, List<MyMedcine>>> getMedByCategory({required String phId, required String nameCategory}) async{
   if (await networkInfo.isconnected) {
      try {
        final remoteMedcine =
            await myMedcineReomteDataSource.GetMymedcineModelByCategory(
               nameCategory: nameCategory,phId: phId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteMedcine =
              await myMedcineReomteDataSource.GetMymedcineModelByCategory(
               nameCategory: nameCategory,phId: phId);
        return Right(remoteMedcine);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }
}
