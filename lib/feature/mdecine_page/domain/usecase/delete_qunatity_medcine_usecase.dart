// ignore_for_file: non_constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:pharmcy_app/error/failure.dart';
import 'package:pharmcy_app/feature/mdecine_page/domain/repositry/medcine_repositry.dart';

class DeleteQuantityOfMedcine {
  MyMedcineRepositry medcineRepositry;
  DeleteQuantityOfMedcine({required this.medcineRepositry});
  Future<Either<Failure, Unit>> call(
      {required String medId, required String requested_quantity}) async {
    return await medcineRepositry.deleteQuantityOfMedcine(
        medId: medId, requested_quantity: requested_quantity);
  }
}
