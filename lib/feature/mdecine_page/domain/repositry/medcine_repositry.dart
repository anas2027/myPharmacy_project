// ignore_for_file: non_constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:pharmcy_app/feature/mdecine_page/domain/entity/my_medcine.dart';

abstract class MyMedcineRepositry {
  Future<Either<Failure, List<MyMedcine>>> getMyMedcine({required String phId});
  Future<Either<Failure, Unit>> deleteQuantityOfMedcine(
      {required String medId, required String requested_quantity});
      Future<Either<Failure,Unit>> deleteMedcine({required String medId});
  Future<Either<Failure,List<MyMedcine>>>getMedByCategory({required String phId,required String nameCategory});
}
